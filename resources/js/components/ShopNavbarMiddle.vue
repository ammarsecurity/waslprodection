<!-- Enhanced Navbar Component with Modern UI/UX -->
<template>
    <div class="navbar-wrapper">
        <!-- Enhanced Glass Navbar with Floating Effect -->
        <div class="glass-navbar">
            <div class="main-container py-4">
                <div class="flex items-center justify-between">
                    
                    <!-- Enhanced Logo Section with 3D Effects -->
                    <div class="logo-section">
                        <!-- Shop Logo First -->
                        <div v-if="master.shopLogo" class="shop-logo-wrapper">
                            <div class="shop-logo-container">
                                <div class="shop-logo-ring"></div>
                                <img :src="master.shopLogo" alt="Shop Logo" class="shop-logo" />
                                <div class="pulse-ring"></div>
                                <div class="shop-badge">
                                    <svg class="w-4 h-4" fill="currentColor" viewBox="0 0 20 20">
                                        <path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"/>
                                    </svg>
                                </div>
                            </div>
                        </div>
                        
                        <!-- Main Logo Second (Smaller) -->
                        <router-link to="/" class="logo-link">
                            <div class="logo-container">
                                <div class="logo-backdrop"></div>
                                <img :src="master.logo" alt="Main Logo" class="main-logo">
                                <div class="logo-shine"></div>
                                <div class="logo-glow"></div>
                            </div>
                        </router-link>
                    </div>

                    <!-- Desktop Navigation with Modern Effects -->
                    <div class="hidden md:flex items-center gap-6">
                        <!-- Enhanced Action Buttons -->
                        <div class="action-buttons">
                            <!-- Modern Wishlist Button -->
                            <button class="action-btn wishlist-btn" @click="showWishlist">
                                <div class="btn-background"></div>
                                <div class="btn-content">
                                    <div class="icon-wrapper">
                                        <svg class="icon-heart" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4.318 6.318a4.5 4.5 0 000 6.364L12 20.364l7.682-7.682a4.5 4.5 0 00-6.364-6.364L12 7.636l-1.318-1.318a4.5 4.5 0 00-6.364 0z" />
                                        </svg>
                                        <div class="icon-particle particle-1"></div>
                                        <div class="icon-particle particle-2"></div>
                                        <div class="icon-particle particle-3"></div>
                                    </div>
                                    <span v-if="AuthStore.favoriteProducts > 0" class="badge-float">
                                        <span class="badge-number">{{ AuthStore.favoriteProducts }}</span>
                                        <span class="badge-pulse"></span>
                                    </span>
                                </div>
                                <span class="btn-label">{{ $t('Wishlist') }}</span>
                                <div class="btn-hover-effect"></div>
                            </button>

                            <!-- Modern Cart Button -->
                            <button 
                                class="action-btn cart-btn" 
                                @click="showMyCart"
                                style="pointer-events: auto !important;"
                            >
                                <div class="btn-background"></div>
                                <div class="btn-content">
                                    <div class="icon-wrapper">
                                        <svg class="icon-cart" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 11V7a4 4 0 00-8 0v4M5 9h14l1 12H4L5 9z" />
                                        </svg>
                                        <div class="cart-bounce"></div>
                                    </div>
                                    <span v-if="basketStore.total > 0" class="badge-float">
                                        <span class="badge-number">{{ basketStore.total }}</span>
                                        <span class="badge-pulse"></span>
                                    </span>
                                </div>
                                <span class="btn-label">{{ $t('Cart') }}</span>
                                <div class="btn-hover-effect"></div>
                            </button>
                        </div>

                        <!-- Enhanced User Section -->
                        <div class="user-section">
                            <button v-if="!AuthStore.user" class="login-btn" @click="showLoginDialog">
                                <div class="login-btn-outer">
                                    <div class="login-btn-inner">
                                        <div class="login-gradient"></div>
                                        <span class="login-text">{{ $t('Login') }}</span>
                                        <div class="login-icon">
                                            <UserIcon class="w-5 h-5" />
                                        </div>
                                        <div class="login-sparkle sparkle-1"></div>
                                        <div class="login-sparkle sparkle-2"></div>
                                        <div class="login-sparkle sparkle-3"></div>
                                    </div>
                                </div>
                            </button>
                            <div v-else class="user-dropdown-wrapper">
                                <AuthUserDropdown />
                            </div>
                        </div>
                    </div>

                    <!-- Enhanced Mobile Menu Button -->
                    <div class="md:hidden flex items-center gap-3">
                        <button class="mobile-cart-btn" @click="showMyCart">
                            <div class="mobile-btn-inner">
                                <svg class="w-6 h-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 11V7a4 4 0 00-8 0v4M5 9h14l1 12H4L5 9z" />
                                </svg>
                                <span v-if="basketStore.total > 0" class="mobile-badge">
                                    {{ basketStore.total }}
                                </span>
                            </div>
                        </button>
                        
                        <button class="menu-btn" @click="mobileMenuOpen = true">
                            <div class="menu-icon">
                                <span class="menu-line line-1"></span>
                                <span class="menu-line line-2"></span>
                                <span class="menu-line line-3"></span>
                            </div>
                        </button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Enhanced Mobile Menu with Modern Animations -->
        <TransitionRoot as="template" :show="mobileMenuOpen">
            <Dialog as="div" class="relative z-10" @close="mobileMenuOpen = false">
                <TransitionChild as="template" enter="ease-in-out duration-500" enter-from="opacity-0"
                    enter-to="opacity-100" leave="ease-in-out duration-500" leave-from="opacity-100"
                    leave-to="opacity-0">
                    <div class="fixed inset-0 bg-gray-500 bg-opacity-30 transition-opacity" />
                </TransitionChild>

                <div class="fixed inset-0 overflow-hidden">
                    <div class="absolute inset-0 overflow-hidden">
                        <div class="pointer-events-none fixed inset-y-0 flex max-w-full"
                            :class="master.langDirection == 'rtl' ? 'left-0 sm:pr-10' : 'right-0 sm:pl-10'">
                            <TransitionChild as="template"
                                enter="transform transition ease-in-out duration-500 sm:duration-700"
                                :enter-from="master.langDirection == 'rtl' ? '-translate-x-full' : 'translate-x-full'"
                                enter-to="translate-x-0"
                                leave="transform transition ease-in-out duration-500 sm:duration-700"
                                leave-from="translate-x-0"
                                :leave-to="master.langDirection == 'rtl' ? '-translate-x-full' : 'translate-x-full'">
                                <DialogPanel class="pointer-events-auto relative w-screen max-w-md">
                                    <TransitionChild as="template" enter="ease-in-out duration-500"
                                        enter-from="opacity-0" enter-to="opacity-100"
                                        leave="ease-in-out duration-500" leave-from="opacity-100"
                                        leave-to="opacity-0">
                                        <div class="absolute left-0 top-0 -ml-8 flex pr-2 pt-4 sm:-ml-10 sm:pr-4">
                                        </div>
                                    </TransitionChild>
                                    <div class="flex h-full flex-col overflow-y-scroll bg-white shadow-xl p-4">

                                        <div class="flex justify-between items-center">
                                            <div class="text-slate-950 text-lg font-bold leading-normal tracking-tight">
                                                {{ $t('Menu') }}
                                            </div>
                                            <button
                                                class="w-7 h-7 flex justify-center items-center bg-slate-100 rounded-full"
                                                @click="mobileMenuOpen = false">
                                                <XMarkIcon class="w-5 h-5 text-slate-700" />
                                            </button>
                                        </div>

                                        <!-- login button -->
                                        <div v-if="!AuthStore.user" class="mt-5 p-2 bg-primary rounded-lg">
                                            <div class="px-3 py-2.5 bg-white rounded-md border border-slate-100 flex justify-between"
                                                @click="showLoginDialog">
                                                <div class="flex items-center gap-2">
                                                    <UserIcon class="w-5 h-5 text-slate-600" />
                                                    <div class="text-slate-600 text-sm font-normal leading-tight">
                                                        {{ $t('Login') }}
                                                    </div>
                                                </div>
                                                <ChevronRightIcon class="w-5 h-5 text-slate-600" />
                                            </div>
                                        </div>

                                        <div v-else class="bg-primary-100 p-3 rounded-lg mt-5">
                                            <AuthUserDropdown />
                                        </div>

                                        <div class="p-2 bg-slate-50 rounded-lg border border-slate-100 flex flex-col gap-1 mt-5">
                                            <div class="flex justify-between items-center px-3 py-2.5 bg-white rounded-md border border-slate-100 gap-2"
                                                @click="showWishlist">
                                                <div class="flex items-center gap-2">
                                                    <img :src="'/assets/icons/heart.svg'" class="w-5 h-5 text-slate-600" />
                                                    <div class="text-slate-600 text-sm font-normal leading-tight">
                                                        {{ $t('Wishlist') }}
                                                    </div>
                                                </div>
                                                <div class="w-5 h-5 bg-red-500 rounded-3xl border border-white flex justify-center items-center text-white">
                                                    <span class="text-white text-xs font-bold">
                                                        {{ AuthStore.favoriteProducts }}
                                                    </span>
                                                </div>
                                            </div>

                                            <div class="flex justify-between items-center px-3 py-2.5 bg-white rounded-md border border-slate-100 gap-2"
                                                @click="showMyCart">
                                                <div class="flex items-center gap-2">
                                                    <img :src="'/assets/icons/bag.svg'" class="w-6 h-6 text-slate-600" />
                                                    <div class="text-slate-600 text-sm font-normal leading-tight">
                                                        {{ $t('My Cart') }}
                                                    </div>
                                                </div>
                                                <div class="w-5 h-5 bg-red-500 rounded-3xl border border-white flex justify-center items-center text-white">
                                                    <span class="text-white text-xs font-bold">
                                                        {{ basketStore.total }}
                                                    </span>
                                                </div>
                                            </div>
                                        </div>

                                        <!-- <div class="justify-start inline-flex grow flex-col mt-5 gap-2">
                                            <div v-for="menu in master.menus" :key="menu.id" class="w-full text-base">
                                                <router-link v-if="!menu.is_external" :to="menu.url"
                                                    class="py-2 font-normal text-slate-600 border-b-2 border-slate-200 block">
                                                    {{ menu.name }}
                                                </router-link>
                                                <a v-else :href="menu.url" :target="menu.target"
                                                    class="py-2 border-b-2 border-slate-200 block font-normal text-slate-600">
                                                    {{ menu.name }}
                                                </a>
                                            </div>
                                        </div> -->
                                    </div>
                                </DialogPanel>
                            </TransitionChild>
                        </div>
                    </div>
                </div>
            </Dialog>
        </TransitionRoot>
    </div>

    <!-- Login Modal -->
    <LoginModal />
</template>

<script setup>
import { Dialog, DialogPanel, TransitionChild, TransitionRoot } from '@headlessui/vue'
import { Bars3Icon, ChevronRightIcon, UserIcon, XMarkIcon } from '@heroicons/vue/24/outline'
import { MagnifyingGlassIcon } from '@heroicons/vue/24/solid'
import { ref, watch, onMounted } from 'vue'
import { useRoute, useRouter } from 'vue-router'
import AuthUserDropdown from './AuthUserDropdown.vue'
import LoginModal from './LoginModal.vue'

import { useAuth } from '../stores/AuthStore'
import { useBasketStore } from '../stores/BasketStore'
import { useMaster } from '../stores/MasterStore'

const route = useRoute();
const router = useRouter();
const basketStore = useBasketStore();

const AuthStore = useAuth();
const master = useMaster();

const search = ref('');
const showSearch = ref(false);
const mobileMenuOpen = ref(false);

// Toggle search function
const toggleSearch = () => {
    showSearch.value = !showSearch.value
}

// Show cart modal function - FIXED VERSION
const showMyCart = () => {
    mobileMenuOpen.value = false; // Close mobile menu if open
    console.log('Opening cart modal...'); // Debug log
    master.basketCanvas = true;
    console.log('basketCanvas is now:', master.basketCanvas); // Debug log
}

// Show wishlist function
const showWishlist = () => {
    mobileMenuOpen.value = false;
    if (!AuthStore.token) {
        return showLoginDialog();
    }
    router.push('/wishlist')
}

// Show login dialog function
const showLoginDialog = () => {
    mobileMenuOpen.value = false;
    AuthStore.showLoginModal();
}

// Search products function
const searchProducts = () => {
    master.search = search.value
    if (route.path != '/products') {
        search.value = '';
    }
    router.push({ name: 'products' })
}

// Watch route changes
watch(() => route.path, () => {
    mobileMenuOpen.value = false;
    if (route.path == '/products') {
        search.value = master.search
    } else {
        search.value = ''
    }
});

// Initialize search value on component mount
onMounted(() => {
    if (route.path == '/products') {
        search.value = master.search
    } else {
        search.value = ''
    }
});
</script>

<style scoped>
/* Enhanced Navbar Styles with Modern Effects */
.navbar-wrapper {
    position: sticky;
    top: 0;
    z-index: 50;
    animation: slideDown 0.5s ease-out;
}

@keyframes slideDown {
    from { transform: translateY(-100%); }
    to { transform: translateY(0); }
}

.glass-navbar {
    background: rgba(255, 255, 255, 0.88);
    backdrop-filter: blur(24px) saturate(180%);
    border-bottom: 1px solid rgba(0, 0, 0, 0.04);
    box-shadow: 
        0 4px 30px rgba(0, 0, 0, 0.04),
        0 1px 3px rgba(0, 0, 0, 0.05),
        inset 0 1px 0 rgba(255, 255, 255, 0.5);
    transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
}

.glass-navbar:hover {
    background: rgba(255, 255, 255, 0.92);
    box-shadow: 
        0 8px 40px rgba(0, 0, 0, 0.06),
        0 2px 4px rgba(0, 0, 0, 0.04),
        inset 0 1px 0 rgba(255, 255, 255, 0.6);
}

/* Enhanced Logo Section */
.logo-section {
    display: flex;
    align-items: center;
    gap: 0.5rem;
}

@media (min-width: 768px) {
    .logo-section {
        gap: 0.75rem;
    }
}

.logo-container {
    position: relative;
    padding: 6px;
    border-radius: 12px;
    background: linear-gradient(145deg, rgba(255,255,255,0.9), rgba(255,255,255,0.3));
    box-shadow: 
        0 3px 12px rgba(var(--primary-rgb), 0.08),
        inset 0 1px 2px rgba(255,255,255,0.5);
    overflow: hidden;
    transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
}

@media (min-width: 768px) {
    .logo-container {
        padding: 8px;
        border-radius: 16px;
    }
}

.logo-backdrop {
    position: absolute;
    inset: 0;
    background: linear-gradient(135deg, 
        rgba(var(--primary-rgb), 0.05) 0%,
        transparent 50%,
        rgba(var(--primary-rgb), 0.05) 100%);
    opacity: 0;
    transition: opacity 0.3s ease;
}

.logo-container:hover .logo-backdrop {
    opacity: 1;
}

.main-logo {
    height: 32px;
    width: auto;
    position: relative;
    z-index: 3;
    transition: transform 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
    filter: drop-shadow(0 2px 4px rgba(0,0,0,0.1));
}

@media (min-width: 768px) {
    .main-logo {
        height: 36px;
    }
}

.logo-container:hover .main-logo {
    transform: scale(1.08) rotate(2deg);
}

.logo-shine {
    position: absolute;
    top: -100%;
    left: -100%;
    width: 300%;
    height: 300%;
    background: linear-gradient(
        105deg,
        transparent 40%,
        rgba(255,255,255,0.6) 50%,
        transparent 60%
    );
    animation: shine 3s infinite;
    pointer-events: none;
}

@keyframes shine {
    0% { transform: translate(-100%, -100%) rotate(45deg); }
    100% { transform: translate(100%, 100%) rotate(45deg); }
}

.logo-glow {
    position: absolute;
    inset: -20px;
    background: radial-gradient(
        circle at center,
        rgba(var(--primary-rgb), 0.2) 0%,
        transparent 70%
    );
    opacity: 0;
    transition: opacity 0.3s ease;
    filter: blur(20px);
    pointer-events: none;
}

.logo-container:hover .logo-glow {
    opacity: 1;
    animation: pulse 2s infinite;
}

/* Shop Logo Styles */
.shop-logo-wrapper {
    display: flex;
    align-items: center;
}

.divider-line {
    width: 1px;
    height: 28px;
    background: linear-gradient(
        to bottom,
        transparent,
        rgba(var(--primary-rgb), 0.2) 20%,
        rgba(var(--primary-rgb), 0.2) 80%,
        transparent
    );
    position: relative;
    margin: 0 0.4rem;
}

@media (min-width: 768px) {
    .divider-line {
        height: 32px;
        margin: 0 0.5rem;
    }
}

.divider-dot {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    width: 5px;
    height: 5px;
    background: rgba(var(--primary-rgb), 0.5);
    border-radius: 50%;
    animation: dividerPulse 2s infinite;
}

@keyframes dividerPulse {
    0%, 100% { opacity: 0.3; transform: translate(-50%, -50%) scale(1); }
    50% { opacity: 1; transform: translate(-50%, -50%) scale(1.5); }
}

.shop-logo-container {
    position: relative;
    padding: 3px;
    background: linear-gradient(135deg, 
        rgba(var(--primary-rgb), 0.15),
        rgba(var(--primary-rgb), 0.05),
        rgba(var(--primary-rgb), 0.15)
    );
    border-radius: 20px;
    transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
}

@media (min-width: 768px) {
    .shop-logo-container {
        padding: 6px;
        border-radius: 28px;
    }
}

.shop-logo-container::before {
    content: '';
    position: absolute;
    inset: -2px;
    border-radius: 24px;
    background: linear-gradient(45deg, 
        rgba(var(--primary-rgb), 0.4),
        rgba(139, 92, 246, 0.4),
        rgba(var(--primary-rgb), 0.4)
    );
    opacity: 0;
    transition: opacity 0.3s ease;
    z-index: -1;
    filter: blur(8px);
}

@media (min-width: 768px) {
    .shop-logo-container::before {
        inset: -3px;
        border-radius: 32px;
        filter: blur(10px);
    }
}

.shop-logo-container:hover::before {
    opacity: 1;
    animation: glowPulse 2s ease-in-out infinite;
}

@keyframes glowPulse {
    0%, 100% { opacity: 0.6; transform: scale(1); }
    50% { opacity: 1; transform: scale(1.05); }
}

.shop-logo-ring {
    position: absolute;
    inset: -5px;
    border-radius: 24px;
    background: conic-gradient(
        from 0deg,
        rgba(var(--primary-rgb), 0.4),
        rgba(139, 92, 246, 0.4),
        rgba(236, 72, 153, 0.4),
        rgba(var(--primary-rgb), 0.4)
    );
    animation: rotateGradient 4s linear infinite;
    z-index: 0;
    opacity: 0.8;
}

@media (min-width: 768px) {
    .shop-logo-ring {
        inset: -8px;
        border-radius: 32px;
    }
}

.shop-logo-container:hover .shop-logo-ring {
    animation: rotateGradient 2s linear infinite;
    opacity: 1;
}

@keyframes rotateGradient {
    0% { transform: rotate(0deg); }
    100% { transform: rotate(360deg); }
}

.shop-logo {
    width: 48px;
    height: 48px;
    border-radius: 18px;
    object-fit: cover;
    position: relative;
    z-index: 2;
    border: 3px solid white;
    box-shadow: 
        0 6px 20px rgba(0, 0, 0, 0.15),
        0 0 0 2px rgba(var(--primary-rgb), 0.2),
        inset 0 2px 4px rgba(255, 255, 255, 0.3),
        inset 0 -2px 4px rgba(0, 0, 0, 0.1);
    transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
    background: white;
}

@media (min-width: 768px) {
    .shop-logo {
        width: 72px;
        height: 72px;
        border-radius: 24px;
        border-width: 5px;
    }
}

.shop-logo-container:hover .shop-logo {
    transform: scale(1.2) rotate(-8deg) translateY(-2px);
    box-shadow: 
        0 12px 32px rgba(var(--primary-rgb), 0.3),
        0 0 0 3px rgba(var(--primary-rgb), 0.3),
        inset 0 2px 6px rgba(255, 255, 255, 0.4),
        inset 0 -2px 6px rgba(0, 0, 0, 0.15);
    border-color: rgba(255, 255, 255, 0.95);
}

.shop-logo-container::after {
    content: '';
    position: absolute;
    top: -8px;
    left: -8px;
    right: -8px;
    bottom: -8px;
    border-radius: 28px;
    background: radial-gradient(
        circle at center,
        rgba(var(--primary-rgb), 0.2) 0%,
        transparent 70%
    );
    opacity: 0;
    transition: opacity 0.3s ease;
    z-index: 1;
    pointer-events: none;
}

@media (min-width: 768px) {
    .shop-logo-container::after {
        top: -10px;
        left: -10px;
        right: -10px;
        bottom: -10px;
        border-radius: 36px;
    }
}

.shop-logo-container:hover::after {
    opacity: 1;
    animation: radialPulse 2s ease-in-out infinite;
}

@keyframes radialPulse {
    0%, 100% { transform: scale(1); opacity: 0.5; }
    50% { transform: scale(1.1); opacity: 0.8; }
}

.shop-badge {
    position: absolute;
    bottom: -4px;
    right: -4px;
    width: 20px;
    height: 20px;
    background: linear-gradient(135deg, #fbbf24 0%, #f59e0b 50%, #d97706 100%);
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    color: white;
    border: 2px solid white;
    z-index: 4;
    box-shadow: 
        0 4px 12px rgba(251, 191, 36, 0.4),
        0 0 0 2px rgba(var(--primary-rgb), 0.1),
        inset 0 1px 2px rgba(255, 255, 255, 0.3);
    animation: badgeBounce 2s infinite;
    transition: all 0.3s ease;
}

@media (min-width: 768px) {
    .shop-badge {
        bottom: -6px;
        right: -6px;
        width: 28px;
        height: 28px;
        border-width: 4px;
    }
}

.shop-badge svg {
    width: 10px;
    height: 10px;
}

@media (min-width: 768px) {
    .shop-badge svg {
        width: 16px;
        height: 16px;
    }
}

.shop-logo-container:hover .shop-badge {
    transform: scale(1.15) rotate(15deg);
    box-shadow: 
        0 6px 16px rgba(251, 191, 36, 0.5),
        0 0 0 3px rgba(var(--primary-rgb), 0.2),
        inset 0 1px 3px rgba(255, 255, 255, 0.4);
}

@keyframes badgeBounce {
    0%, 100% { transform: scale(1) rotate(0deg); }
    25% { transform: scale(1.1) rotate(-5deg); }
    50% { transform: scale(1.15) rotate(0deg); }
    75% { transform: scale(1.1) rotate(5deg); }
}

.pulse-ring {
    position: absolute;
    inset: -5px;
    border-radius: 24px;
    border: 2px solid rgba(var(--primary-rgb), 0.4);
    animation: pulse 2s infinite;
    pointer-events: none;
    z-index: 1;
}

@media (min-width: 768px) {
    .pulse-ring {
        inset: -8px;
        border-radius: 32px;
        border-width: 3px;
    }
}

.shop-logo-container:hover .pulse-ring {
    border-color: rgba(var(--primary-rgb), 0.6);
    animation: pulse 1.5s infinite;
}

@keyframes pulse {
    0% {
        transform: scale(1);
        opacity: 1;
    }
    100% {
        transform: scale(1.4);
        opacity: 0;
    }
}

/* Enhanced Action Buttons */
.action-buttons {
    display: flex;
    gap: 0.75rem;
}

.action-btn {
    position: relative;
    padding: 0.875rem 1.5rem;
    border-radius: 18px;
    background: white;
    border: 2px solid rgba(var(--primary-rgb), 0.1);
    transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
    display: flex;
    align-items: center;
    gap: 0.625rem;
    overflow: hidden;
    box-shadow: 
        0 2px 8px rgba(0, 0, 0, 0.04),
        inset 0 1px 2px rgba(255, 255, 255, 0.5);
    cursor: pointer;
    z-index: 10;
}

.btn-background {
    position: absolute;
    inset: 0;
    background: linear-gradient(135deg, 
        rgba(var(--primary-rgb), 0.03),
        rgba(var(--primary-rgb), 0.06)
    );
    opacity: 0;
    transition: opacity 0.3s ease;
    pointer-events: none;
}

.action-btn:hover .btn-background {
    opacity: 1;
}

.action-btn:hover {
    transform: translateY(-3px) scale(1.02);
    border-color: rgba(var(--primary-rgb), 0.2);
    box-shadow: 
        0 12px 24px rgba(var(--primary-rgb), 0.12),
        0 4px 8px rgba(var(--primary-rgb), 0.08),
        inset 0 1px 3px rgba(255, 255, 255, 0.8);
}

.btn-content {
    position: relative;
    z-index: 2;
    pointer-events: none;
}

.icon-wrapper {
    position: relative;
}

.icon-heart, .icon-cart {
    width: 24px;
    height: 24px;
    color: rgb(var(--primary-rgb));
    transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
}

.action-btn:hover .icon-heart {
    transform: scale(1.2) rotate(-10deg);
    color: #ef4444;
}

.action-btn:hover .icon-cart {
    animation: cartShake 0.5s ease;
}

@keyframes cartShake {
    0%, 100% { transform: rotate(0deg); }
    25% { transform: rotate(-5deg); }
    75% { transform: rotate(5deg); }
}

.icon-particle {
    position: absolute;
    width: 4px;
    height: 4px;
    background: #ef4444;
    border-radius: 50%;
    opacity: 0;
    pointer-events: none;
}

.action-btn:hover .particle-1 {
    animation: particleFloat1 1s ease-out;
}

.action-btn:hover .particle-2 {
    animation: particleFloat2 1s ease-out 0.1s;
}

.action-btn:hover .particle-3 {
    animation: particleFloat3 1s ease-out 0.2s;
}

@keyframes particleFloat1 {
    0% { transform: translate(0, 0) scale(0); opacity: 1; }
    100% { transform: translate(-20px, -20px) scale(1); opacity: 0; }
}

@keyframes particleFloat2 {
    0% { transform: translate(0, 0) scale(0); opacity: 1; }
    100% { transform: translate(20px, -20px) scale(1); opacity: 0; }
}

@keyframes particleFloat3 {
    0% { transform: translate(0, 0) scale(0); opacity: 1; }
    100% { transform: translate(0, -25px) scale(1); opacity: 0; }
}

.cart-bounce {
    position: absolute;
    inset: -8px;
    border: 2px solid rgba(var(--primary-rgb), 0.3);
    border-radius: 50%;
    opacity: 0;
    pointer-events: none;
}

.action-btn:hover .cart-bounce {
    animation: bounce 0.6s ease-out;
}

@keyframes bounce {
    0% { transform: scale(1); opacity: 1; }
    100% { transform: scale(1.5); opacity: 0; }
}

.badge-float {
    position: absolute;
    top: -10px;
    right: -10px;
    min-width: 22px;
    height: 22px;
    padding: 0 7px;
    background: linear-gradient(135deg, #ef4444, #dc2626);
    border-radius: 12px;
    display: flex;
    align-items: center;
    justify-content: center;
    box-shadow: 
        0 4px 12px rgba(239, 68, 68, 0.35),
        inset 0 1px 2px rgba(255, 255, 255, 0.3);
    animation: badgeAppear 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
}

.badge-number {
    color: white;
    font-size: 11px;
    font-weight: bold;
    position: relative;
    z-index: 2;
}

.badge-pulse {
    position: absolute;
    inset: 0;
    background: linear-gradient(135deg, #ef4444, #dc2626);
    border-radius: 12px;
    animation: badgePulse 2s infinite;
}

@keyframes badgePulse {
    0%, 100% { transform: scale(1); opacity: 1; }
    50% { transform: scale(1.15); opacity: 0.7; }
}

@keyframes badgeAppear {
    0% { transform: scale(0) rotate(-180deg); }
    50% { transform: scale(1.2) rotate(10deg); }
    100% { transform: scale(1) rotate(0deg); }
}

.btn-label {
    font-size: 14px;
    font-weight: 600;
    color: rgb(var(--primary-rgb));
    position: relative;
    z-index: 2;
    transition: all 0.3s ease;
    pointer-events: none;
}

.action-btn:hover .btn-label {
    transform: translateX(2px);
}

.btn-hover-effect {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    width: 100%;
    height: 100%;
    background: radial-gradient(
        circle at center,
        rgba(var(--primary-rgb), 0.1) 0%,
        transparent 70%
    );
    opacity: 0;
    transition: opacity 0.3s ease;
    pointer-events: none;
}

.action-btn:hover .btn-hover-effect {
    opacity: 1;
    animation: ripple 0.6s ease-out;
}

@keyframes ripple {
    0% { transform: translate(-50%, -50%) scale(0); }
    100% { transform: translate(-50%, -50%) scale(2); }
}

/* Enhanced Login Button */
.login-btn {
    position: relative;
    cursor: pointer;
}

.login-btn-outer {
    position: relative;
    padding: 2px;
    border-radius: 24px;
    background: linear-gradient(135deg, 
        rgb(var(--primary-rgb)), 
        rgba(var(--primary-rgb), 0.7)
    );
    transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
    box-shadow: 
        0 4px 15px rgba(var(--primary-rgb), 0.2),
        inset 0 1px 2px rgba(255, 255, 255, 0.2);
}

.login-btn:hover .login-btn-outer {
    transform: scale(1.05) rotate(-1deg);
    box-shadow: 
        0 8px 25px rgba(var(--primary-rgb), 0.3),
        inset 0 1px 3px rgba(255, 255, 255, 0.3);
}

.login-btn-inner {
    position: relative;
    display: flex;
    align-items: center;
    gap: 0.75rem;
    padding: 0.875rem 1.75rem;
    background: white;
    border-radius: 22px;
    overflow: hidden;
    transition: all 0.3s ease;
}

.login-gradient {
    position: absolute;
    inset: 0;
    background: linear-gradient(90deg, 
        transparent,
        rgba(var(--primary-rgb), 0.05),
        transparent
    );
    transform: translateX(-100%);
    transition: transform 0.6s ease;
}

.login-btn:hover .login-gradient {
    transform: translateX(100%);
}

.login-text {
    font-weight: 700;
    font-size: 15px;
    background: linear-gradient(135deg, 
        rgb(var(--primary-rgb)), 
        rgba(var(--primary-rgb), 0.8)
    );
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    background-clip: text;
    position: relative;
    z-index: 2;
}

.login-icon {
    display: flex;
    align-items: center;
    color: rgb(var(--primary-rgb));
    position: relative;
    z-index: 2;
    transition: transform 0.3s ease;
}

.login-btn:hover .login-icon {
    transform: rotate(10deg) scale(1.1);
}

.login-sparkle {
    position: absolute;
    width: 4px;
    height: 4px;
    background: rgba(var(--primary-rgb), 0.6);
    border-radius: 50%;
    opacity: 0;
}

.sparkle-1 {
    top: 20%;
    left: 10%;
    animation: sparkle 2s infinite;
}

.sparkle-2 {
    top: 70%;
    right: 15%;
    animation: sparkle 2s infinite 0.3s;
}

.sparkle-3 {
    bottom: 20%;
    left: 40%;
    animation: sparkle 2s infinite 0.6s;
}

@keyframes sparkle {
    0%, 100% { opacity: 0; transform: scale(0); }
    50% { opacity: 1; transform: scale(1); }
}

/* Enhanced Mobile Styles */
.mobile-cart-btn {
    position: relative;
    padding: 0.625rem;
    border-radius: 14px;
    background: white;
    border: 2px solid rgba(var(--primary-rgb), 0.1);
    color: rgb(var(--primary-rgb));
    transition: all 0.3s cubic-bezier(0.175, 0.885, 0.32, 1.275);
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.04);
    cursor: pointer;
}

.mobile-btn-inner {
    position: relative;
}

.mobile-cart-btn:hover {
    background: rgba(var(--primary-rgb), 0.05);
    transform: scale(1.05);
    box-shadow: 0 4px 12px rgba(var(--primary-rgb), 0.15);
}

.mobile-badge {
    position: absolute;
    top: -6px;
    right: -6px;
    min-width: 20px;
    height: 20px;
    padding: 0 5px;
    background: linear-gradient(135deg, #ef4444, #dc2626);
    color: white;
    border-radius: 10px;
    font-size: 11px;
    font-weight: bold;
    display: flex;
    align-items: center;
    justify-content: center;
    border: 2px solid white;
    box-shadow: 0 2px 8px rgba(239, 68, 68, 0.4);
    animation: badgeAppear 0.3s cubic-bezier(0.175, 0.885, 0.32, 1.275);
}

.menu-btn {
    padding: 0.625rem;
    border-radius: 14px;
    background: white;
    border: 2px solid rgba(0, 0, 0, 0.08);
    transition: all 0.3s cubic-bezier(0.175, 0.885, 0.32, 1.275);
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.04);
    cursor: pointer;
}

.menu-btn:hover {
    background: rgba(0, 0, 0, 0.03);
    transform: scale(1.05);
}

.menu-icon {
    width: 24px;
    height: 20px;
    position: relative;
    display: flex;
    flex-direction: column;
    justify-content: space-between;
}

.menu-line {
    display: block;
    height: 2.5px;
    background: #1f2937;
    border-radius: 2px;
    transition: all 0.3s cubic-bezier(0.175, 0.885, 0.32, 1.275);
    position: relative;
}

.menu-btn:hover .line-1 {
    transform: translateY(-2px) scaleX(0.8);
}

.menu-btn:hover .line-2 {
    transform: scaleX(1.1);
}

.menu-btn:hover .line-3 {
    transform: translateY(2px) scaleX(0.8);
}

/* CSS Variables */
:root {
    --primary-rgb: 59, 130, 246;
}

/* Responsive adjustments */
@media (max-width: 768px) {
    .action-btn {
        padding: 0.75rem 1.25rem;
        gap: 0.5rem;
    }
    
    .btn-label {
        font-size: 13px;
    }
}

/* Additional Mobile Menu Styles */
.mobile-menu-item {
    cursor: pointer;
    transition: all 0.3s ease;
}

.mobile-menu-item:hover {
    background: rgba(var(--primary-rgb), 0.05);
    transform: translateX(4px);
}

/* User Dropdown Wrapper */
.user-dropdown-wrapper {
    position: relative;
}

/* Ensure all interactive elements are clickable */
button, .mobile-menu-item, .logo-link {
    user-select: none;
}

/* Fix for iOS Safari button styling */
button {
    -webkit-appearance: none;
    appearance: none;
    outline: none;
    border: none;
}

/* Ensure proper stacking context */
.action-btn, .mobile-cart-btn, .menu-btn, .login-btn {
    position: relative;
    z-index: 1;
}

</style>