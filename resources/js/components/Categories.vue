<template>
    <div class="main-container mt-6 mb-12">
        <div v-if="!isLoading" class="categories-section">
            <div class="section-header">
                <h2 class="section-title">
                    <span class="title-icon">
                        <svg class="w-6 h-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6a2 2 0 012-2h2a2 2 0 012 2v2a2 2 0 01-2 2H6a2 2 0 01-2-2V6zM14 6a2 2 0 012-2h2a2 2 0 012 2v2a2 2 0 01-2 2h-2a2 2 0 01-2-2V6zM4 16a2 2 0 012-2h2a2 2 0 012 2v2a2 2 0 01-2 2H6a2 2 0 01-2-2v-2zM14 16a2 2 0 012-2h2a2 2 0 012 2v2a2 2 0 01-2 2h-2a2 2 0 01-2-2v-2z"/>
                        </svg>
                    </span>
                    {{ $t('Categories') }}
                </h2>
                <div class="categories-controls">
                    <button @click="scrollCategories('left')" class="scroll-btn scroll-left" :disabled="canScrollLeft">
                        <svg class="w-5 h-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 19l-7-7 7-7"/>
                        </svg>
                    </button>
                    <router-link to="/categories" class="view-all-btn">
                        {{ $t('View All') }}
                    </router-link>
                    <button @click="scrollCategories('right')" class="scroll-btn scroll-right" :disabled="canScrollRight">
                        <svg class="w-5 h-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5l7 7-7 7"/>
                        </svg>
                    </button>
                </div>
            </div>

            <div v-if="isLoading" class="categories-loading">
                <div v-for="i in 8" :key="i" class="category-skeleton">
                    <div class="skeleton-icon"></div>
                    <div class="skeleton-text"></div>
                </div>
            </div>

            <div v-else class="categories-container" ref="categoriesContainer">
                <div class="categories-wrapper">
                    <div v-for="category in categories" 
                         :key="category.id" 
                         class="category-item"
                         @click="selectCategory(category)">
                        <div class="category-content">
                            <div class="category-icon">
                                <img :src="category.thumbnail" :alt="category.name" loading="lazy">
                            </div>
                            <span class="category-name">{{ category.name }}</span>
                            <span class="category-count" v-if="category.products_count">{{ category.products_count }}</span>
                        </div>
                        <div class="category-indicator"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script setup>
import { ref, onMounted, nextTick, watch } from 'vue';
import { useRouter } from 'vue-router';
import CategoryCard from './CategoryCard.vue';
import SkeletonLoader from './SkeletonLoader.vue';
import { useMaster } from '../stores/MasterStore';

const master = useMaster();
const router = useRouter();

const props = defineProps({
    categories: Array,
    isLoading: {
        type: Boolean,
        default: true
    }
});

// Refs for scrolling
const categoriesContainer = ref(null);

// Scroll state
const canScrollLeft = ref(false);
const canScrollRight = ref(true);

const selectCategory = (category) => {
    router.push(`/categories/${category.id}`);
};

// Scroll functions for categories
const scrollCategories = (direction) => {
    if (!categoriesContainer.value) return;
    
    const container = categoriesContainer.value;
    const scrollAmount = 200;
    const isRTL = master.langDirection === 'rtl';
    
    if (direction === 'left') {
        container.scrollLeft += isRTL ? scrollAmount : -scrollAmount;
    } else {
        container.scrollLeft += isRTL ? -scrollAmount : scrollAmount;
    }
    
    updateScrollButtons();
};

// Update scroll button states for categories
const updateScrollButtons = () => {
    if (!categoriesContainer.value) return;
    
    const container = categoriesContainer.value;
    const isRTL = master.langDirection === 'rtl';
    
    if (isRTL) {
        // For RTL, scrollLeft is negative or zero
        canScrollLeft.value = Math.abs(container.scrollLeft) < (container.scrollWidth - container.clientWidth);
        canScrollRight.value = container.scrollLeft < 0;
    } else {
        // For LTR, normal behavior
        canScrollLeft.value = container.scrollLeft > 0;
        canScrollRight.value = container.scrollLeft < (container.scrollWidth - container.clientWidth);
    }
};

// Watch for container changes and update scroll buttons
watch(() => props.categories, () => {
    nextTick(() => {
        updateScrollButtons();
    });
}, { deep: true });

onMounted(() => {
    nextTick(() => {
        if (categoriesContainer.value) {
            categoriesContainer.value.addEventListener('scroll', updateScrollButtons);
        }
    });
});
</script>

<style scoped>
/* Categories Section */
.categories-section {
    margin-top: 1.5rem;
}

.section-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 1.5rem;
    flex-wrap: wrap;
    gap: 1rem;
}

.section-title {
    font-size: 1.25rem;
    font-weight: 700;
    color: #1f2937;
    display: flex;
    align-items: center;
    gap: 0.5rem;
}

.title-icon {
    display: flex;
    align-items: center;
    color: rgb(var(--primary-rgb));
}

.categories-controls {
    display: flex;
    gap: 0.5rem;
    align-items: center;
}

.scroll-btn {
    background: white;
    border: 1px solid #e5e7eb;
    border-radius: 8px;
    padding: 0.5rem;
    cursor: pointer;
    transition: all 0.2s ease;
    color: #6b7280;
    display: flex;
    align-items: center;
    justify-content: center;
    flex-shrink: 0;
    width: 36px;
    height: 36px;
}

.scroll-btn:hover:not(:disabled) {
    background: #f3f4f6;
    border-color: #d1d5db;
    color: #374151;
}

.scroll-btn:disabled {
    opacity: 0.4;
    cursor: not-allowed;
}

.view-all-btn {
    padding: 0.5rem 1rem;
    background: rgb(var(--primary-rgb));
    color: white;
    border-radius: 8px;
    font-size: 0.875rem;
    font-weight: 500;
    text-decoration: none;
    transition: all 0.2s ease;
}

.view-all-btn:hover {
    background: rgba(var(--primary-rgb), 0.9);
    transform: translateY(-1px);
}

.categories-loading {
    display: flex;
    gap: 1rem;
    overflow-x: auto;
    padding: 0.5rem 0;
}

.category-skeleton {
    display: flex;
    flex-direction: column;
    align-items: center;
    gap: 0.5rem;
    width: 120px;
    flex-shrink: 0;
}

.skeleton-icon {
    width: 48px;
    height: 48px;
    background: #e5e7eb;
    border-radius: 12px;
    animation: pulse 1.5s infinite ease-in-out;
}

.skeleton-text {
    width: 80px;
    height: 12px;
    background: #e5e7eb;
    border-radius: 6px;
    animation: pulse 1.5s infinite ease-in-out;
}

.categories-container {
    overflow-x: auto;
    scrollbar-width: none;
    -ms-overflow-style: none;
    scroll-behavior: smooth;
}

.categories-container::-webkit-scrollbar {
    display: none;
}

.categories-wrapper {
    display: flex;
    gap: 1rem;
    padding: 0.5rem 0;
}

[dir="rtl"] .categories-wrapper {
    direction: rtl;
}

[dir="ltr"] .categories-wrapper {
    direction: ltr;
}

.category-item {
    position: relative;
    padding: 1rem;
    background: white;
    border: 2px solid #e5e7eb;
    border-radius: 16px;
    cursor: pointer;
    transition: all 0.3s cubic-bezier(0.175, 0.885, 0.32, 1.275);
    overflow: hidden;
    flex-shrink: 0;
    width: 120px;
    min-height: 120px;
}

.category-item:hover {
    transform: translateY(-4px);
    box-shadow: 0 8px 20px rgba(0, 0, 0, 0.08);
    border-color: rgba(var(--primary-rgb), 0.3);
}

.category-content {
    position: relative;
    display: flex;
    flex-direction: column;
    align-items: center;
    gap: 0.75rem;
    z-index: 2;
    height: 100%;
    justify-content: center;
}

.category-icon {
    position: relative;
    width: 48px;
    height: 48px;
    border-radius: 12px;
    overflow: hidden;
    background: #f9fafb;
    padding: 8px;
    display: flex;
    align-items: center;
    justify-content: center;
}

.category-icon img {
    width: 100%;
    height: 100%;
    object-fit: contain;
}

.category-name {
    font-weight: 600;
    font-size: 0.875rem;
    color: #374151;
    text-align: center;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
    width: 100%;
}

.category-count {
    font-size: 0.75rem;
    color: #6b7280;
    background: #f3f4f6;
    padding: 0.25rem 0.5rem;
    border-radius: 12px;
    font-weight: 500;
}

.category-indicator {
    position: absolute;
    bottom: 0;
    left: 50%;
    transform: translateX(-50%);
    width: 0;
    height: 3px;
    background: linear-gradient(90deg, 
        rgb(var(--primary-rgb)),
        rgba(var(--primary-rgb), 0.7)
    );
    border-radius: 2px;
    transition: width 0.3s ease;
}

.category-item:hover .category-indicator {
    width: 100%;
}

/* Responsive Design */
@media (max-width: 768px) {
    .section-header {
        flex-direction: column;
        align-items: flex-start;
        gap: 0.75rem;
    }
    
    .categories-controls {
        align-self: stretch;
        justify-content: center;
    }
    
    .category-item {
        width: 100px;
        min-height: 100px;
    }
    
    .category-icon {
        width: 40px;
        height: 40px;
    }
    
    .category-name {
        font-size: 0.8125rem;
    }
}

@media (max-width: 480px) {
    .categories-wrapper {
        gap: 0.75rem;
    }
    
    .category-item {
        width: 90px;
        min-height: 90px;
        padding: 0.75rem;
    }
    
    .category-icon {
        width: 36px;
        height: 36px;
    }
}

/* CSS Variables */
:root {
    --primary-rgb: 59, 130, 246;
}

@keyframes pulse {
    0%, 100% {
        opacity: 1;
    }
    50% {
        opacity: 0.5;
    }
}
</style>