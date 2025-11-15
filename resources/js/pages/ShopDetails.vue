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
                                :reviewRatings="averageRatings?.percentages || []"
                                :averageRating="averageRatings?.rating || 0" 
                                :totalReview="totalReviews" />
                        </div>

                        <!-- Reviews List -->
                        <div class="reviews-list">
                            <h3 class="reviews-title">{{ $t('Customer Reviews') }}</h3>
                            
                            <div v-if="!isLoadingReviews" class="reviews-container">
                                <div v-for="review in (reviews || [])" :key="review.id" class="review-item">
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

                            <div v-if="reviews && reviews.length === 0 && !isLoadingReviews" class="no-reviews">
                                <p>{{ $t('No reviews yet') }}</p>
                            </div>

                            <!-- Reviews Pagination -->
                            <div v-if="reviews && reviews.length > 0 && !isLoadingReviews" class="pagination-wrapper">
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

// Reviews variables
const reviews = ref([]);
const totalReviews = ref(0);
const averageRatings = ref(null);

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
    background: #fafafa;
}

/* Hero Banner Section */
.hero-section {
    position: relative;
    width: 100%;
    height: 250px;
    overflow: hidden;
}

@media (min-width: 768px) {
    .hero-section {
        height: 300px;
    }
}

@media (min-width: 1024px) {
    .hero-section {
        height: 350px;
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
    transition: transform 0.3s ease;
}

.banner-wrapper:hover .banner-image {
    transform: scale(1.02);
}

.banner-overlay {
    position: absolute;
    inset: 0;
    background: linear-gradient(
        to bottom,
        transparent 60%,
        rgba(0, 0, 0, 0.15) 100%
    );
    pointer-events: none;
}

.banner-particles {
    display: none;
}

/* Shop Info Section */
.shop-info-section {
    position: relative;
    background: white;
    padding: 2rem 0;
    margin-top: -60px;
}

.shop-card-wrapper {
    position: relative;
    z-index: 10;
    margin-bottom: 2rem;
    animation: fadeInUp 0.6s ease-out;
}

@keyframes fadeInUp {
    from {
        opacity: 0;
        transform: translateY(20px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}

.shop-card {
    background: linear-gradient(135deg, #ffffff 0%, #fafafa 100%);
    border-radius: 24px;
    padding: 1.75rem;
    box-shadow: 
        0 8px 24px rgba(0, 0, 0, 0.08),
        0 4px 12px rgba(0, 0, 0, 0.04),
        0 0 0 1px rgba(59, 130, 246, 0.05);
    position: relative;
    overflow: hidden;
    border: 1px solid rgba(59, 130, 246, 0.1);
    transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
    backdrop-filter: blur(10px);
}

.shop-card::before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    height: 4px;
    background: linear-gradient(90deg, 
        rgba(59, 130, 246, 0.8) 0%, 
        rgba(139, 92, 246, 0.8) 50%, 
        rgba(59, 130, 246, 0.8) 100%);
    opacity: 0;
    transition: opacity 0.3s ease;
}

.shop-card:hover {
    transform: translateY(-4px);
    box-shadow: 
        0 12px 32px rgba(0, 0, 0, 0.12),
        0 6px 16px rgba(0, 0, 0, 0.08),
        0 0 0 1px rgba(59, 130, 246, 0.15);
    border-color: rgba(59, 130, 246, 0.2);
}

.shop-card:hover::before {
    opacity: 1;
}

@media (min-width: 768px) {
    .shop-card {
        padding: 2.5rem;
        border-radius: 28px;
    }
}

@media (min-width: 1024px) {
    .shop-card {
        padding: 3rem;
    }
}

.card-glow {
    position: absolute;
    top: -50%;
    left: -50%;
    width: 200%;
    height: 200%;
    background: radial-gradient(
        circle,
        rgba(59, 130, 246, 0.1) 0%,
        transparent 70%
    );
    opacity: 0;
    transition: opacity 0.5s ease;
    pointer-events: none;
    z-index: 0;
}

.shop-card:hover .card-glow {
    opacity: 1;
    animation: pulseGlow 2s ease-in-out infinite;
}

@keyframes pulseGlow {
    0%, 100% {
        opacity: 0.3;
        transform: scale(1);
    }
    50% {
        opacity: 0.5;
        transform: scale(1.1);
    }
}

/* Shop Header */
.shop-header {
    display: flex;
    flex-direction: column;
    gap: 1.5rem;
    position: relative;
    z-index: 1;
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
    width: 80px;
    height: 80px;
}

@media (min-width: 768px) {
    .logo-wrapper {
        width: 100px;
        height: 100px;
    }
}

.logo-ring {
    display: none;
}

.shop-logo {
    width: 100%;
    height: 100%;
    border-radius: 12px;
    object-fit: cover;
    position: relative;
    z-index: 2;
    border: 3px solid white;
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
}

.logo-badge {
    position: absolute;
    bottom: -4px;
    right: -4px;
    width: 24px;
    height: 24px;
    background: #10b981;
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
    font-size: 1.375rem;
    font-weight: 700;
    color: #1f2937;
    line-height: 1.3;
}

@media (min-width: 768px) {
    .shop-name {
        font-size: 1.75rem;
    }
}

@media (min-width: 1024px) {
    .shop-name {
        font-size: 2rem;
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
    color: #4b5563;
    font-size: 14px;
    line-height: 1.7;
    max-width: 100%;
    padding: 1rem;
    background: linear-gradient(135deg, rgba(249, 250, 251, 0.8) 0%, rgba(243, 244, 246, 0.6) 100%);
    border-radius: 12px;
    border: 1px solid rgba(229, 231, 235, 0.5);
    transition: all 0.3s ease;
    flex: 1;
    position: relative;
    overflow: hidden;
}

.shop-description::before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    width: 3px;
    height: 100%;
    background: linear-gradient(180deg, 
        rgba(59, 130, 246, 0.8) 0%, 
        rgba(139, 92, 246, 0.8) 100%);
    opacity: 0;
    transition: opacity 0.3s ease;
}

.shop-description:hover {
    background: linear-gradient(135deg, rgba(249, 250, 251, 1) 0%, rgba(243, 244, 246, 0.9) 100%);
    border-color: rgba(59, 130, 246, 0.2);
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.04);
    transform: translateX(2px);
}

.shop-description:hover::before {
    opacity: 1;
}

.shop-description :deep(p),
.shop-description :deep(div),
.shop-description :deep(span) {
    margin: 0;
    color: inherit;
}

@media (min-width: 768px) {
    .shop-description {
        font-size: 15px;
        padding: 1.25rem;
        border-radius: 14px;
        max-width: none;
        flex: 1;
    }
}

@media (min-width: 1024px) {
    .shop-description {
        font-size: 15px;
        padding: 1.5rem;
        border-radius: 16px;
        max-width: 700px;
    }
}

/* Stats Section */
.stats-section {
    display: flex;
    flex-direction: column;
    gap: 1rem;
    width: 100%;
    margin-top: 1.5rem;
    position: relative;
    z-index: 1;
}

@media (min-width: 768px) {
    .stats-section {
        flex-direction: row;
        gap: 1.5rem;
        align-items: flex-start;
        justify-content: space-between;
        width: 100%;
        margin-top: 1rem;
    }
}

@media (min-width: 1024px) {
    .stats-section {
        gap: 2rem;
        align-items: center;
        justify-content: space-between;
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
    padding: 14px 24px;
    border-radius: 12px;
    background: linear-gradient(135deg, #3b82f6 0%, #2563eb 100%);
    border: none;
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 10px;
    transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
    overflow: hidden;
    width: 100%;
    cursor: pointer;
    color: white;
    font-weight: 600;
    font-size: 15px;
    box-shadow: 
        0 4px 12px rgba(59, 130, 246, 0.3),
        0 2px 6px rgba(59, 130, 246, 0.2);
}

@media (min-width: 768px) {
    .chat-button {
        width: auto;
        min-width: 180px;
        padding: 16px 28px;
        border-radius: 14px;
    }
}

.chat-button::before {
    content: '';
    position: absolute;
    top: 0;
    left: -100%;
    width: 100%;
    height: 100%;
    background: linear-gradient(90deg, 
        transparent, 
        rgba(255, 255, 255, 0.2), 
        transparent);
    transition: left 0.5s ease;
}

.chat-button:hover::before {
    left: 100%;
}

.chat-bg {
    position: absolute;
    inset: 0;
    background: linear-gradient(135deg, #2563eb 0%, #1d4ed8 100%);
    opacity: 0;
    transition: opacity 0.3s ease;
    z-index: 0;
}

.chat-button:hover .chat-bg {
    opacity: 1;
}

.chat-content {
    position: relative;
    display: flex;
    align-items: center;
    gap: 10px;
    z-index: 2;
}

.chat-icon-wrapper {
    position: relative;
    color: white;
    display: flex;
    align-items: center;
    justify-content: center;
    width: 24px;
    height: 24px;
    transition: transform 0.3s ease;
}

.chat-icon-wrapper img {
    filter: brightness(0) invert(1);
    width: 24px;
    height: 24px;
}

.chat-button:hover .chat-icon-wrapper {
    transform: scale(1.1) rotate(5deg);
}

.chat-pulse {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    width: 100%;
    height: 100%;
    border-radius: 50%;
    background: rgba(255, 255, 255, 0.3);
    animation: pulseRing 2s cubic-bezier(0.4, 0, 0.6, 1) infinite;
    pointer-events: none;
}

@keyframes pulseRing {
    0% {
        transform: translate(-50%, -50%) scale(0.8);
        opacity: 1;
    }
    100% {
        transform: translate(-50%, -50%) scale(1.5);
        opacity: 0;
    }
}

.chat-text {
    font-weight: 600;
    color: white;
    font-size: 15px;
    letter-spacing: 0.3px;
}

.chat-button:hover {
    background: linear-gradient(135deg, #2563eb 0%, #1d4ed8 100%);
    transform: translateY(-2px);
    box-shadow: 
        0 6px 20px rgba(59, 130, 246, 0.4),
        0 4px 12px rgba(59, 130, 246, 0.3);
}

.chat-button:active {
    transform: translateY(0);
    box-shadow: 
        0 2px 8px rgba(59, 130, 246, 0.3),
        0 1px 4px rgba(59, 130, 246, 0.2);
}

/* Navigation Tabs - Mobile Optimized */
.nav-section {
    margin-top: 1.5rem;
    padding-top: 1.5rem;
    border-top: 1px solid rgba(229, 231, 235, 0.8);
    display: flex;
    flex-direction: column;
    gap: 1rem;
    position: relative;
    z-index: 1;
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
    padding: 10px 16px;
    border-radius: 8px;
    background: #f3f4f6;
    border: none;
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 6px;
    font-weight: 600;
    font-size: 14px;
    color: #6b7280;
    transition: all 0.2s ease;
    overflow: hidden;
    cursor: pointer;
}

@media (min-width: 768px) {
    .tab-button {
        flex: none;
        padding: 12px 24px;
        gap: 8px;
        font-size: 15px;
    }
}

.tab-icon {
    display: flex;
    align-items: center;
}

.tab-indicator {
    display: none;
}

.tab-button.active {
    background: #3b82f6;
    color: white;
}

.tab-button:hover:not(.active) {
    background: #e5e7eb;
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
    padding: 12px 48px 12px 16px;
    background: white;
    border: 1px solid #e5e7eb;
    border-radius: 10px;
    font-size: 14px;
    transition: all 0.2s ease;
    outline: none;
}

.search-input:focus {
    border-color: #3b82f6;
    box-shadow: 0 0 0 3px rgba(59, 130, 246, 0.1);
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
    display: none;
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

[dir="rtl"] .categories-controls {
    flex-direction: row-reverse;
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

[dir="rtl"] .scroll-left svg {
    transform: scaleX(-1);
}

[dir="rtl"] .scroll-right svg {
    transform: scaleX(-1);
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
    padding: 1.25rem;
    background: linear-gradient(135deg, #ffffff 0%, #fafafa 100%);
    border: 2px solid #e5e7eb;
    border-radius: 18px;
    cursor: pointer;
    transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
    overflow: hidden;
    flex-shrink: 0;
    width: 140px;
    min-height: 150px;
    box-shadow: 
        0 2px 8px rgba(0, 0, 0, 0.04),
        0 1px 3px rgba(0, 0, 0, 0.02);
}

.category-item::before {
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

.category-item:hover {
    border-color: rgba(59, 130, 246, 0.4);
    box-shadow: 
        0 12px 28px rgba(0, 0, 0, 0.12),
        0 4px 12px rgba(59, 130, 246, 0.15);
    transform: translateY(-5px);
    background: linear-gradient(135deg, #ffffff 0%, #f8fafc 100%);
}

.category-item:hover::before {
    opacity: 1;
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
    width: 64px;
    height: 64px;
    border-radius: 16px;
    overflow: hidden;
    background: linear-gradient(135deg, #f8fafc 0%, #f1f5f9 50%, #e2e8f0 100%);
    padding: 12px;
    display: flex;
    align-items: center;
    justify-content: center;
    box-shadow: 
        inset 0 2px 4px rgba(0, 0, 0, 0.04),
        0 2px 6px rgba(0, 0, 0, 0.06);
    border: 1px solid rgba(226, 232, 240, 0.8);
    transition: all 0.3s ease;
}

.category-item:hover .category-icon {
    background: linear-gradient(135deg, #ffffff 0%, #f8fafc 50%, #f1f5f9 100%);
    box-shadow: 
        inset 0 2px 6px rgba(0, 0, 0, 0.06),
        0 4px 10px rgba(59, 130, 246, 0.2);
    border-color: rgba(59, 130, 246, 0.3);
    transform: scale(1.05);
}

.category-icon img {
    width: 100%;
    height: 100%;
    object-fit: contain;
    filter: drop-shadow(0 2px 4px rgba(0, 0, 0, 0.1));
    transition: all 0.3s ease;
}

.category-item:hover .category-icon img {
    transform: scale(1.1);
    filter: drop-shadow(0 4px 8px rgba(0, 0, 0, 0.15));
}

.category-icon svg {
    width: 100%;
    height: 100%;
    color: rgb(var(--primary-rgb));
    filter: drop-shadow(0 2px 4px rgba(0, 0, 0, 0.1));
    transition: all 0.3s ease;
}

.category-item:hover .category-icon svg {
    transform: scale(1.1);
    filter: drop-shadow(0 4px 8px rgba(0, 0, 0, 0.15));
}

.category-name {
    font-weight: 600;
    font-size: 0.875rem;
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
    width: 100%;
    min-height: 2.5rem;
    transition: all 0.3s ease;
    letter-spacing: -0.01em;
}

.category-item:hover .category-name {
    color: rgba(59, 130, 246, 1);
    font-weight: 700;
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
    display: none;
}

.category-item.active {
    border-color: rgba(59, 130, 246, 0.6);
    background: linear-gradient(135deg, #eff6ff 0%, #dbeafe 100%);
    box-shadow: 
        0 8px 20px rgba(59, 130, 246, 0.2),
        0 2px 8px rgba(59, 130, 246, 0.15);
}

.category-item.active::before {
    opacity: 1;
}

.category-item.active .category-icon {
    background: linear-gradient(135deg, #ffffff 0%, #eff6ff 50%, #dbeafe 100%);
    border-color: rgba(59, 130, 246, 0.4);
    box-shadow: 
        inset 0 2px 6px rgba(59, 130, 246, 0.1),
        0 4px 10px rgba(59, 130, 246, 0.25);
}

.category-item.active .category-name {
    color: rgba(59, 130, 246, 1);
    font-weight: 700;
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

[dir="rtl"] .subcategories-controls {
    flex-direction: row-reverse;
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
    gap: 8px;
    padding: 10px 16px;
    background: white;
    border: 1px solid #e5e7eb;
    border-radius: 8px;
    font-size: 14px;
    font-weight: 500;
    color: #6b7280;
    cursor: pointer;
    transition: all 0.2s ease;
    white-space: nowrap;
    flex-shrink: 0;
    min-width: 100px;
}

.subcategory-item:hover {
    background: #f3f4f6;
    border-color: #d1d5db;
}

.subcategory-item.active {
    background: #eff6ff;
    border-color: #3b82f6;
    color: #3b82f6;
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
    margin-top: 1.5rem;
}

.banners-swiper {
    padding: 0.5rem 0;
}

.banner-card {
    position: relative;
    border-radius: 12px;
    overflow: hidden;
    aspect-ratio: 3/1;
    border: 1px solid #f0f0f0;
}

.banner-img {
    width: 100%;
    height: 100%;
    object-fit: cover;
    transition: transform 0.3s ease;
}

.banner-card:hover .banner-img {
    transform: scale(1.02);
}

.banner-shine {
    display: none;
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
    font-size: 1.375rem;
    font-weight: 700;
    color: #1f2937;
    display: flex;
    align-items: center;
    gap: 10px;
    margin-bottom: 1.5rem;
    padding-bottom: 12px;
    border-bottom: 1px solid #e5e7eb;
}

@media (min-width: 768px) {
    .products-section-title {
        font-size: 1.5rem;
        margin-bottom: 2rem;
    }
}

.products-section-title .title-icon {
    display: flex;
    align-items: center;
    justify-content: center;
    width: 36px;
    height: 36px;
    border-radius: 8px;
    background: #eff6ff;
    color: #3b82f6;
}

@media (min-width: 768px) {
    .products-section-title .title-icon {
        width: 40px;
        height: 40px;
    }
}

.products-section-title .discount-icon {
    background: #fef2f2;
    color: #ef4444;
}

.products-section-title .all-products-icon {
    background: #f0fdf4;
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
        grid-template-columns: repeat(8, 1fr);
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
        grid-template-columns: repeat(4, 1fr);
    }
}

@media (min-width: 1280px) {
    .products-grid {
        grid-template-columns: repeat(8, 1fr);
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