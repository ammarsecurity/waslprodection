let pusherConstructorPromise = null;
let activeClient = null;
let activeSignature = null;

const DEFAULT_OPTIONS = {
    encrypted: true,
};

async function loadPusherConstructor() {
    if (!pusherConstructorPromise) {
        pusherConstructorPromise = import("pusher-js").then((module) => module.default ?? module);
    }

    return pusherConstructorPromise;
}

function createSignature({ key, cluster, options }) {
    return JSON.stringify({
        key,
        cluster,
        options,
    });
}

export async function getPusherClient({ key, cluster, ...options } = {}) {
    if (!key) {
        return null;
    }

    const normalizedOptions = { ...DEFAULT_OPTIONS, cluster, ...options };
    const signature = createSignature({ key, cluster, options: normalizedOptions });

    if (!activeClient || activeSignature !== signature) {
        if (activeClient) {
            try {
                activeClient.disconnect();
            } catch (error) {
                console.warn("Failed to disconnect previous Pusher client", error);
            }
        }

        const Pusher = await loadPusherConstructor();
        activeClient = new Pusher(key, normalizedOptions);
        activeSignature = signature;
    }

    return activeClient;
}

export async function subscribeToChannel(
    { key, cluster, options } = {},
    channelName,
    eventName,
    handler
) {
    const client = await getPusherClient({ key, cluster, ...options });

    if (!client) {
        return () => {};
    }

    const channel = client.channel(channelName) ?? client.subscribe(channelName);
    if (handler) {
        channel.bind(eventName, handler);
    }

    return () => {
        if (handler) {
            channel.unbind(eventName, handler);
        }

        if (client) {
            try {
                client.unsubscribe(channelName);
            } catch {
                // ignore
            }
        }
    };
}

export function disconnectPusher() {
    if (activeClient) {
        try {
            activeClient.disconnect();
        } catch {
            // ignore
        } finally {
            activeClient = null;
            activeSignature = null;
        }
    }
}
