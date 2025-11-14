import { defineConfig } from "vite";
import laravel from "laravel-vite-plugin";
import vue from "@vitejs/plugin-vue";
import path from "path";
import { fileURLToPath } from "url";

const __dirname = path.dirname(fileURLToPath(import.meta.url));

const chunkGroups = {
    framework: ["vue", "vue-router", "pinia", "pinia-plugin-persistedstate", "vue-i18n"],
    ui: ["@headlessui/vue", "@heroicons/vue", "vue-select", "vue-awesome-paginate", "vue-toastification"],
    realtime: ["pusher-js"],
    media: ["swiper", "lightgallery"],
    utilities: ["axios", "dayjs", "dompurify"],
    icons: [
        "@fortawesome/fontawesome-svg-core",
        "@fortawesome/free-solid-svg-icons",
        "@fortawesome/free-brands-svg-icons",
        "@fortawesome/free-regular-svg-icons",
    ],
};

const manualChunks = (id) => {
    if (!id.includes("node_modules")) {
        return;
    }

    for (const [name, packages] of Object.entries(chunkGroups)) {
        if (packages.some((pkg) => {
            // Match exact package name or scoped package
            const pkgPath = pkg.startsWith("@") ? pkg : `/${pkg}/`;
            return id.includes(`/node_modules/${pkgPath}`);
        })) {
            return name;
        }
    }

    return "vendor";
};

export default defineConfig({
    plugins: [
        vue(),
        laravel({
            input: ["resources/css/app.css", "resources/js/app.js"],
            refresh: true,
        }),
    ],
    resolve: {
        alias: {
            "@": path.resolve(__dirname, "resources/js"),
        },
    },
    build: {
        chunkSizeWarningLimit: 1000,
        rollupOptions: {
            output: {
                manualChunks,
            },
        },
    },
    optimizeDeps: {
        include: ["axios", "dayjs", "pinia", "pinia-plugin-persistedstate", "vue-i18n"],
        exclude: ["pusher-js"],
    },
});
