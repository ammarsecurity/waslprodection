<template>
    <router-link :to="routeUrl" class="w-full">
        <div
            class="category-card-wrapper">
            <div class="category-image-container">
                <img :src="props.category?.thumbnail"
                    class="category-image" loading="lazy" />
            </div>
            <div class="category-name-wrapper">
                <span class="category-name">
                    {{ props.category?.name }}
                </span>
            </div>
        </div>
    </router-link>
</template>

<script setup>
import { useRoute } from 'vue-router';
import { ref, onMounted } from 'vue';

const route = useRoute();

const props = defineProps({
    category: Object
});

const routeUrl = ref(`/categories/${props.category?.id}`);

onMounted(() => {
    if (route.name === 'shop-detail') {
        routeUrl.value = `/shops/${route.params.id}/categories/${props.category?.id}`
    }
});

</script>

<style scoped>
.category-card-wrapper {
    padding: 1.25rem;
    background: linear-gradient(135deg, #ffffff 0%, #fafafa 100%);
    border-radius: 20px;
    border: 2px solid #e5e7eb;
    transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
    display: flex;
    flex-direction: column;
    align-items: center;
    gap: 1rem;
    height: 100%;
    min-height: 160px;
    position: relative;
    overflow: hidden;
    box-shadow: 
        0 2px 8px rgba(0, 0, 0, 0.04),
        0 1px 3px rgba(0, 0, 0, 0.02);
}

.category-card-wrapper::before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    height: 3px;
    background: linear-gradient(90deg, 
        rgba(59, 130, 246, 0.6) 0%, 
        rgba(139, 92, 246, 0.6) 50%, 
        rgba(59, 130, 246, 0.6) 100%);
    opacity: 0;
    transition: opacity 0.3s ease;
}

.category-card-wrapper:hover {
    border-color: rgba(59, 130, 246, 0.4);
    box-shadow: 
        0 12px 28px rgba(0, 0, 0, 0.12),
        0 4px 12px rgba(59, 130, 246, 0.15);
    transform: translateY(-4px);
    background: linear-gradient(135deg, #ffffff 0%, #f8fafc 100%);
}

.category-card-wrapper:hover::before {
    opacity: 1;
}

.category-image-container {
    width: 100%;
    height: 100px;
    display: flex;
    align-items: center;
    justify-content: center;
    background: linear-gradient(135deg, #f8fafc 0%, #f1f5f9 50%, #e2e8f0 100%);
    border-radius: 16px;
    padding: 1rem;
    overflow: hidden;
    position: relative;
    box-shadow: 
        inset 0 2px 4px rgba(0, 0, 0, 0.04),
        0 2px 8px rgba(0, 0, 0, 0.06);
    border: 1px solid rgba(226, 232, 240, 0.8);
}

.category-image-container::after {
    content: '';
    position: absolute;
    inset: 0;
    border-radius: 16px;
    background: linear-gradient(135deg, 
        rgba(255, 255, 255, 0.3) 0%, 
        transparent 50%,
        rgba(255, 255, 255, 0.1) 100%);
    pointer-events: none;
}

@media (min-width: 640px) {
    .category-image-container {
        height: 120px;
        padding: 1.25rem;
    }
}

@media (min-width: 1024px) {
    .category-image-container {
        height: 110px;
        padding: 1rem;
    }
}

@media (min-width: 1280px) {
    .category-image-container {
        height: 120px;
        padding: 1.25rem;
    }
}

.category-card-wrapper:hover .category-image-container {
    background: linear-gradient(135deg, #ffffff 0%, #f8fafc 50%, #f1f5f9 100%);
    box-shadow: 
        inset 0 2px 6px rgba(0, 0, 0, 0.06),
        0 4px 12px rgba(59, 130, 246, 0.2);
    border-color: rgba(59, 130, 246, 0.3);
}

.category-image {
    width: 100%;
    height: 100%;
    object-fit: contain;
    transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
    filter: drop-shadow(0 2px 4px rgba(0, 0, 0, 0.1));
    position: relative;
    z-index: 1;
}

.category-card-wrapper:hover .category-image {
    transform: scale(1.15) translateY(-2px);
    filter: drop-shadow(0 4px 8px rgba(0, 0, 0, 0.15));
}

.category-name-wrapper {
    width: 100%;
    display: flex;
    align-items: center;
    justify-content: center;
    min-height: 44px;
    padding: 0 0.5rem;
}

.category-name {
    font-size: 0.875rem;
    font-weight: 600;
    color: #1f2937;
    text-align: center;
    line-height: 1.5;
    word-wrap: break-word;
    word-break: break-word;
    display: -webkit-box;
    -webkit-line-clamp: 2;
    line-clamp: 2;
    -webkit-box-orient: vertical;
    overflow: hidden;
    transition: all 0.3s ease;
    letter-spacing: -0.01em;
}

@media (min-width: 640px) {
    .category-name {
        font-size: 0.9375rem;
    }
}

@media (min-width: 1024px) {
    .category-name {
        font-size: 0.875rem;
        -webkit-line-clamp: 2;
        line-clamp: 2;
    }
}

@media (min-width: 1280px) {
    .category-name {
        font-size: 0.8125rem;
        -webkit-line-clamp: 2;
        line-clamp: 2;
    }
}

.category-card-wrapper:hover .category-name {
    color: rgba(59, 130, 246, 1);
    font-weight: 700;
}
</style>
