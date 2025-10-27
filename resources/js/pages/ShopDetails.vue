<!-- Enhanced Shop Details with Modern UI/UX -->
<template>
    <div class="shop-details-wrapper">
        <!-- Hero Banner Section with Parallax Effect -->
        <div class="hero-section">
            <div class="banner-container">
                <div v-if="!isLoading" class="banner-wrapper">
                    <img :src="shop?.banner" loading="lazy" class="banner-image" alt="Shop Banner" />
                    <div class="banner-overlay"></div>
                    <div class="banner-particles">
                        <span v-for="i in 5" :key="i" class="particle"></span>
                    </div>
                </div>
                <SkeletonLoader v-else class="w-full h-full" />
            </div>
        </div>

        <!-- Enhanced Shop Info Section -->
        <div class="shop-info-section">
            <div class="main-container relative">
                <!-- Floating Shop Card -->
                <div class="shop-card-wrapper">
                    <div v-if="!isLoading" class="shop-card">
                        <div class="card-glow"></div>
                        
                        <!-- Shop Header -->
                        <div class="shop-header">
                            <!-- Logo Section -->
                            <div class="logo-section">
                                <div class="logo-wrapper">
                                    <div class="logo-ring"></div>
                                    <img :src="shop?.logo" loading="lazy" class="shop-logo" alt="Shop Logo" />
                                    <div class="logo-badge" v-if="shop?.verified">
                                        <svg class="w-4 h-4" fill="currentColor" viewBox="0 0 20 20">
                                            <path d="M6.267 3.455a3.066 3.066 0 001.745-.723 3.066 3.066 0 013.976 0 3.066 3.066 0 001.745.723 3.066 3.066 0 012.812 2.812c.051.643.304 1.254.723 1.745a3.066 3.066 0 010 3.976 3.066 3.066 0 00-.723 1.745 3.066 3.066 0 01-2.812 2.812 3.066 3.066 0 00-1.745.723 3.066 3.066 0 01-3.976 0 3.066 3.066 0 00-1.745-.723 3.066 3.066 0 01-2.812-2.812 3.066 3.066 0 00-.723-1.745 3.066 3.066 0 010-3.976 3.066 3.066 0 00.723-1.745 3.066 3.066 0 012.812-2.812zm7.44 5.252a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z"/>
                                        </svg>
                                    </div>
                                </div>

                                <!-- Shop Info -->
                                <div class="shop-info">
                                    <div class="shop-name-row">
                                        <h1 class="shop-name">{{ shop?.name }}</h1>
                                        <!-- <div class="status-badge" :class="shop?.shop_status === 'Online' ? 'online' : 'offline'">
                                            <span class="status-dot"></span>
                                            <span>{{ shop?.shop_status }}</span>
                                        </div> -->
                                    </div>
                                    
                                    <div class="shop-meta">
                                        <!-- <div class="meta-item">
                                            <svg class="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M20 7l-8-4-8 4m16 0l-8 4m8-4v10l-8 4m0-10L4 7m8 4v10M4 7v10l8 4"/>
                                            </svg>
                                            <span>{{ shop?.total_products }}+ {{ $t('Products') }}</span>
                                        </div>
                                        <div class="meta-divider"></div> -->
                                        <!-- <div class="meta-item">
                                            <svg class="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z"/>
                                            </svg>
                                            <span>{{ $t('Member since') }} 2023</span>
                                        </div> -->
                                    </div>

                                    
                                </div>
                            </div>

                            <!-- Stats Section -->
                            <div class="stats-section">
                              <div class="shop-description" v-if="shop?.description">
                                        <div v-html="shop?.description"></div>
                                    </div>
                                <button @click="masterStore.basketCanvas = true" class="chat-button">
                                    <div class="chat-bg"></div>
                                    <div class="chat-content">
                                        <div class="chat-icon-wrapper">
                                            <img :src="'/assets/icons/bag.svg'" class="w-6 h-6" />
                                            <span class="chat-pulse"></span>
                                        </div>
                                        <span class="chat-text">{{ $t('My Cart') }}</span>
                                    </div>
                                </button>
                                <!-- Rating Card -->
                                <!-- <div class="stat-card rating-card">
                                    <div class="stat-icon">
                                        <StarIcon class="w-6 h-6" />
                                    </div>
                                    <div class="stat-content">
                                        <div class="stat-value">{{ shop?.rating?.toFixed(1) }}</div>
                                        <div class="stat-label">{{ $t('Rating') }}</div>
                                        <div class="stat-meta">({{ shop?.total_reviews }} {{ $t('reviews') }})</div>
                                    </div>
                                    <div class="rating-stars">
                                        <StarIcon v-for="i in 5" :key="i" 
                                            class="w-4 h-4" 
                                            :class="i <= Math.round(shop?.rating) ? 'text-yellow-400' : 'text-gray-200'" />
                                    </div>
                                </div>

                                Chat Button
                                <button @click="openChat(shop)" class="chat-button">
                                    <div class="chat-bg"></div>
                                    <div class="chat-content">
                                        <div class="chat-icon-wrapper">
                                            <svg class="w-6 h-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 12h.01M12 12h.01M16 12h.01M21 12c0 4.418-4.03 8-9 8a9.863 9.863 0 01-4.255-.949L3 20l1.395-3.72C3.512 15.042 3 13.574 3 12c0-4.418 4.03-8 9-8s9 3.582 9 8z"/>
                                            </svg>
                                            <span class="chat-pulse"></span>
                                        </div>
                                        <span class="chat-text">{{ $t('Chat') }}</span>
                                    </div>
                                </button> -->
                            </div>
                        </div>

                        <!-- Navigation Tabs -->
                        <div class="nav-section">
                            <div class="tabs-wrapper">
                                <button class="tab-button" 
                                    :class="{ active: productTab }"
                                    @click="productTab = true; reviewTab = false;">
                                    <span class="tab-icon">
                                        <svg class="w-5 h-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M20 7l-8-4-8 4m16 0l-8 4m8-4v10l-8 4m0-10L4 7m8 4v10M4 7v10l8 4"/>
                                        </svg>
                                    </span>
                                    <span>{{ $t('Products') }}</span>
                                    <span class="tab-indicator"></span>
                                </button>

                                <button class="tab-button"
                                    :class="{ active: reviewTab }"
                                    @click="showReviewTab">
                                    <span class="tab-icon">
                                        <svg class="w-5 h-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11.049 2.927c.3-.921 1.603-.921 1.902 0l1.519 4.674a1 1 0 00.95.69h4.915c.969 0 1.371 1.24.588 1.81l-3.976 2.888a1 1 0 00-.363 1.118l1.518 4.674c.3.922-.755 1.688-1.538 1.118l-3.976-2.888a1 1 0 00-1.176 0l-3.976 2.888c-.783.57-1.838-.197-1.539-1.118l1.518-4.674a1 1 0 00-.363-1.118l-3.976-2.888c-.784-.57-.38-1.81.588-1.81h4.914a1 1 0 00.951-.69l1.519-4.674z"/>
                                        </svg>
                                    </span>
                                    <span>{{ $t('Reviews') }}</span>
                                    <span class="tab-indicator"></span>
                                </button>
                            </div>

                            <!-- Search Bar -->
                            <div class="search-wrapper">
                                <div class="search-container">
                                    <input type="text" 
                                        :placeholder="$t('Search products...')"
                                        class="search-input"
                                        v-model="search" 
                                        @input="searchProducts()" />
                                    <div class="search-icon">
                                        <MagnifyingGlassIcon class="w-5 h-5" />
                                    </div>
                                    <div class="search-glow"></div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Loading State -->
                    <SkeletonLoader v-else class="w-full h-64 rounded-3xl" />
                </div>
         <div class="banners-section" v-if="shop?.banners?.length > 0">
                    <swiper :breakpoints="breakpoints" 
                        :spaceBetween="30" 
                        :freeMode="true" 
                        :modules="modules"
                        class="banners-swiper">
                        <swiper-slide v-if="!isLoading" v-for="banner in shop?.banners" :key="banner.id">
                            <div class="banner-card">
                                <img :src="banner.thumbnail" alt="banner" loading="lazy" class="banner-img">
                                <div class="banner-shine"></div>
                            </div>
                        </swiper-slide>

                        <swiper-slide v-else v-for="i in 3" :key="i">
                            <SkeletonLoader class="w-full h-40 rounded-2xl" />
                        </swiper-slide>
                    </swiper>
                </div>
                <!-- Enhanced Categories Section -->
                <div class="categories-section">
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
                            <button @click="scrollCategories('right')" class="scroll-btn scroll-right" :disabled="canScrollRight">
                                <svg class="w-5 h-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5l7 7-7 7"/>
                                </svg>
                            </button>
                        </div>
                    </div>

                    <div v-if="isLoadingCategories" class="categories-loading">
                        <div v-for="i in 6" :key="i" class="category-skeleton">
                            <div class="skeleton-icon"></div>
                            <div class="skeleton-text"></div>
                        </div>
                    </div>

                    <div v-else class="categories-container" ref="categoriesContainer">
                        <div class="categories-wrapper">
                            <!-- 'All' option for categories -->
                            <div class="category-item" 
                                :class="{ active: selectedCategoryId === null }"
                                @click="selectCategory(null)">
                                <div class="category-content">
                                    <div class="category-icon">
                                        <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                            <circle cx="12" cy="12" r="10" stroke="currentColor" stroke-width="2" fill="none"/>
                                            <path d="M8 12h8M12 8v8" stroke="currentColor" stroke-width="2" stroke-linecap="round"/>
                                        </svg>
                                    </div>
                                    <span class="category-name">{{ $t('All') }}</span>
                                    <span class="category-count" v-if="totalProducts">{{ totalProducts }}</span>
                                </div>
                                <div class="category-indicator"></div>
                            </div>
                            
                            <!-- Existing categories -->
                            <div v-for="cat in categories" 
                                 :key="cat.id" 
                                 class="category-item"
                                 :class="{ active: selectedCategoryId === cat.id }"
                                 @click="selectCategory(cat.id)">
                                <div class="category-content">
                                    <div class="category-icon">
                                        <img :src="cat.thumbnail" :alt="cat.name" loading="lazy">
                                    </div>
                                    <span class="category-name">{{ cat.name }}</span>
                                    <span class="category-count" v-if="cat.products_count">{{ cat.products_count }}</span>
                                </div>
                                <div class="category-indicator"></div>
                            </div>
                        </div>
                    </div>

                    <!-- Subcategories -->
                    <div v-if="subCategories.length > 0" class="subcategories-section">
                        <div class="subsection-header">
                            <h3 class="subsection-title">{{ $t('Subcategories') }}</h3>
                            <div class="subcategories-controls">
                                <button @click="scrollSubCategories('left')" class="scroll-btn scroll-left" :disabled="canScrollSubLeft">
                                    <svg class="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 19l-7-7 7-7"/>
                                    </svg>
                                </button>
                                <button @click="scrollSubCategories('right')" class="scroll-btn scroll-right" :disabled="canScrollSubRight">
                                    <svg class="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5l7 7-7 7"/>
                                    </svg>
                                </button>
                            </div>
                        </div>
                        
                        <div v-if="isLoadingSubCategories" class="subcategories-loading">
                            <div v-for="i in 4" :key="i" class="subcategory-skeleton">
                                <div class="skeleton-chip"></div>
                            </div>
                        </div>
                        
                        <div v-else class="subcategories-container" ref="subCategoriesContainer">
                            <div class="subcategories-wrapper">
                                <!-- 'All' option for subcategories -->
                                <div class="subcategory-item"
                                    :class="{ active: selectedSubCategoryId === null }"
                                    @click="selectSubCategory(null)">
                                    <div class="subcategory-content">
                                        <svg width="16" height="16" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                            <circle cx="12" cy="12" r="10" stroke="currentColor" stroke-width="2" fill="none"/>
                                            <path d="M8 12h8M12 8v8" stroke="currentColor" stroke-width="2" stroke-linecap="round"/>
                                        </svg>
                                        <span>{{ $t('All') }}</span>
                                    </div>
                                </div>
                                
                                <!-- Existing subcategories -->
                                <div v-for="subCat in subCategories" 
                                     :key="subCat.id" 
                                     class="subcategory-item"
                                     :class="{ active: selectedSubCategoryId === subCat.id }"
                                     @click="selectSubCategory(subCat.id)">
                                    <div class="subcategory-content">
                                        <img :src="subCat.thumbnail" :alt="subCat.name" class="subcategory-icon">
                                        <span>{{ subCat.name }}</span>
                                        <span class="subcategory-count" v-if="subCat.products_count">{{ subCat.products_count }}</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Banner Carousel -->
       
            </div>
        </div>

        <!-- Products/Reviews Content Section -->
        <div class="content-section">
            <div class="main-container">
              



                <!-- Products Tab Content -->
                <div v-if="productTab" class="products-content">
                    
                    <!-- New Products Section -->
                    <div v-if="!hideSections && (newProducts.length || isLoadingNewProducts)" class="products-section">
                        <div class="section-header">
                            <h2 class="products-section-title">
                                <span class="title-icon">
                                    <svg class="w-6 h-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 6V4m0 2a2 2 0 100 4m0-4a2 2 0 110 4m-6 8a2 2 0 100-4m0 4a2 2 0 100 4m0-4v2m0-6V4m6 6v10m6-2a2 2 0 100-4m0 4a2 2 0 100 4m0-4v2m0-6V4"/>
                                    </svg>
                                </span>
                                {{ $t('New Products') }}
                            </h2>
                        </div>
                        <div class="products-grid-special">
                            <div v-if="!isLoadingNewProducts" v-for="product in newProducts.slice(0, 6)" :key="product.id">
                                <ProductCard :product="product" />
                            </div>
                            <div v-else v-for="i in 6" :key="'new-loading-' + i">
                                <SkeletonLoader class="w-full h-[280px] sm:h-[380px] rounded-xl" />
                            </div>
                        </div>
                    </div>
                
                    <!-- Discounted Products Section -->
                    <div v-if="!hideSections && (discountedProducts.length || isLoadingDiscountedProducts)" class="products-section">
                        <div class="section-header">
                            <h2 class="products-section-title">
                                <span class="title-icon discount-icon">
                                    <svg class="w-6 h-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M7 7h.01M7 3h5c.512 0 1.024.195 1.414.586l7 7a2 2 0 010 2.828l-7 7a2 2 0 01-2.828 0l-7-7A1.994 1.994 0 013 12V7a4 4 0 014-4z"/>
                                    </svg>
                                </span>
                                {{ $t('Discounted Products') }}
                            </h2>
                        </div>
                        <div class="products-grid-special">
                            <div v-if="!isLoadingDiscountedProducts" v-for="product in discountedProducts.slice(0, 6)" :key="product.id">
                                <ProductCard :product="product" />
                            </div>
                            <div v-else v-for="i in 6" :key="'discounted-loading-' + i">
                                <SkeletonLoader class="w-full h-[280px] sm:h-[380px] rounded-xl" />
                            </div>
                        </div>
                    </div>
                
                    <!-- All Products Section -->
                    <div class="products-section">
                        <div class="section-header" v-if="!hideSections && (newProducts.length || discountedProducts.length)">
                            <h2 class="products-section-title">
                                <span class="title-icon all-products-icon">
                                    <svg class="w-6 h-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M20 7l-8-4-8 4m16 0l-8 4m8-4v10l-8 4m0-10L4 7m8 4v10M4 7v10l8 4"/>
                                    </svg>
                                </span>
                                {{ $t('All Products') }}
                            </h2>
                        </div>
                        <div class="products-grid">
                            <div v-if="!isLoadingProducts" v-for="product in products" :key="product.id">
                                <ProductCard :product="product" />
                            </div>

                            <div v-else v-for="i in 12" :key="i">
                                <SkeletonLoader class="w-full h-[280px] sm:h-[380px] rounded-xl" />
                            </div>
                        </div>
                    </div>

                    <div v-if="products.length == 0 && !isLoadingProducts" class="empty-state">
                        <div class="empty-icon">
                            <svg class="w-24 h-24" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M20 13V6a2 2 0 00-2-2H6a2 2 0 00-2 2v7m16 0v5a2 2 0 01-2 2H6a2 2 0 01-2-2v-5m16 0h-2.586a1 1 0 00-.707.293l-2.414 2.414a1 1 0 01-.707.293h-3.172a1 1 0 01-.707-.293l-2.414-2.414A1 1 0 006.586 13H4"/>
                            </svg>
                        </div>
                        <h3 class="empty-title">{{ $t('No Products Found') }}</h3>
                        <p class="empty-text">{{ $t('Try adjusting your filters or search terms') }}</p>
                    </div>

                    <!-- Pagination -->
                    <div v-if="products.length > 0 && !isLoadingProducts" class="pagination-wrapper">
                        <div class="pagination-info">
                            {{ $t('Showing') }} {{ (perPage * (currentPage - 1) + 1) }} - 
                            {{ Math.min(perPage * currentPage, totalProducts) }} 
                            {{ $t('of') }} {{ totalProducts }} {{ $t('products') }}
                        </div>
                        <vue-awesome-paginate 
                            :total-items="totalProducts" 
                            :items-per-page="perPage" 
                            type="button"
                            :max-pages-shown="5" 
                            v-model="currentPage" 
                            :hide-prev-next-when-ends="true"
                            @click="onClickHandler" />
                    </div>
                </div>

                <!-- Reviews Tab Content -->
                <div v-if="reviewTab" class="reviews-content">
                    <div class="reviews-layout">
                        <!-- Rating Summary -->
                        <div class="rating-summary">
                            <h3 class="summary-title">{{ $t('Rating Overview') }}</h3>
                            <ReviewRatings 
                                :reviewRatings="averageRatings?.percentages"
                                :averageRating="averageRatings?.rating" 
                                :totalReview="totalReviews" />
                        </div>

                        <!-- Reviews List -->
                        <div class="reviews-list">
                            <h3 class="reviews-title">{{ $t('Customer Reviews') }}</h3>
                            
                            <div v-if="!isLoadingReviews" class="reviews-container">
                                <div v-for="review in reviews" :key="review.id" class="review-item">
                                    <Review :review="review" />
                                </div>
                            </div>

                            <div v-else class="reviews-loading">
                                <div v-for="i in 5" :key="i" class="review-skeleton">
                                    <SkeletonLoader class="w-16 h-16 rounded-full" />
                                    <div class="flex-1 space-y-2">
                                        <SkeletonLoader class="w-full h-3 rounded" />
                                        <SkeletonLoader class="w-3/4 h-3 rounded" />
                                    </div>
                                </div>
                            </div>

                            <div v-if="reviews.length === 0 && !isLoadingReviews" class="no-reviews">
                                <p>{{ $t('No reviews yet') }}</p>
                            </div>

                            <!-- Reviews Pagination -->
                            <div v-if="reviews.length > 0 && !isLoadingReviews" class="pagination-wrapper">
                                <div class="pagination-info">
                                    {{ $t('Showing') }} {{ (reviewPerPage * (reviewPage - 1) + 1) }} - 
                                    {{ Math.min(reviewPerPage * reviewPage, totalReviews) }} 
                                    {{ $t('of') }} {{ totalReviews }} {{ $t('reviews') }}
                                </div>
                                <vue-awesome-paginate 
                                    :total-items="totalReviews"
                                    :items-per-page="reviewPerPage" 
                                    type="button" 
                                    :max-pages-shown="3"
                                    v-model="reviewPage" 
                                    :hide-prev-next-when-ends="true"
                                    @click="reviewPagination" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Chat Sidebar -->
        <RightChatSidebar 
            v-if="activeChatShop" 
            :show="showSidebar" 
            @close="showSidebar = false"
            :shop="activeChatShop" />
    </div>
</template>

<script setup>
// Keep your existing script exactly as is
import { ref, onMounted, watch, nextTick } from 'vue';
import { useRoute, useRouter } from 'vue-router';
import { StarIcon, MagnifyingGlassIcon } from '@heroicons/vue/24/solid';
import { Swiper, SwiperSlide } from 'swiper/vue';
import { FreeMode } from 'swiper/modules';
import ProductCard from '../components/ProductCard.vue';
import NewProducts from '../components/NewProducts.vue';
import DiscountedProducts from '../components/DiscountedProducts.vue';
import ReviewRatings from '../components/ReviewRatings.vue';
import Review from '../components/Review.vue';
import SkeletonLoader from '../components/SkeletonLoader.vue';
import RightChatSidebar from '../components/RightChatSidebar.vue';

import { useMaster } from '../stores/MasterStore';
import { useAuth } from '../stores/AuthStore';

const categories = ref([]);
const totalCategories = ref(0);
const isLoadingCategories = ref(true);
const selectedCategoryId = ref(null);
const subCategories = ref([]);
const selectedSubCategoryId = ref(null);
const isLoadingSubCategories = ref(false);

// Refs for scrolling
const categoriesContainer = ref(null);
const subCategoriesContainer = ref(null);

// Scroll state
const canScrollLeft = ref(false);
const canScrollRight = ref(true);
const canScrollSubLeft = ref(false);
const canScrollSubRight = ref(true);

const authStore = useAuth();
const masterStore = useMaster();

const router = new useRouter();
const route = useRoute();

import 'swiper/css';
import 'swiper/css/free-mode';

const modules = [FreeMode];

const isLoading = ref(true);
const isLoadingProducts = ref(true);
const isLoadingReviews = ref(false);
const isLoadingNewProducts = ref(true);
const isLoadingDiscountedProducts = ref(true);

const productTab = ref(true);
const reviewTab = ref(false);

const currentPage = ref(1);
const perPage = ref(12);

const onClickHandler = (page) => {
    currentPage.value = page;
    fetchProducts();
};

const reviewPerPage = ref(5);
const reviewPage = ref(1);

const reviewPagination = (page) => {
    reviewPage.value = page;
    fetchReviews();
};

const shop = ref({});

const products = ref([]);
const totalProducts = ref(0);
const newProducts = ref([]);
const discountedProducts = ref([]);

const search = ref(null);
const showSidebar = ref(false);
const activeChatShop = ref(null);

let searchTimer = null;
const searchProducts = () => {
    clearTimeout(searchTimer);
    searchTimer = setTimeout(() => {
        currentPage.value = 1;
        productTab.value = true;
        reviewTab.value = false;
        fetchProducts();
    }, 1000);
};

onMounted(() => {
  if (!masterStore.multiVendor) {
    router.push("/");
    return;
  }
  fetchDetails();
  window.scrollTo(0, 0);
  fetchProducts();
  fetchCategories();
  
  // Add scroll event listeners
  nextTick(() => {
    if (categoriesContainer.value) {
      categoriesContainer.value.addEventListener('scroll', updateScrollButtons);
    }
    if (subCategoriesContainer.value) {
      subCategoriesContainer.value.addEventListener('scroll', updateSubScrollButtons);
    }
  });
  
  watch(
    shop,
    (val) => {
      if (val && val.logo) {
        masterStore.shopLogo = val.logo;
      } else {
        masterStore.shopLogo = null;
      }
    },
    { immediate: true }
  );
});

const fetchCategories = async () => {
  isLoadingCategories.value = true;
  axios
    .get(`/categories-by-shop?shop_id=${route.params.id}`, {
      headers: {
        "Accept-Language": masterStore.locale || "en",
      },
    })
    .then((response) => {
      totalCategories.value = response.data.data.total;
      categories.value = response.data.data.categories;
      isLoadingCategories.value = false;
    })
    .catch((error) => {
      isLoadingCategories.value = false;
    });
};

const showReviewTab = () => {
    productTab.value = false;
    reviewTab.value = true;
    fetchReviews();
};

const fetchDetails = async () => {
    isLoading.value = true;
    axios.get('/shops/' + route.params.id).then((response) => {
        shop.value = response.data.data.shop;
        fetchShopSpecialProducts();
        setTimeout(() => {
            isLoading.value = false;
        }, 200);
    }).catch((error) => {
        isLoading.value = false;
    });
}

const fetchShopSpecialProducts = async () => {
    isLoadingNewProducts.value = true;
    isLoadingDiscountedProducts.value = true;
    // Fetch new products
    axios.get('/products/new', {
        params: { shop_id: route.params.id },
        headers: { 'Accept-Language': masterStore.locale || 'en' }
    }).then((response) => {
        newProducts.value = response.data.data.products || [];
        isLoadingNewProducts.value = false;
    }).catch(() => {
        isLoadingNewProducts.value = false;
    });
    // Fetch discounted products
    axios.get('/products/discounted', {
        params: { shop_id: route.params.id },
        headers: { 'Accept-Language': masterStore.locale || 'en' }
    }).then((response) => {
        discountedProducts.value = response.data.data.products || [];
        isLoadingDiscountedProducts.value = false;
    }).catch(() => {
        isLoadingDiscountedProducts.value = false;
    });
}
const hideSections = ref(false);
watch([search, selectedCategoryId, selectedSubCategoryId], 
    ([newSearch, newCategory, newSubCategory]) => {
        console.log(newSearch, newCategory, newSubCategory);
        console.log(newSearch != null || newSearch != "" ||  newSearch.length > 0  || newCategory != null || newSubCategory != null);
       if ((newSearch && newSearch.trim().length > 0) || newCategory != null || newSubCategory != null) {
    hideSections.value = true;
} else {
    hideSections.value = false;
}
    }
);

const fetchProducts = async () => {
    isLoadingProducts.value = true;
    axios.get('/products', {
        params: {
            shop_id: route.params.id,
            page: currentPage.value,
            per_page: perPage.value,
            search: search.value,
            categories: selectedCategoryId.value ? selectedCategoryId.value : '',
            sub_categories: selectedSubCategoryId.value ? selectedSubCategoryId.value : '',
        },
        headers: {
            'Accept-Language': masterStore.locale || 'en',
            Authorization: authStore.token
        }
    })
    .then((response) => {
        totalProducts.value = response.data.data.total;
        products.value = response.data.data.products;
        isLoadingProducts.value = false;
    })
    .catch((error) => {
        isLoadingProducts.value = false;
    });
};

const selectCategory = (catId) => {
    selectedCategoryId.value = catId;
    selectedSubCategoryId.value = null;
    isLoadingSubCategories.value = true;
    
    const cat = categories.value.find(c => c.id === catId);
    if (cat && cat.sub_categories && cat.sub_categories.length > 0) {
        subCategories.value = cat.sub_categories;
    } else {
        subCategories.value = [];
    }
    setTimeout(() => {
        isLoadingSubCategories.value = false;
    }, 200);
    currentPage.value = 1;
    productTab.value = true;
    reviewTab.value = false;
    fetchProducts();
};

const selectSubCategory = (subCatId) => {
    selectedSubCategoryId.value = subCatId;
    currentPage.value = 1;
    productTab.value = true;
    reviewTab.value = false;
    fetchProducts();
};

// Scroll functions for categories
const scrollCategories = (direction) => {
    if (!categoriesContainer.value) return;
    
    const container = categoriesContainer.value;
    const scrollAmount = 200;
    
    if (direction === 'left') {
        container.scrollLeft -= scrollAmount;
    } else {
        container.scrollLeft += scrollAmount;
    }
    
    updateScrollButtons();
};

// Scroll functions for subcategories
const scrollSubCategories = (direction) => {
    if (!subCategoriesContainer.value) return;
    
    const container = subCategoriesContainer.value;
    const scrollAmount = 150;
    
    if (direction === 'left') {
        container.scrollLeft -= scrollAmount;
    } else {
        container.scrollLeft += scrollAmount;
    }
    
    updateSubScrollButtons();
};

// Update scroll button states for categories
const updateScrollButtons = () => {
    if (!categoriesContainer.value) return;
    
    const container = categoriesContainer.value;
    canScrollLeft.value = container.scrollLeft > 0;
    canScrollRight.value = container.scrollLeft < (container.scrollWidth - container.clientWidth);
};

// Update scroll button states for subcategories
const updateSubScrollButtons = () => {
    if (!subCategoriesContainer.value) return;
    
    const container = subCategoriesContainer.value;
    canScrollSubLeft.value = container.scrollLeft > 0;
    canScrollSubRight.value = container.scrollLeft < (container.scrollWidth - container.clientWidth);
};

// Watch for container changes and update scroll buttons
watch(categories, () => {
    nextTick(() => {
        updateScrollButtons();
    });
});

watch(subCategories, () => {
    nextTick(() => {
        updateSubScrollButtons();
    });
});

const fetchReviews = async () => {
    isLoadingReviews.value = true;
    axios.get('/reviews', {
        params: {
            shop_id: route.params.id,
            page: reviewPage.value,
            per_page: reviewPerPage.value
        }
    }).then((response) => {
        totalReviews.value = response.data.data.total;
        reviews.value = response.data.data.reviews;
        averageRatings.value = response.data.data.average_rating_percentage;
        isLoadingReviews.value = false;
    }).catch((error) => {
        isLoadingReviews.value = false;
    })
};

const breakpoints = {
    320: {
        slidesPerView: 1,
        spaceBetween: 10
    },
    768: {
        slidesPerView: 2,
        spaceBetween: 10
    },
    1024: {
        slidesPerView: 2,
        spaceBetween: 30
    },
    1280: {
        slidesPerView: 3,
        spaceBetween: 30
    }
};

const openChat = (shop) => {
    activeChatShop.value = shop;
    showChat();
};

const showChat = async () => {
    const response = await axios.post('/store-message', {
        shop_id: activeChatShop.value.id,
        user_id: authStore?.user?.id,
        type: 'user',
    }, {
        headers: {
            Authorization: authStore.token,
        }
    });

    showSidebar.value = true;
}
</script>

<style scoped>
/* Modern Shop Details Styles */
.shop-details-wrapper {
    min-height: 100vh;
    background: linear-gradient(to bottom, #ffffff, #f9fafb);
}

/* Hero Banner Section */
.hero-section {
    position: relative;
    width: 100%;
    height: 280px;
    overflow: hidden;
}

@media (min-width: 768px) {
    .hero-section {
        height: 320px;
    }
}

.banner-container {
    position: relative;
    width: 100%;
    height: 100%;
}

.banner-wrapper {
    position: relative;
    width: 100%;
    height: 100%;
    overflow: hidden;
}

.banner-image {
    width: 100%;
    height: 100%;
    object-fit: cover;
    transform: scale(1.05);
    transition: transform 0.8s ease;
}

.banner-wrapper:hover .banner-image {
    transform: scale(1.1);
}

.banner-overlay {
    position: absolute;
    inset: 0;
    background: linear-gradient(
        to bottom,
        transparent 0%,
        rgba(0, 0, 0, 0.1) 50%,
        rgba(0, 0, 0, 0.3) 100%
    );
    pointer-events: none;
}

.banner-particles {
    position: absolute;
    inset: 0;
    overflow: hidden;
    pointer-events: none;
}

.banner-particles .particle {
    position: absolute;
    width: 4px;
    height: 4px;
    background: rgba(255, 255, 255, 0.8);
    border-radius: 50%;
    animation: floatParticle 10s infinite;
}

.particle:nth-child(1) { left: 10%; animation-delay: 0s; }
.particle:nth-child(2) { left: 30%; animation-delay: 2s; }
.particle:nth-child(3) { left: 50%; animation-delay: 4s; }
.particle:nth-child(4) { left: 70%; animation-delay: 6s; }
.particle:nth-child(5) { left: 90%; animation-delay: 8s; }

@keyframes floatParticle {
    0% {
        transform: translateY(100vh) rotate(0deg);
        opacity: 0;
    }
    10% {
        opacity: 1;
    }
    90% {
        opacity: 1;
    }
    100% {
        transform: translateY(-100vh) rotate(720deg);
        opacity: 0;
    }
}

/* Shop Info Section */
.shop-info-section {
    position: relative;
    background: linear-gradient(135deg, rgba(var(--primary-rgb), 0.02), rgba(var(--primary-rgb), 0.05));
    padding: 3rem 0 2rem;
    margin-top: -80px;
}

.shop-card-wrapper {
    position: relative;
    z-index: 10;
}

.shop-card {
    background: white;
    border-radius: 24px;
    padding: 2rem;
    box-shadow: 
        0 20px 60px rgba(0, 0, 0, 0.08),
        0 10px 30px rgba(0, 0, 0, 0.05),
        inset 0 1px 3px rgba(255, 255, 255, 0.5);
    position: relative;
    overflow: hidden;
}

.card-glow {
    position: absolute;
    top: -50%;
    left: -50%;
    width: 200%;
    height: 200%;
    background: radial-gradient(
        circle at center,
        rgba(var(--primary-rgb), 0.05),
        transparent 70%
    );
    animation: rotate 20s linear infinite;
    pointer-events: none;
}

@keyframes rotate {
    0% { transform: rotate(0deg); }
    100% { transform: rotate(360deg); }
}

/* Shop Header */
.shop-header {
    display: flex;
    flex-direction: column;
    gap: 1.5rem;
}

@media (min-width: 768px) {
    .shop-header {
        flex-direction: column;
        flex-wrap: wrap;
        gap: 1rem;
    
    }
}

.logo-section {
    display: flex;
    gap: 1rem;
    align-items: center;
    width: 100%;
}

@media (min-width: 768px) {
    .logo-section {
        gap: 1.5rem;
        flex: 1;
        width: auto;
    }
}

.logo-wrapper {
    position: relative;
    flex-shrink: 0;
    width: 70px;
    height: 70px;
}

@media (min-width: 768px) {
    .logo-wrapper {
        width: 88px;
        height: 88px;
    }
}

.logo-ring {
    position: absolute;
    inset: -3px;
    border-radius: 50%;
    background: linear-gradient(45deg, 
        rgba(var(--primary-rgb), 0.3),
        rgba(var(--primary-rgb), 0.1),
        rgba(var(--primary-rgb), 0.3)
    );
    animation: rotateGradient 3s linear infinite;
}

@media (min-width: 768px) {
    .logo-ring {
        inset: -4px;
    }
}

@keyframes rotateGradient {
    0% { transform: rotate(0deg); }
    100% { transform: rotate(360deg); }
}

.shop-logo {
    width: 100%;
    height: 100%;
    border-radius: 40%;
    object-fit: cover;
    position: relative;
    z-index: 2;
    border: 3px solid white;
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
}

@media (min-width: 768px) {
    .shop-logo {
        border: 4px solid white;
        box-shadow: 0 8px 24px rgba(0, 0, 0, 0.12);
    }
}

.logo-badge {
    position: absolute;
    bottom: -2px;
    right: -2px;
    width: 22px;
    height: 22px;
    background: linear-gradient(135deg, #10b981, #059669);
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    color: white;
    border: 2px solid white;
    z-index: 3;
}

@media (min-width: 768px) {
    .logo-badge {
        bottom: 0;
        right: 0;
        width: 28px;
        height: 28px;
        border: 3px solid white;
    }
}

.shop-info {
    flex: 1;
    display: flex;
    flex-direction: column;
    gap: 0.5rem;
    min-width: 0; /* للسماح بالتقليص */
}

@media (min-width: 768px) {
    .shop-info {
        gap: 0.75rem;
    }
}

.shop-name-row {
    display: flex;
    flex-direction: column;
    gap: 0.5rem;
}

@media (min-width: 480px) {
    .shop-name-row {
        flex-direction: row;
        align-items: center;
        gap: 1rem;
        flex-wrap: wrap;
    }
}

.shop-name {
    font-size: 1.25rem;
    font-weight: 800;
    background: linear-gradient(135deg, 
        #1f2937,
        #374151
    );
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    background-clip: text;
    line-height: 1.2;
}

@media (min-width: 480px) {
    .shop-name {
        font-size: 1.0rem;
    }
}

@media (min-width: 768px) {
    .shop-name {
        font-size: 1.75rem;
    }
}

.status-badge {
    display: inline-flex;
    align-items: center;
    gap: 0.25rem;
    padding: 0.25rem 0.625rem;
    border-radius: 10px;
    font-size: 0.75rem;
    font-weight: 600;
    transition: all 0.3s ease;
    width: fit-content;
}

@media (min-width: 768px) {
    .status-badge {
        gap: 0.375rem;
        padding: 0.375rem 0.75rem;
        border-radius: 12px;
        font-size: 0.875rem;
    }
}

.status-badge.online {
    background: linear-gradient(135deg, #dcfce7, #bbf7d0);
    color: #166534;
}

.status-badge.offline {
    background: linear-gradient(135deg, #f3f4f6, #e5e7eb);
    color: #6b7280;
}

.status-dot {
    width: 6px;
    height: 6px;
    border-radius: 50%;
    animation: pulse 2s infinite;
}

@media (min-width: 768px) {
    .status-dot {
        width: 8px;
        height: 8px;
    }
}

.status-badge.online .status-dot {
    background: #10b981;
}

.status-badge.offline .status-dot {
    background: #9ca3af;
}

.shop-meta {
    display: flex;
    flex-direction: column;
    gap: 0.5rem;
    color: #6b7280;
    font-size: 0.8125rem;
}

@media (min-width: 480px) {
    .shop-meta {
        flex-direction: row;
        align-items: center;
        gap: 1rem;
        font-size: 0.875rem;
    }
}

@media (min-width: 768px) {
    .shop-meta {
        font-size: 0.9375rem;
    }
}

.meta-item {
    display: flex;
    align-items: center;
    gap: 0.25rem;
}

@media (min-width: 768px) {
    .meta-item {
        gap: 0.375rem;
    }
}

.meta-divider {
    display: none;
}

@media (min-width: 480px) {
    .meta-divider {
        display: block;
        width: 1px;
        height: 16px;
        background: #e5e7eb;
    }
}

.shop-description {
    color: #6b7280;
    font-size: 0.8125rem;
    line-height: 1.5;
    max-width: 100%;
    display: -webkit-box;
    -webkit-line-clamp: 2;
    line-clamp: 2;
    -webkit-box-orient: vertical;
    overflow: hidden;
}

@media (min-width: 480px) {
    .shop-description {
        font-size: 0.875rem;
        -webkit-line-clamp: 3;
        line-clamp: 3;
    }
}

@media (min-width: 768px) {
    .shop-description {
        font-size: 0.9375rem;
        line-height: 1.6;
        max-width: 600px;
        -webkit-line-clamp: unset;
        line-clamp: unset;
    }
}

/* Stats Section */
.stats-section {
    display: flex;
    flex-direction: column;
    gap: 0.75rem;
    width: 100%;
    margin-top: 1rem;
}

@media (min-width: 768px) {
    .stats-section {
        flex-direction: row;
        gap: 1rem;
        align-items: center;
        width: auto;
        margin-top: 0;
    }
}

.stat-card {
    padding: 0.875rem;
    background: linear-gradient(135deg, #fef3c7, #fde68a);
    border-radius: 14px;
    display: flex;
    align-items: center;
    gap: 0.75rem;
    width: 100%;
}

@media (min-width: 768px) {
    .stat-card {
        padding: 1rem;
        border-radius: 16px;
        gap: 1rem;
        min-width: 180px;
        width: auto;
    }
}

.stat-icon {
    width: 40px;
    height: 40px;
    background: white;
    border-radius: 10px;
    display: flex;
    align-items: center;
    justify-content: center;
    color: #f59e0b;
    flex-shrink: 0;
}

@media (min-width: 768px) {
    .stat-icon {
        width: 48px;
        height: 48px;
        border-radius: 12px;
    }
}

.stat-content {
    flex: 1;
    min-width: 0;
}

.stat-value {
    font-size: 1.25rem;
    font-weight: 700;
    color: #92400e;
    line-height: 1;
}

@media (min-width: 768px) {
    .stat-value {
        font-size: 1.5rem;
    }
}

.stat-label {
    font-size: 0.75rem;
    color: #92400e;
    font-weight: 500;
}

@media (min-width: 768px) {
    .stat-label {
        font-size: 0.875rem;
    }
}

.stat-meta {
    font-size: 0.6875rem;
    color: #b45309;
}

@media (min-width: 768px) {
    .stat-meta {
        font-size: 0.75rem;
    }
}

.rating-stars {
    display: flex;
    gap: 0.125rem;
    margin-top: 0.375rem;
}

@media (min-width: 768px) {
    .rating-stars {
        margin-top: 0.5rem;
    }
}

/* Chat Button */
.chat-button {
    position: relative;
    padding: 0.875rem 1.25rem;
    border-radius: 14px;
    background: white;
    border: 2px solid rgba(var(--primary-rgb), 0.1);
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 0.625rem;
    transition: all 0.3s cubic-bezier(0.175, 0.885, 0.32, 1.275);
    overflow: hidden;
    width: 100%;
    cursor: pointer;
}

@media (min-width: 768px) {
    .chat-button {
        padding: 1rem 1.5rem;
        border-radius: 16px;
        gap: 0.75rem;
        width: auto;
    }
}

.chat-bg {
    position: absolute;
    inset: 0;
    background: linear-gradient(135deg, 
        rgba(var(--primary-rgb), 0.05),
        rgba(var(--primary-rgb), 0.1)
    );
    transform: scale(0);
    transition: transform 0.3s ease;
}

.chat-button:hover .chat-bg {
    transform: scale(1);
}

.chat-content {
    position: relative;
    display: flex;
    align-items: center;
    gap: 0.5rem;
    z-index: 2;
}

.chat-icon-wrapper {
    position: relative;
    color: rgb(var(--primary-rgb));
}

.chat-pulse {
    position: absolute;
    inset: -8px;
    border: 2px solid rgba(var(--primary-rgb), 0.3);
    border-radius: 50%;
    animation: pulse 2s infinite;
}

.chat-text {
    font-weight: 600;
    color: rgb(var(--primary-rgb));
}

.chat-button:hover {
    transform: translateY(-2px);
    box-shadow: 0 8px 20px rgba(var(--primary-rgb), 0.15);
}

/* Navigation Tabs - Mobile Optimized */
.nav-section {
    margin-top: 1.5rem;
    padding-top: 1.5rem;
    border-top: 1px solid #e5e7eb;
    display: flex;
    flex-direction: column;
    gap: 1rem;
}

@media (min-width: 768px) {
    .nav-section {
        margin-top: 2rem;
        padding-top: 2rem;
        flex-direction: row;
        justify-content: space-between;
        align-items: center;
        gap: 2rem;
        flex-wrap: wrap;
    }
}

.tabs-wrapper {
    display: flex;
    gap: 0.375rem;
    width: 100%;
}

@media (min-width: 768px) {
    .tabs-wrapper {
        gap: 0.5rem;
        width: auto;
    }
}

.tab-button {
    position: relative;
    flex: 1;
    padding: 0.625rem 0.875rem;
    border-radius: 10px;
    background: transparent;
    border: none;
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 0.375rem;
    font-weight: 600;
    font-size: 0.875rem;
    color: #6b7280;
    transition: all 0.3s ease;
    overflow: hidden;
    cursor: pointer;
}

@media (min-width: 768px) {
    .tab-button {
        flex: none;
        padding: 0.75rem 1.5rem;
        border-radius: 12px;
        gap: 0.5rem;
        font-size: 1rem;
    }
}

.tab-icon {
    display: flex;
    align-items: center;
}

.tab-indicator {
    position: absolute;
    bottom: 0;
    left: 0;
    right: 0;
    height: 3px;
    background: linear-gradient(90deg, 
        rgb(var(--primary-rgb)),
        rgba(var(--primary-rgb), 0.7)
    );
    transform: scaleX(0);
    transition: transform 0.3s ease;
}

.tab-button.active {
    background: linear-gradient(135deg, 
        rgba(var(--primary-rgb), 0.05),
        rgba(var(--primary-rgb), 0.1)
    );
    color: rgb(var(--primary-rgb));
}

.tab-button.active .tab-indicator {
    transform: scaleX(1);
}

.tab-button:hover:not(.active) {
    background: rgba(0, 0, 0, 0.02);
}

/* Search Bar */
.search-wrapper {
    flex: 1;
    max-width: 400px;
}

.search-container {
    position: relative;
}

.search-input {
    width: 100%;
    padding: 0.875rem 3rem 0.875rem 1.25rem;
    background: #f9fafb;
    border: 2px solid transparent;
    border-radius: 14px;
    font-size: 0.9375rem;
    transition: all 0.3s ease;
    outline: none;
}

.search-input:focus {
    background: white;
    border-color: rgba(var(--primary-rgb), 0.2);
    box-shadow: 0 4px 12px rgba(var(--primary-rgb), 0.08);
}

.search-icon {
    position: absolute;
    right: 1rem;
    top: 50%;
    transform: translateY(-50%);
    color: #9ca3af;
    pointer-events: none;
}

.search-glow {
    position: absolute;
    inset: -2px;
    border-radius: 16px;
    background: linear-gradient(45deg,
        rgba(var(--primary-rgb), 0.2),
        transparent,
        rgba(var(--primary-rgb), 0.2)
    );
    opacity: 0;
    transition: opacity 0.3s ease;
    pointer-events: none;
}

.search-input:focus ~ .search-glow {
    opacity: 1;
    animation: glowRotate 3s linear infinite;
}

/* Categories Section */
.categories-section {
    margin-top: 3rem;
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
    width: 100px;
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
    overflow-x: hidden;
    scrollbar-width: none;
    -ms-overflow-style: none;
}

.categories-container::-webkit-scrollbar {
    display: none;
}

.categories-wrapper {
    display: flex;
    gap: 1rem;
    padding: 0.5rem 0;
    overflow-x: auto;
    scrollbar-width: none;
    -ms-overflow-style: none;
    scroll-behavior: smooth;
}

.categories-wrapper::-webkit-scrollbar {
    display: none;
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

.category-icon svg {
    width: 100%;
    height: 100%;
    color: rgb(var(--primary-rgb));
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

.category-item.active {
    border-color: rgb(var(--primary-rgb));
    background: rgba(var(--primary-rgb), 0.02);
}

.category-item.active .category-indicator {
    width: 100%;
}

.category-item.active .category-name {
    color: rgb(var(--primary-rgb));
}

/* Subcategories */
.subcategories-section {
    margin-top: 2rem;
}

.subsection-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 1rem;
    flex-wrap: wrap;
    gap: 1rem;
}

.subsection-title {
    font-size: 1rem;
    font-weight: 600;
    color: #6b7280;
}

.subcategories-controls {
    display: flex;
    gap: 0.5rem;
    align-items: center;
}

.subcategories-loading {
    display: flex;
    gap: 0.75rem;
    overflow-x: auto;
    padding: 0.5rem 0;
}

.subcategory-skeleton {
    display: flex;
    align-items: center;
    gap: 0.5rem;
    width: 120px;
    flex-shrink: 0;
}

.skeleton-chip {
    width: 120px;
    height: 40px;
    background: #e5e7eb;
    border-radius: 20px;
    animation: pulse 1.5s infinite ease-in-out;
}

.subcategories-container {
    overflow-x: hidden;
    scrollbar-width: none;
    -ms-overflow-style: none;
}

.subcategories-container::-webkit-scrollbar {
    display: none;
}

.subcategories-wrapper {
    display: flex;
    gap: 0.75rem;
    padding: 0.5rem 0;
    overflow-x: auto;
    scrollbar-width: none;
    -ms-overflow-style: none;
    scroll-behavior: smooth;
}

.subcategories-wrapper::-webkit-scrollbar {
    display: none;
}

.subcategory-item {
    display: inline-flex;
    align-items: center;
    gap: 0.5rem;
    padding: 0.75rem 1rem;
    background: white;
    border: 1.5px solid #e5e7eb;
    border-radius: 20px;
    font-size: 0.875rem;
    font-weight: 500;
    color: #6b7280;
    cursor: pointer;
    transition: all 0.3s ease;
    white-space: nowrap;
    flex-shrink: 0;
    min-width: 120px;
}

.subcategory-item:hover {
    background: rgba(var(--primary-rgb), 0.05);
    border-color: rgba(var(--primary-rgb), 0.2);
    transform: translateY(-2px);
}

.subcategory-item.active {
    background: linear-gradient(135deg,
        rgba(var(--primary-rgb), 0.1),
        rgba(var(--primary-rgb), 0.05)
    );
    border-color: rgba(var(--primary-rgb), 0.3);
    color: rgb(var(--primary-rgb));
}

.subcategory-content {
    display: flex;
    align-items: center;
    gap: 0.5rem;
    width: 100%;
}

.subcategory-icon {
    width: 20px;
    height: 20px;
    object-fit: contain;
    flex-shrink: 0;
}

.subcategory-count {
    font-size: 0.75rem;
    color: #6b7280;
    margin-left: auto;
    background: #f3f4f6;
    padding: 0.125rem 0.375rem;
    border-radius: 8px;
    font-weight: 500;
}

/* Responsive Design */
@media (max-width: 768px) {
    .section-header {
        flex-direction: column;
        align-items: flex-start;
        gap: 0.75rem;
    }
    
    .categories-controls,
    .subcategories-controls {
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
    
    .subcategory-item {
        min-width: 100px;
        padding: 0.625rem 0.875rem;
        font-size: 0.8125rem;
    }
}

@media (max-width: 480px) {
    .categories-wrapper,
    .subcategories-wrapper {
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
    
    .subcategory-item {
        min-width: 90px;
        padding: 0.5rem 0.75rem;
    }
}

/* Banners Section */
.banners-section {
    margin-top: 2rem;
}

.banners-swiper {
    padding: 0.5rem 0;
}

.banner-card {
    position: relative;
    border-radius: 20px;
    overflow: hidden;
    aspect-ratio: 3/1;
}

.banner-img {
    width: 100%;
    height: 100%;
    object-fit: cover;
    transition: transform 0.5s ease;
}

.banner-card:hover .banner-img {
    transform: scale(1.05);
}

.banner-shine {
    position: absolute;
    inset: 0;
    background: linear-gradient(
        105deg,
        transparent 40%,
        rgba(255, 255, 255, 0.3) 50%,
        transparent 60%
    );
    transform: translateX(-100%);
    transition: transform 0.8s ease;
}

.banner-card:hover .banner-shine {
    transform: translateX(100%);
}

/* Content Section */
.content-section {
    padding: 3rem 0;
}

/* Products Section */
.products-section {
    margin-bottom: 4rem;
}

.products-section:last-child {
    margin-bottom: 0;
}

.products-section-title {
    font-size: 1.5rem;
    font-weight: 700;
    color: #1f2937;
    display: flex;
    align-items: center;
    gap: 0.75rem;
    margin-bottom: 2rem;
    padding-bottom: 0.75rem;
    border-bottom: 2px solid #f3f4f6;
}

@media (min-width: 768px) {
    .products-section-title {
        font-size: 1.75rem;
        gap: 1rem;
        margin-bottom: 2.5rem;
        padding-bottom: 1rem;
    }
}

.products-section-title .title-icon {
    display: flex;
    align-items: center;
    justify-content: center;
    width: 48px;
    height: 48px;
    border-radius: 12px;
    background: linear-gradient(135deg, rgba(var(--primary-rgb), 0.1), rgba(var(--primary-rgb), 0.05));
    color: rgb(var(--primary-rgb));
}

@media (min-width: 768px) {
    .products-section-title .title-icon {
        width: 56px;
        height: 56px;
        border-radius: 14px;
    }
}

.products-section-title .discount-icon {
    background: linear-gradient(135deg, rgba(239, 68, 68, 0.1), rgba(239, 68, 68, 0.05));
    color: #ef4444;
}

.products-section-title .all-products-icon {
    background: linear-gradient(135deg, rgba(16, 185, 129, 0.1), rgba(16, 185, 129, 0.05));
    color: #10b981;
}

/* Products Grid */
.products-grid {
    display: grid;
    grid-template-columns: repeat(2, 1fr);
    gap: 1rem;
}

@media (min-width: 640px) {
    .products-grid {
        grid-template-columns: repeat(3, 1fr);
        gap: 1.25rem;
    }
}

@media (min-width: 1024px) {
    .products-grid {
        grid-template-columns: repeat(4, 1fr);
        gap: 1.5rem;
    }
}

@media (min-width: 1280px) {
    .products-grid {
        grid-template-columns: repeat(5, 1fr);
    }
}

/* Special Products Grid for Featured Sections */
.products-grid-special {
    display: grid;
    grid-template-columns: repeat(2, 1fr);
    gap: 1rem;
}

@media (min-width: 640px) {
    .products-grid-special {
        grid-template-columns: repeat(3, 1fr);
        gap: 1.25rem;
    }
}

@media (min-width: 1024px) {
    .products-grid-special {
        grid-template-columns: repeat(6, 1fr);
        gap: 1.5rem;
    }
}

@media (min-width: 1024px) {
    .products-grid {
        grid-template-columns: repeat(auto-fill, minmax(260px, 1fr));
    }
}

@media (min-width: 1280px) {
    .products-grid {
        grid-template-columns: repeat(auto-fill, minmax(240px, 1fr));
    }
}

/* Empty State */
.empty-state {
    text-align: center;
    padding: 4rem 2rem;
}

.empty-icon {
    display: inline-flex;
    margin-bottom: 1.5rem;
    color: #e5e7eb;
}

.empty-title {
    font-size: 1.5rem;
    font-weight: 700;
    color: #374151;
    margin-bottom: 0.5rem;
}

.empty-text {
    color: #6b7280;
}

/* Pagination */
.pagination-wrapper {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-top: 3rem;
    padding-top: 2rem;
    border-top: 1px solid #e5e7eb;
    flex-wrap: wrap;
    gap: 1rem;
}

.pagination-info {
    color: #6b7280;
    font-size: 0.9375rem;
}

/* Reviews Layout */
.reviews-layout {
    display: grid;
    grid-template-columns: 1fr;
    gap: 3rem;
}

@media (min-width: 1024px) {
    .reviews-layout {
        grid-template-columns: 380px 1fr;
    }
}

.rating-summary {
    background: white;
    border-radius: 20px;
    padding: 1.5rem;
    height: fit-content;
}

.summary-title,
.reviews-title {
    font-size: 1.25rem;
    font-weight: 700;
    color: #1f2937;
    margin-bottom: 1.5rem;
}

.reviews-container {
    display: flex;
    flex-direction: column;
    gap: 1.5rem;
}

.review-item {
    background: white;
    border-radius: 16px;
    padding: 1.5rem;
    transition: all 0.3s ease;
}

.review-item:hover {
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
    transform: translateY(-2px);
}

.reviews-loading {
    display: flex;
    flex-direction: column;
    gap: 1rem;
}

.review-skeleton {
    display: flex;
    gap: 1rem;
    padding: 1rem;
    background: white;
    border-radius: 12px;
}

.no-reviews {
    text-align: center;
    padding: 3rem;
    background: white;
    border-radius: 16px;
    color: #6b7280;
}

/* CSS Variables */
:root {
    --primary-rgb: 59, 130, 246;
}

/* Responsive Adjustments */
@media (max-width: 768px) {
    .shop-header {
        flex-direction: column;
    }
    
    .stats-section {
        width: 100%;
        justify-content: space-between;
    }
    
    .nav-section {
        flex-direction: column;
        align-items: stretch;
    }
    
    .search-wrapper {
        max-width: 100%;
    }
}
</style>