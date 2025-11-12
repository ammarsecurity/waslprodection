<template>
    <component :is="$route.meta.layout">
        <RouterView />
    </component>
</template>


<script setup>
import axios from 'axios';
import { onMounted, onBeforeUnmount, watch } from 'vue';
import { useAuth } from './stores/AuthStore';
import { useMaster } from './stores/MasterStore';
import { useChat } from './stores/ChatStore';
import { useRoute } from 'vue-router';
import { subscribeToChannel } from './utils/pusherClient';

const authStore = useAuth();
const masterStore = useMaster();
const chatStore = useChat();
const route = useRoute();
let unsubscribeFromPusher = null;

// const callLastSeenUpdater = async () => {
//     await axios.post('/update-last-seen', {}, {
//         headers: {
//             "Content-Type": "application/json",
//             Accept: "application/json",
//             Authorization: authStore.token,
//         },
//     });
// };

// const startLastSeenUpdater = () => {
//     startLastSeenUpdater.intervalId = setInterval(callLastSeenUpdater, 10 * 60 * 1000);
// };

watch(() => authStore.token, () => {
    if (authStore.token) {
        // startLastSeenUpdater();
        // callLastSeenUpdater();
    } else {
        // clearInterval(startLastSeenUpdater.intervalId);
    }
});


const fetchUnreadMessages = async () => {
    const response = await axios.get('/unread-messages', {
        params: {
            user_id: authStore.user?.id,
        }
    });

    chatStore.unreadMessages = response.data.data?.unread_messages;
};


const bindChatChannel = async () => {
    const key = masterStore.pusher_app_key;
    const cluster = masterStore.pusher_app_cluster;
    const userId = authStore.user?.id;

    if (unsubscribeFromPusher) {
        unsubscribeFromPusher();
        unsubscribeFromPusher = null;
    }

    if (!key || !userId) {
        return;
    }

    try {
        unsubscribeFromPusher = await subscribeToChannel(
            { key, cluster },
            `chat_user_${userId}`,
            'send-message-to-user',
            () => {
                if (route.path !== '/massages') {
                    chatStore.activeShop = null;
                    fetchUnreadMessages();
                }
            }
        );
    } catch (error) {
        console.error('Failed to initialise chat channel', error);
    }
};

onMounted(() => {
    // startLastSeenUpdater(); // Start interval
    // callLastSeenUpdater();  // Immediate call on mount
    bindChatChannel();
});

onBeforeUnmount(() => {
    if (unsubscribeFromPusher) {
        unsubscribeFromPusher();
        unsubscribeFromPusher = null;
    }
    if (typeof startLastSeenUpdater !== 'undefined' && startLastSeenUpdater?.intervalId) {
        clearInterval(startLastSeenUpdater.intervalId);
    }
});

watch(
    () => ({
        key: masterStore.pusher_app_key,
        cluster: masterStore.pusher_app_cluster,
        userId: authStore.user?.id,
    }),
    () => {
        bindChatChannel();
    },
    { immediate: false }
);
</script>
