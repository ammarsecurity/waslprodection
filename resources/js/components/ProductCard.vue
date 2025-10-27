<!-- Enhanced Product Card with Modern UI/UX -->
<template>
    <div class="product-card-wrapper">
        <div class="product-card" 
            :class="[
                props.product?.quantity > 0 ? 'in-stock' : 'out-of-stock',
                { 'card-hovering': isHovering }
            ]"
            @mouseenter="isHovering = true"
            @mouseleave="isHovering = false">

            <!-- Card Glow Effect -->
            <div class="card-glow"></div>
            
            <!-- Product Image Section -->
            <div class="image-section">
                <div class="image-container" @click="showProductDetails">
                    <!-- Multiple Image Layers for Depth -->
                    <div class="image-backdrop"></div>
                    <img :src="props.product?.thumbnail" 
                         class="product-image" 
                         :alt="props.product?.name"
                         loading="lazy" />
                    <div class="image-overlay"></div>
                    
                    <!-- Stock Overlay -->
                    <div v-if="props.product?.quantity <= 0" class="stock-overlay">
                        <div class="stock-message">
                            <svg class="w-8 h-8 mb-2" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 16h-1v-4h-1m1-4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
                            </svg>
                            <span>{{ $t('Out of Stock') }}</span>
                        </div>
                    </div>
                </div>

                <!-- Enhanced Discount Badge -->
                <div v-if="props.product?.discount_percentage > 0" class="discount-badge">
                    <div class="discount-inner">
                        <div class="discount-content">
                            <span class="discount-value">{{ props.product?.discount_percentage }}%</span>
                            <span class="discount-text">{{ $t('OFF') }}</span>
                        </div>
                        <div class="discount-shine"></div>
                    </div>
                    <div class="discount-pulse"></div>
                </div>

                <!-- Enhanced Favorite Button -->
                <button class="favorite-btn" 
                    :class="{ 'is-favorite': props.product?.is_favorite }"
                    @click.stop="favoriteAddOrRemove">
                    <div class="favorite-bg"></div>
                    <HeartIconOutline v-if="!props.product?.is_favorite" class="w-6 h-6 text-slate-600" />
                    <HeartIcon v-else class="heart-icon filled" />
                  
                </button>

        
                <!-- Quick View Button -->
                <button v-if="props.product?.quantity > 0" 
                    class="quick-view-btn" 
                    @click="showProductDetails">
                    <svg class="w-5 h-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z" />
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z" />
                    </svg>
                    <span>{{ $t('Quick View') }}</span>
                </button>
            </div>

            <!-- Product Details Section -->
            <div class="details-section" @click="showProductDetails">
                <!-- Product Name with Truncate -->
                <h3 class="product-name">
                    {{ props.product?.name }}
                </h3>

                <!-- Price Section with Animation -->
                <div class="price-section">
                    <div class="price-wrapper">
                        <span class="current-price">
                            {{ masterStore.showCurrency(props.product?.discount_price > 0 ? 
                                props.product?.discount_price : props.product?.price) }}
                        </span>
                        <span v-if="props.product?.discount_price > 0" class="original-price">
                            {{ masterStore.showCurrency(props.product?.price) }}
                        </span>
                    </div>
                    <div v-if="props.product?.discount_price > 0" class="savings-badge">
                        {{ $t('Save') }} {{ masterStore.showCurrency(props.product?.price - props.product?.discount_price) }}
                    </div>
                </div>

                <!-- Enhanced Stats Section -->
                <div class="stats-section">
                    <!-- Rating with Stars -->
                    <div class="rating-wrapper">
                        <div class="stars-container">
                            <div class="stars-background">
                                <StarIcon v-for="i in 5" :key="`bg-${i}`" class="star-empty" />
                            </div>
                            <div class="stars-filled" :style="`width: ${(props.product?.rating / 5) * 100}%`">
                                <StarIcon v-for="i in 5" :key="`fill-${i}`" class="star-filled" />
                            </div>
                        </div>
                        <span class="rating-text">
                            {{ props.product?.rating }} ({{ props.product?.total_reviews }})
                        </span>
                    </div>

                    <!-- Sales Badge -->
                    <!-- <div v-if="props.product?.quantity > 0" class="sales-badge">
                        <svg class="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 7h8m0 0v8m0-8l-8 8-4-4-6 6" />
                        </svg>
                        <span>{{ props.product?.total_sold }} {{ $t('Sold') }}</span>
                    </div> -->
                </div>
            </div>

            <!-- Enhanced Action Buttons -->
            <div class="action-section">
                <div v-if="props.product?.quantity > 0" class="action-buttons">
                    <!-- Add to Cart Button -->
                    <button class="cart-button" 
                        :class="{ 'is-loading': isAddingToCart }"
                        :disabled="isAddingToCart"
                        @click.stop="addToBasket(props.product)">
                        <div class="button-bg"></div>
                        <div class="button-content">
                            <!-- Loader -->
                            <div v-if="isAddingToCart" class="loader">
                                <svg class="w-5 h-5 animate-spin" fill="none" viewBox="0 0 24 24">
                                    <circle class="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" stroke-width="4"></circle>
                                    <path class="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"></path>
                                </svg>
                            </div>
                            <!-- Normal Content -->
                            <template v-else>
                                <BagIcon class="w-5 h-5" />
                                <span class="button-text">{{ $t('Add') }}</span>
                            </template>
                        </div>
                        <div class="button-shine"></div>
                    </button>

                    <!-- Buy Now Button -->
                    <button class="buy-button" @click.stop="buyNow">
                        <div class="buy-bg"></div>
                        <div class="buy-content">
                            <span class="buy-text">{{ $t('Buy Now') }}</span>
                            <svg class="buy-arrow" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 7l5 5m0 0l-5 5m5-5H6" />
                            </svg>
                        </div>
                        <div class="buy-ripple"></div>
                    </button>
                </div>

                <!-- Out of Stock Button -->
                <button v-else class="stock-button" disabled>
                    <svg class="w-5 h-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4m0 4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
                    </svg>
                    <span>{{ $t('Notify When Available') }}</span>
                </button>
            </div>
        </div>

        <!-- Auth Modal -->
        <div v-if="showAuthModal" class="auth-modal-overlay" @click="showAuthModal = false">
            <div class="auth-modal" @click.stop>
                <div class="modal-header">
                    <h3 class="modal-title">{{ $t('Complete Purchase') }}</h3>
                    <button class="close-btn" @click="showAuthModal = false">
                        <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12" />
                        </svg>
                    </button>
                </div>
                
                <div class="modal-content">
                    <p class="modal-message">{{ $t('Please choose how you would like to continue with your purchase') }}</p>
                    
                    <div class="auth-options">
                        <!-- Continue as Guest -->
                        <button class="guest-btn" @click="continueAsGuest">
                            <div class="btn-icon">
                                <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 11V7a4 4 0 00-8 0v4M8 11v6h8v-6H8z" />
                                </svg>
                            </div>
                            <div class="btn-content">
                                <span class="btn-title">{{ $t('Continue as Guest') }}</span>
                                <span class="btn-subtitle">{{ $t('Quick checkout without account') }}</span>
                            </div>
                        </button>

                        <!-- Login -->
                        <button class="login-btn text-align-right" @click="showLogin">
                            <div class="btn-icon">
                                <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z" />
                                </svg>
                            </div>
                            <div class="btn-content">
                                <span class="btn-title">{{ $t('Login') }}</span>
                                <span class="btn-subtitle">{{ $t('Access your account and saved info') }}</span>
                            </div>
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script setup>
import { HeartIcon as HeartIconOutline } from '@heroicons/vue/24/outline';
import { HeartIcon, StarIcon } from '@heroicons/vue/24/solid';
import { ref } from 'vue';
import { useRouter } from 'vue-router';
import { useToast } from 'vue-toastification';
import BagIcon from '../icons/Bag.vue';
import { useAuth } from '../stores/AuthStore';
import { useBasketStore } from '../stores/BasketStore';
import { useMaster } from '../stores/MasterStore';

const router = useRouter();
const masterStore = useMaster();
const basketStore = useBasketStore();
const authStore = useAuth();
const toast = useToast();

const props = defineProps({
    product: Object
});

const isHovering = ref(false);
const isAddingToCart = ref(false);
const showAuthModal = ref(false);

const orderData = {
    is_buy_now: false,
    product_id: props.product?.id,
    quantity: 1,
    size: null,
    color: null,
    unit: null
};

const addToBasket = async (product) => {
    if (isAddingToCart.value) return;
    isAddingToCart.value = true;
    
    try {
        console.log("Adding to shop group:", orderData);
        console.log("Product details:", product);
        // is_buy_now for order data
        orderData.is_buy_now = false;
        await basketStore.addToCart(orderData, product);
        // Add visual feedback
        const event = new CustomEvent('productAddedToCart', { detail: product });
        window.dispatchEvent(event);
    } catch (error) {
        console.error('Error adding to basket:', error);
        toast.error('Failed to add to cart');
    } finally {
        isAddingToCart.value = false;
    }
};

const buyNow = async () => {
    // التحقق من تسجيل الدخول
    if (!authStore.token) {
        showAuthModal.value = true;
        return;
    }

    await basketStore.addToCart({
        product_id: props.product?.id,
        is_buy_now: true,
        quantity: 1,
        size: null,
        color: null,
        unit: null,
        shop_id: props.product?.shop?.id
    }, props.product);

    basketStore.buyNowShopId = props.product?.shop?.id;
    router.push({ name: 'buynow' });
};

const continueAsGuest = async () => {
    showAuthModal.value = false;
    
    await basketStore.addToCart({
        product_id: props.product?.id,
        is_buy_now: true,
        quantity: 1,
        size: null,
        color: null,
        unit: null,
        shop_id: props.product?.shop?.id,
        shop_name: props.product?.shop?.name,
        shop_thumbnail: props.product?.shop?.logo
    }, props.product);

    basketStore.buyNowShopId = props.product?.shop?.id;
    router.push({ name: 'guest-checkout' });
};

const showLogin = () => {
    showAuthModal.value = false;
    authStore.loginModal = true;
};

const isFavorite = ref(props.product?.is_favorite);

const favoriteAddOrRemove = () => {
    if (authStore.token === null) {
        return authStore.loginModal = true;
    }
    
    axios.post('/favorite-add-or-remove', {
        product_id: props.product.id
    }, {
        headers: {
            Authorization: authStore.token
        }
    }).then((response) => {
        props.product.is_favorite = !props.product.is_favorite;
        isFavorite.value = response.data.data.product.is_favorite;
        
        if (isFavorite.value === false) {
            toast.warning('Product removed from favorite', {
                position: masterStore.langDirection === 'rtl' ? "bottom-right" : "bottom-left",
            });
        } else {
            toast.success('Product added to favorite', {
                position: masterStore.langDirection === 'rtl' ? "bottom-right" : "bottom-left",
            });
        }
        
        authStore.favoriteRemove = true;
        authStore.fetchFavoriteProducts();
    });
};

const showProductDetails = () => {
    if (props.product.quantity > 0) {
        router.push({ name: 'productDetails', params: { id: props.product.id } });
    }
};
</script>

<style scoped>
/* Modern Product Card Styles */
.product-card-wrapper {
    height: 100%;
}

.product-card {
    position: relative;
    height: 100%;
    background: #ffffff;
    border-radius: 16px;
    overflow: hidden;
    border: 1px solid #f0f0f0;
    transition: all 0.3s ease;
    display: flex;
    flex-direction: column;
    box-shadow: 
        0 2px 8px rgba(0, 0, 0, 0.04),
        0 1px 3px rgba(0, 0, 0, 0.02);
}

.product-card.in-stock:hover {
    transform: translateY(-4px);
    border-color: #e0e0e0;
    box-shadow: 
        0 12px 24px rgba(0, 0, 0, 0.08),
        0 4px 12px rgba(0, 0, 0, 0.04);
}

.product-card.out-of-stock {
    opacity: 0.85;
}

.card-glow {
    display: none;
}

/* Image Section Styles */
.image-section {
    position: relative;
    width: 100%;
    height: 260px;
    overflow: hidden;
    background: #fafafa;
}

@media (min-width: 640px) {
    .image-section {
        height: 280px;
    }
}

@media (min-width: 1024px) {
    .image-section {
        height: 300px;
    }
}

.image-container {
    position: relative;
    width: 100%;
    height: 100%;
    cursor: pointer;
    overflow: hidden;
}

.image-backdrop {
    display: none;
}

.product-image {
    width: 100%;
    height: 100%;
    object-fit: cover;
    position: relative;
    z-index: 1;
    transition: transform 0.3s ease;
}

.product-card:hover .product-image {
    transform: scale(1.05);
}

.image-overlay {
    display: none;
}

.stock-overlay {
    position: absolute;
    inset: 0;
    background: rgba(255, 255, 255, 0.95);
    backdrop-filter: blur(5px);
    display: flex;
    align-items: center;
    justify-content: center;
    z-index: 10;
}

.stock-message {
    text-align: center;
    color: #6b7280;
    font-weight: 600;
    display: flex;
    flex-direction: column;
    align-items: center;
}

/* Discount Badge */
.discount-badge {
    position: absolute;
    top: 12px;
    left: 12px;
    z-index: 5;
}

.discount-inner {
    position: relative;
    padding: 6px 10px;
    background: #ef4444;
    border-radius: 8px;
    display: flex;
    align-items: center;
    justify-content: center;
    box-shadow: 0 2px 8px rgba(239, 68, 68, 0.25);
    overflow: hidden;
    min-width: 50px;
}

.discount-content {
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 3px;
    position: relative;
    z-index: 2;
}

.discount-value {
    color: white;
    font-weight: 700;
    font-size: 14px;
    letter-spacing: -0.3px;
}

.discount-text {
    color: white;
    font-size: 10px;
    font-weight: 600;
    opacity: 0.95;
    text-transform: uppercase;
    letter-spacing: 0.5px;
}

.discount-shine {
    display: none;
}

.discount-pulse {
    display: none;
}

/* Favorite Button */
.favorite-btn {
    position: absolute;
    top: 12px;
    right: 12px;
    width: 36px;
    height: 36px;
    border-radius: 50%;
    background: rgba(255, 255, 255, 0.95);
    display: flex;
    align-items: center;
    justify-content: center;
    transition: all 0.2s ease;
    z-index: 5;
    box-shadow: 0 2px 6px rgba(0, 0, 0, 0.08);
    overflow: hidden;
    border: none;
    cursor: pointer;
    backdrop-filter: blur(10px);
}

.favorite-bg {
    display: none;
}

.heart-icon {
    width: 20px;
    height: 20px;
    transition: all 0.2s ease;
    position: relative;
    z-index: 2;
}

.heart-icon.outline {
    color: #6b7280;
}

.favorite-btn:hover .heart-icon.outline {
    color: #ef4444;
    transform: scale(1.1);
}

.heart-icon.filled {
    color: #ef4444;
}

.favorite-particles {
    display: none;
}

/* Quick View Button */
.quick-view-btn {
    display: none;
}

/* Details Section */
.details-section {
    padding: 14px 16px;
    flex: 1;
    display: flex;
    flex-direction: column;
    gap: 10px;
    cursor: pointer;
}

.product-name {
    font-size: 14.5px;
    font-weight: 600;
    color: #1f2937;
    line-height: 1.5;
    display: -webkit-box;
    -webkit-line-clamp: 2;
    line-clamp: 2;
    -webkit-box-orient: vertical;
    overflow: hidden;
    transition: color 0.2s ease;
    min-height: 42px;
}

.product-card:hover .product-name {
    color: #0f172a;
}

/* Price Section */
.price-section {
    display: flex;
    flex-direction: column;
    gap: 6px;
}

.price-wrapper {
    display: flex;
    align-items: baseline;
    gap: 8px;
    flex-wrap: wrap;
}

.current-price {
    font-size: 19px;
    font-weight: 700;
    color: #1f2937;
    line-height: 1;
}

.original-price {
    font-size: 14px;
    color: #9ca3af;
    text-decoration: line-through;
    line-height: 1;
    position: relative;
    font-weight: 500;
}

.original-price::after {
    display: none;
}

.savings-badge {
    display: none;
}

/* Stats Section */
.stats-section {
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding-top: 10px;
    border-top: 1px solid #f3f4f6;
}

.rating-wrapper {
    display: flex;
    align-items: center;
    gap: 6px;
}

.stars-container {
    position: relative;
    width: 75px;
    height: 14px;
    display: flex;
}

.stars-background,
.stars-filled {
    position: absolute;
    top: 0;
    left: 0;
    display: flex;
    gap: 2px;
}

.stars-filled {
    overflow: hidden;
}

.star-empty {
    width: 13px;
    height: 13px;
    color: #e5e7eb;
}

.star-filled {
    width: 13px;
    height: 13px;
    color: #fbbf24;
}

.rating-text {
    font-size: 12px;
    color: #6b7280;
    font-weight: 500;
}

.sales-badge {
    display: none;
}

/* Action Section */
.action-section {
    padding: 0 16px 14px;
}

.action-buttons {
    display: flex;
    gap: 8px;
    align-items: stretch;
}

/* Cart Button */
.cart-button {
    flex: 0 0 auto;
    width: 44px;
    height: 44px;
    border-radius: 10px;
    border: 1px solid #e5e7eb;
    background: white;
    position: relative;
    overflow: hidden;
    transition: all 0.2s ease;
    cursor: pointer;
    min-width: 44px;
}

.cart-button:disabled {
    opacity: 0.6;
    cursor: not-allowed;
    transform: none !important;
}

.cart-button.is-loading {
    pointer-events: none;
}

.cart-button .loader {
    display: flex;
    align-items: center;
    justify-content: center;
    color: #3b82f6;
}

.cart-button .loader svg {
    animation: spin 1s linear infinite;
}

@keyframes spin {
    from {
        transform: rotate(0deg);
    }
    to {
        transform: rotate(360deg);
    }
}

.button-bg {
    display: none;
}

.button-content {
    position: relative;
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 4px;
    height: 100%;
    color: #3b82f6;
    z-index: 2;
}

.cart-button:hover {
    border-color: #3b82f6;
    background: #f0f9ff;
}

.button-text {
    display: none;
}

.button-shine {
    display: none;
}

/* Buy Button */
.buy-button {
    flex: 1;
    padding: 12px 16px;
    border-radius: 10px;
    background: #3b82f6;
    color: white;
    position: relative;
    overflow: hidden;
    transition: all 0.2s ease;
    border: none;
    cursor: pointer;
    min-height: 44px;
    display: flex;
    align-items: center;
    justify-content: center;
    font-weight: 600;
    font-size: 14px;
}

.buy-bg {
    display: none;
}

.buy-content {
    position: relative;
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 6px;
    z-index: 2;
    flex-wrap: nowrap;
    white-space: nowrap;
}

.buy-text {
    font-size: 14px;
    font-weight: 600;
    color: white !important;
}

.buy-arrow {
    width: 16px;
    height: 16px;
    transition: transform 0.2s ease;
    flex-shrink: 0;
}

.buy-button:hover .buy-arrow {
    transform: translateX(2px);
}

.buy-button:hover {
    background: #2563eb;
}

.buy-button:active {
    background: #1d4ed8;
}

.buy-ripple {
    display: none;
}

/* Stock Button */
.stock-button {
    width: 100%;
    padding: 12px;
    border-radius: 10px;
    background: #f3f4f6;
    color: #9ca3af;
    border: 1px solid #e5e7eb;
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 6px;
    font-size: 14px;
    font-weight: 600;
    cursor: not-allowed;
    opacity: 0.8;
    min-height: 44px;
}

/* Auth Modal Styles */
.auth-modal-overlay {
    position: fixed;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    background: rgba(0, 0, 0, 0.5);
    backdrop-filter: blur(5px);
    display: flex;
    align-items: center;
    justify-content: center;
    z-index: 1000;
    padding: 20px;
    animation: fadeIn 0.3s ease;
}

@keyframes fadeIn {
    from {
        opacity: 0;
    }
    to {
        opacity: 1;
    }
}

.auth-modal {
    background: white;
    border-radius: 20px;
    max-width: 480px;
    width: 100%;
    max-height: 90vh;
    overflow: hidden;
    box-shadow: 
        0 25px 50px rgba(0, 0, 0, 0.15),
        0 10px 25px rgba(0, 0, 0, 0.1);
    animation: slideUp 0.3s cubic-bezier(0.175, 0.885, 0.32, 1.275);
}

@keyframes slideUp {
    from {
        transform: translateY(50px) scale(0.95);
        opacity: 0;
    }
    to {
        transform: translateY(0) scale(1);
        opacity: 1;
    }
}

.modal-header {
    padding: 24px 24px 16px;
    display: flex;
    align-items: center;
    justify-content: space-between;
    border-bottom: 1px solid #f3f4f6;
}

.modal-title {
    font-size: 20px;
    font-weight: 700;
    color: #1f2937;
    margin: 0;
}

.close-btn {
    width: 40px;
    height: 40px;
    border-radius: 12px;
    background: #f9fafb;
    border: none;
    display: flex;
    align-items: center;
    justify-content: center;
    color: #6b7280;
    cursor: pointer;
    transition: all 0.2s ease;
}

.close-btn:hover {
    background: #f3f4f6;
    color: #374151;
    transform: scale(1.05);
}

.modal-content {
    padding: 24px;
}

.modal-message {
    color: #6b7280;
    font-size: 15px;
    line-height: 1.6;
    margin: 0 0 24px 0;
    text-align: center;
}

.auth-options {
    display: flex;
    flex-direction: column;
    gap: 12px;
}

.guest-btn,
.login-btn {
    display: flex;
    align-items: center;
    gap: 16px;
    padding: 20px;
    border-radius: 16px;
    border: 2px solid #e5e7eb;
    background: white;
    cursor: pointer;
    transition: all 0.3s cubic-bezier(0.175, 0.885, 0.32, 1.275);
    text-align: right;
    flex-direction: row-reverse;
}

.guest-btn:hover,
.login-btn:hover {
    border-color: rgb(var(--primary-rgb));
    background: rgba(var(--primary-rgb), 0.02);
    transform: translateY(-2px);
    box-shadow: 0 8px 25px rgba(var(--primary-rgb), 0.15);
}

.btn-icon {
    width: 48px;
    height: 48px;
    border-radius: 12px;
    background: linear-gradient(135deg, rgba(var(--primary-rgb), 0.1), rgba(var(--primary-rgb), 0.05));
    display: flex;
    align-items: center;
    justify-content: center;
    color: rgb(var(--primary-rgb));
    flex-shrink: 0;
}

.btn-content {
    display: flex;
    flex-direction: column;
    gap: 4px;
    flex: 1;
}

.btn-title {
    font-size: 16px;
    font-weight: 600;
    color: #1f2937;
    line-height: 1.2;
}

.btn-subtitle {
    font-size: 13px;
    color: #6b7280;
    line-height: 1.3;
}

/* Mobile Responsive */
@media (max-width: 640px) {
    .auth-modal {
        margin: 0 10px;
        border-radius: 16px;
    }
    
    .modal-header {
        padding: 20px 20px 12px;
    }
    
    .modal-content {
        padding: 20px;
    }
    
    .auth-options {
        gap: 10px;
    }
    
    .guest-btn,
    .login-btn {
        padding: 16px;
        gap: 12px;
    }
    
    .btn-icon {
        width: 40px;
        height: 40px;
    }
    
    .btn-title {
        font-size: 15px;
    }
    
    .btn-subtitle {
        font-size: 12px;
    }
}

/* Responsive Design */
@media (max-width: 640px) {
    .product-card {
        border-radius: 14px;
    }
    
    .image-section {
        height: 240px;
    }
    
    .details-section {
        padding: 12px 14px;
        gap: 8px;
    }
    
    .action-section {
        padding: 0 14px 12px;
    }

    .action-buttons {
        gap: 6px;
        height: 44px;
    }

    .cart-button {
        width: 44px;
        min-width: 44px;
        height: 44px;
        border-radius: 8px;
    }

    .buy-button {
        flex: 1;
        padding: 10px 12px;
        border-radius: 8px;
        min-height: 44px;
        font-size: 13px;
    }

    .buy-content {
        gap: 4px;
    }

    .buy-text {
        font-size: 13px;
    }

    .buy-arrow {
        width: 14px;
        height: 14px;
    }

    .stock-button {
        padding: 12px;
        border-radius: 8px;
        font-size: 13px;
        min-height: 44px;
        gap: 5px;
    }
    
    .current-price {
        font-size: 17px;
    }

    .product-name {
        font-size: 14px;
        min-height: 40px;
    }

    .price-section {
        gap: 5px;
    }

    .stats-section {
        padding-top: 8px;
    }

    .rating-text {
        font-size: 11px;
    }
    
    .discount-inner {
        padding: 5px 9px;
        min-width: 45px;
    }
    
    .discount-value {
        font-size: 13px;
    }
    
    .discount-text {
        font-size: 9px;
    }
}

</style>