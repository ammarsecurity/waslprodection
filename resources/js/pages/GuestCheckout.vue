
<template>
    <div class="main-container">
        <!-- Breadcrumb -->
        <div class="flex items-center gap-2 overflow-hidden pt-4">
            <router-link to="/" class="w-6 h-6">
                <HomeIcon class="w-5 h-5 text-slate-600 hover:text-slate-800 transition-colors" />
            </router-link>
            <div class="grow w-full overflow-hidden">
                <div class="space-x-1 text-slate-600 text-sm font-normal truncate">
                    <span>{{ $t('Home') }}</span>
                    <span>/</span>
                    <span>{{ $t('Guest Checkout') }}</span>
                </div>
            </div>
        </div>

        <!-- Main Content -->
        <div class="grid grid-cols-1 xl:grid-cols-3 my-3 gap-8">
            <!-- Checkout Form -->
            <div class="col-span-1 xl:col-span-2 space-y-6">
                <!-- Contact Information -->
                <div class="p-6 bg-white rounded-2xl border border-slate-200 shadow-sm">
                    <div class="text-slate-950 text-xl font-medium leading-7 mb-4 flex items-center gap-2">
                        <svg class="w-5 h-5 text-blue-500" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z" />
                        </svg>
                        {{ $t('Contact Information') }}
                        <span class="text-red-500 text-sm">*</span>
                    </div>
                    <div class="grid grid-cols-1 sm:grid-cols-2 gap-4">
                        <div>
                            <label class="form-label">{{ $t('Full Name') }} <span class="text-red-500">*</span></label>
                            <input 
                                v-model="form.name" 
                                type="text" 
                                class="form-input" 
                                :class="{ 'border-red-300 focus:border-red-500': errors.name }"
                                :placeholder="$t('Enter your full name')"
                                @blur="validateField('name')"
                                @input="errors.name = ''"
                            />
                            <p v-if="errors.name" class="mt-1 text-sm text-red-600">{{ errors.name }}</p>
                        </div>
                        <div>
                            <label class="form-label">{{ $t('Phone') }} <span class="text-red-500">*</span></label>
                            <input 
                                v-model="form.phone" 
                                type="tel" 
                                class="form-input" 
                                :class="{ 'border-red-300 focus:border-red-500': errors.phone }"
                                :placeholder="$t('Enter your phone number (077xxxxxxxx)')"
                                @blur="validateField('phone')"
                                @input="errors.phone = ''"
                            />
                            <p v-if="errors.phone" class="mt-1 text-sm text-red-600">{{ errors.phone }}</p>
                        </div>
                    </div>
                </div>

                <!-- Shipping Address -->
                <div class="p-6 bg-white rounded-2xl border border-slate-200 shadow-sm">
                    <div class="text-slate-950 text-xl font-medium leading-7 mb-4 flex items-center gap-2">
                        <svg class="w-5 h-5 text-green-500" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z" />
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 11a3 3 0 11-6 0 3 3 0 016 0z" />
                        </svg>
                        {{ $t('Shipping Address') }}
                        <span class="text-red-500 text-sm">*</span>
                    </div>
                    <div class="grid grid-cols-1 md:grid-cols-3 gap-4">
                        <div v-for="shopId in form.shop_ids" :key="shopId">
                            <label class="form-label">
                                {{ $t('Governorate') }} ({{ $t('المحافظة') }}) <span class="text-red-500">*</span>
                                <span class="text-xs text-slate-500">{{ $t('Shop') }} #{{ shopId }}</span>
                            </label>
                            <select 
                                v-model="selectedProvinces[shopId]"
                                class="form-input"
                                :class="{ 'border-red-300 focus:border-red-500': errors.province && !selectedProvinces[shopId] }"
                                @change="onChangeProvinces(selectedProvinces[shopId])"
                            >
                                <option value="" disabled>{{ $t('Select province') }}</option>
                                <option v-for="province in shopProvinces[shopId]" :key="province.id" :value="province.id">
                                    {{ province.province_name }} - {{ showCurrency(province.delivery_charge) }}
                                </option>
                            </select>
                            <p v-if="errors.province && !selectedProvinces[shopId]" class="mt-1 text-sm text-red-600">{{ errors.province }}</p>
                        </div>
                        <div>
                            <label class="form-label">{{ $t('Province Area') }} <span class="text-red-500">*</span></label>
                            <input 
                                v-model="form.address.area" 
                                type="text" 
                                class="form-input" 
                                :class="{ 'border-red-300 focus:border-red-500': errors.area }"
                                :placeholder="$t('Enter area')" 
                                @blur="validateField('area')"
                                @input="errors.area = ''"
                            />
                            <p v-if="errors.area" class="mt-1 text-sm text-red-600">{{ errors.area }}</p>
                        </div>
                        <div>
                            <label class="form-label">{{ $t('Nearest Landmark') }} </label>
                            <input 
                                v-model="form.address.nearest_landmark" 
                                type="text" 
                                class="form-input" 
                                :placeholder="$t('The nearest landmark such as a mosque, school, hospital..')" 
                            />
                        </div>
                    </div>
                </div>

                <!-- Order Note -->
                <div class="p-6 bg-white rounded-2xl border border-slate-200 shadow-sm">
                    <div class="mb-4 flex items-center gap-2">
                        <svg class="w-5 h-5 text-amber-500" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z" />
                        </svg>
                        <span class="text-slate-950 text-xl font-medium leading-7">{{ $t('Note') }}</span>
                        <span class="text-slate-500 text-lg font-normal leading-7 tracking-tight"> ({{ $t('Optional') }}) </span>
                    </div>
                    <textarea 
                        v-model="form.note" 
                        rows="3" 
                        class="form-input resize-none" 
                        :placeholder="$t('Write your note here') + '...'"
                        maxlength="500"
                    ></textarea>
                    <p class="mt-1 text-xs text-slate-500">{{ form.note.length }}/500</p>
                </div>

                <!-- Payment Method -->
                <div class="p-6 bg-white rounded-2xl border border-slate-200 shadow-sm">
                    <div class="text-slate-950 text-xl font-medium leading-7 mb-4 flex items-center gap-2">
                        <svg class="w-5 h-5 text-purple-500" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 10h18M7 15h1m4 0h1m-7 4h12a3 3 0 003-3V8a3 3 0 00-3-3H6a3 3 0 00-3 3v8a3 3 0 003 3z" />
                        </svg>
                        {{ $t('Payment Method') }}
                        <span class="text-red-500 text-sm">*</span>
                    </div>
                    <div class="grid grid-cols-1 sm:grid-cols-2 gap-4">
                        <label 
                            v-if="master.cashOnDelivery" 
                            for="cash" 
                            class="flex items-center gap-4 p-4 border-2 rounded-xl cursor-pointer transition-all duration-200 hover:bg-slate-50"
                            :class="paymentType === 'cash' ? 'border-primary bg-primary/5' : 'border-slate-200'"
                        >
                            <input 
                                v-model="paymentType" 
                                id="cash" 
                                name="payment" 
                                type="radio" 
                                class="sr-only" 
                                value="cash" 
                                @change="errors.payment_method = ''"
                            />
                            <div class="p-2 bg-white rounded-xl border border-slate-200 shadow-sm">
                                <!-- <img src="assets/icons/money-2.svg" alt="" class="w-7 h-7"> -->
                            </div>
                            <span class="text-slate-700 text-base font-medium">{{ $t('Cash on delivery') }}</span>
                            <div v-if="paymentType === 'cash'" class="ml-auto">
                                <svg class="w-5 h-5 text-primary" fill="currentColor" viewBox="0 0 20 20">
                                    <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd" />
                                </svg>
                            </div>
                        </label>
                        <label 
                            v-if="master.onlinePayment" 
                            for="card" 
                            class="flex items-center gap-4 p-4 border-2 rounded-xl cursor-pointer transition-all duration-200 hover:bg-slate-50"
                            :class="paymentType === 'card' ? 'border-primary bg-primary/5' : 'border-slate-200'"
                        >
                            <input 
                                v-model="paymentType" 
                                id="card" 
                                name="payment" 
                                type="radio" 
                                class="sr-only" 
                                value="card" 
                                @change="errors.payment_method = ''"
                            />
                            <div class="p-2 bg-white rounded-xl border border-slate-200 shadow-sm">
                                <!-- <img src="assets/icons/card.svg" alt="" class="w-7 h-7"> -->
                            </div>
                            <span class="text-slate-700 text-base font-medium">{{ $t('Credit or Debit Card') }}</span>
                            <div v-if="paymentType === 'card'" class="ml-auto">
                                <svg class="w-5 h-5 text-primary" fill="currentColor" viewBox="0 0 20 20">
                                    <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd" />
                                </svg>
                            </div>
                        </label>
                    </div>
                    
                    <!-- عرض خطأ طريقة الدفع -->
                    <p v-if="errors.payment_method" class="mt-2 text-sm text-red-600">{{ errors.payment_method }}</p>
                    
                    <!-- Payment Gateways -->
                    <Transition 
                        enter-active-class="transition ease-out duration-300" 
                        enter-from-class="transform opacity-0 scale-95" 
                        enter-to-class="transform opacity-100 scale-100" 
                        leave-active-class="transition ease-in duration-200" 
                        leave-from-class="transform opacity-100 scale-100" 
                        leave-to-class="transform opacity-0 scale-95"
                    >
                        <div v-if="paymentType === 'card'" class="mt-6 pt-6 border-t border-slate-200">
                            <span class="text-slate-700 block text-lg font-medium mb-4">{{ $t('Available Payment Gateways') }}</span>
                            <div class="grid grid-cols-2 sm:grid-cols-3 gap-4">
                                <label 
                                    v-for="gateway in master.paymentGateways" 
                                    :key="gateway.id" 
                                    :for="gateway.name" 
                                    class="flex items-center justify-center p-4 border-2 rounded-xl cursor-pointer transition-all duration-200 hover:shadow-md"
                                    :class="paymentGateway === gateway.name ? 'border-primary shadow-lg bg-primary/5' : 'border-slate-200 hover:border-slate-300'"
                                >
                                    <input 
                                        v-model="paymentGateway" 
                                        :id="gateway.name" 
                                        name="paymentGateway" 
                                        type="radio" 
                                        class="sr-only" 
                                        :value="gateway.name"
                                        @change="errors.payment_gateway = ''"
                                    />
                                    <img :src="gateway.logo" alt="" class="w-24 h-12 object-contain">
                                </label>
                            </div>
                        </div>
                    </Transition>
                    
                    <!-- عرض خطأ بوابة الدفع -->
                    <p v-if="errors.payment_gateway" class="mt-2 text-sm text-red-600">{{ errors.payment_gateway }}</p>
                </div>

                <!-- Submit Button -->
                <div class="flex flex-col sm:flex-row gap-4 items-center">
                    <button 
                        @click="submitOrder" 
                        :disabled="isSubmitting" 
                        :class="{ 
                            'opacity-50 cursor-not-allowed': isSubmitting,
                            'hover:bg-primary-600 hover:shadow-lg transform hover:scale-105': !isSubmitting
                        }"
                        class="btn btn-primary w-full sm:w-auto flex items-center justify-center gap-3 transition-all duration-200 py-3 px-8 text-lg font-semibold"
                    >
                        <!-- Loading Spinner -->
                        <svg v-if="isSubmitting" class="animate-spin h-6 w-6 text-white" fill="none" viewBox="0 0 24 24">
                            <circle class="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" stroke-width="4"></circle>
                            <path class="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"></path>
                        </svg>
                        
                        <!-- Success Icon (when not loading) -->
                        <svg v-else class="w-6 h-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z" />
                        </svg>
                        
                        <!-- Button Text -->
                        <span>{{ isSubmitting ? $t('Processing Order...') : $t('Place Order') }}</span>
                    </button>
                    
                    <div v-if="hasValidationErrors" class="text-sm text-red-600 flex items-center gap-2">
                        <svg class="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-2.5L13.732 4c-.77-.833-1.664-.833-2.464 0L4.268 16.5c-.77.833.192 2.5 1.732 2.5z" />
                        </svg>
                        {{ $t('Please fill in all required fields') }}
                    </div>
                </div>
            </div>

            <!-- Order Summary -->
            <div class="sticky top-4">
                <div class="p-6 bg-white rounded-2xl border border-slate-200 shadow-sm">
                    <div class="text-slate-950 text-xl font-medium leading-7 mb-6 flex items-center gap-2">
                        <svg class="w-5 h-5 text-blue-500" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 11V7a4 4 0 00-8 0v4M8 11v6h8v-6H8z" />
                        </svg>
                        {{ $t('Order Summary') }}
                        <span class="ml-auto bg-blue-100 text-blue-800 text-xs font-medium px-2.5 py-0.5 rounded-full">
                            {{ displayProducts.length }} {{ $t('items') }}
                        </span>
                    </div>
                    
                    <!-- Empty Cart -->
                    <div v-if="displayProducts.length === 0" class="text-slate-500 text-center py-12">
                        <svg class="w-20 h-20 mx-auto mb-4 text-slate-300" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1" d="M16 11V7a4 4 0 00-8 0v4M8 11v6h8v-6H8z" />
                        </svg>
                        <p class="text-lg font-medium mb-2">{{ $t('No products in cart') }}</p>
                        <p class="text-sm">{{ $t('Add some products to get started') }}</p>
                    </div>
                    
                    <!-- Product List -->
                    <div v-else class="space-y-6">
                        <div v-for="(p, idx) in displayProducts" :key="`${p.id}-${p.shop_id}`" class="product-item bg-slate-50 rounded-xl p-4 border border-slate-200">
                            <!-- Product Header -->
                            <div class="flex items-start gap-4 mb-4">
                                <div class="flex-shrink-0">
                                    <img 
                                        v-if="p.thumbnail" 
                                        :src="p.thumbnail" 
                                        class="w-16 h-16 object-cover rounded-lg border border-slate-200" 
                                        :alt="p.name"
                                    />
                                    <div v-else class="w-16 h-16 bg-slate-200 rounded-lg border border-slate-300 flex items-center justify-center">
                                        <svg class="w-6 h-6 text-slate-400" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 16l4.586-4.586a2 2 0 012.828 0L16 16m-2-2l1.586-1.586a2 2 0 012.828 0L20 14m-6-6h.01M6 20h12a2 2 0 002-2V6a2 2 0 00-2-2H6a2 2 0 00-2 2v12a2 2 0 002 2z" />
                                        </svg>
                                    </div>
                                </div>
                                <div class="flex-grow min-w-0">
                                    <h3 class="font-semibold text-slate-900 text-base mb-1 line-clamp-2">{{ p.name }}</h3>
                                    <div v-if="p.shop_name" class="flex items-center gap-2 mb-2">
                                        <img v-if="p.shop_thumbnail" :src="p.shop_thumbnail" class="w-4 h-4 rounded-full" />
                                        <span class="text-sm text-slate-600">{{ p.shop_name }}</span>
                                        <div v-if="p.shop_rating" class="flex items-center gap-1">
                                            <svg class="w-3 h-3 text-yellow-400 fill-current" viewBox="0 0 20 20">
                                                <path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.802 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.802-2.034a1 1 0 00-1.175 0l-2.802 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81H7.03a1 1 0 00.95-.69l1.07-3.292z"/>
                                            </svg>
                                            <span class="text-xs text-slate-500">{{ Number(p.shop_rating).toFixed(1) }}</span>
                                        </div>
                                    </div>
                                </div>
                                <button @click="removeAt(idx)" class="text-red-500 hover:text-red-700 transition-colors">
                                    <svg class="w-5 h-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16" />
                                    </svg>
                                </button>
                            </div>

                            <!-- Product Variants -->
                            <div v-if="p.color_name || p.size_name" class="flex gap-2 mb-3">
                                <span v-if="p.size_name" class="inline-flex items-center gap-1 px-2 py-1 bg-blue-100 text-blue-800 text-xs font-medium rounded-md">
                                    <svg class="w-3 h-3" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 8V4m0 0h4M4 4l5 5m11-1V4m0 0h-4m4 0l-5 5M4 16v4m0 0h4m-4 0l5-5m11 5l-5-5m5 5v-4m0 4h-4" />
                                    </svg>
                                    {{ p.size_name }}
                                </span>
                                <span v-if="p.color_name" class="inline-flex items-center gap-1 px-2 py-1 bg-purple-100 text-purple-800 text-xs font-medium rounded-md">
                                    <div class="w-3 h-3 rounded-full border border-gray-300" :style="`background-color: ${p.color_name}`"></div>
                                    {{ p.color_name }}
                                </span>
                            </div>

                            <!-- Quantity and Price Controls -->
                            <div class="flex items-center justify-between">
                                <div class="flex items-center gap-3">
                                    <span class="text-sm text-slate-600">{{ $t('Quantity') }}:</span>
                                    <div class="flex items-center gap-2">
                                        <button 
                                            @click="decreaseQuantity(idx)" 
                                            class="w-8 h-8 rounded-full border border-slate-300 flex items-center justify-center hover:bg-slate-100 transition-colors" 
                                            :disabled="getQuantity(idx) <= 1"
                                            :class="{ 'opacity-50 cursor-not-allowed': getQuantity(idx) <= 1 }"
                                        >
                                            <svg class="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2.5" d="M18 12H6" />
                                            </svg>
                                        </button>
                                        
                                        <span class="min-w-[3rem] text-center font-medium">{{ getQuantity(idx) }}</span>
                                        
                                        <button 
                                            @click="increaseQuantity(idx)" 
                                            class="w-8 h-8 rounded-full border border-slate-300 flex items-center justify-center hover:bg-slate-100 transition-colors"
                                        >
                                            <svg class="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2.5" d="M12 6v12m6-6H6" />
                                            </svg>
                                        </button>
                                    </div>
                                </div>
                                
                                <div class="text-right">
                                    <div class="text-sm text-slate-500">{{ showCurrency(p.unit_price) }} × {{ getQuantity(idx) }}</div>
                                    <div class="text-lg font-bold text-slate-900">{{ showCurrency(itemTotal(p, getQuantity(idx))) }}</div>
                                </div>
                            </div>
                        </div>

                        <!-- Order Totals -->
                        <div class="border-t border-slate-200 pt-6 space-y-4">
                            <div class="flex items-center justify-between text-base">
                                <span class="text-slate-700">{{ $t('Subtotal') }}</span>
                                <span class="font-semibold text-slate-900">{{ showCurrency(invoiceSubtotal) }}</span>
                            </div>
                            
                            <div class="flex items-center justify-between text-base">
                                <div class="flex items-center gap-2">
                                    <svg class="w-4 h-4 text-blue-500" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M20 13V6a2 2 0 00-2-2H6a2 2 0 00-2 2v7m16 0v5a2 2 0 01-2 2H6a2 2 0 01-2-2v-5m16 0h-2.586a1 1 0 00-.707.293l-2.414 2.414a1 1 0 01-.707.293h-3.172a1 1 0 01-.707-.293l-2.414-2.414A1 1 0 006.586 13H4"/>
                                    </svg>
                                    <span class="text-slate-700">{{ $t('Delivery Charge') }}</span>
                                    <div class="relative group">
                                        <svg class="w-3 h-3 text-slate-400 cursor-help" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8.228 9c.549-1.165 2.03-2 3.772-2 2.21 0 4 1.343 4 3 0 1.4-1.278 2.575-3.006 2.907-.542.104-.994.54-.994 1.093m0 3h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"/>
                                        </svg>
                                        <div class="absolute bottom-full left-1/2 transform -translate-x-1/2 mb-2 px-3 py-2 bg-gray-900 text-white text-xs rounded-lg opacity-0 group-hover:opacity-100 transition-opacity duration-200 whitespace-nowrap z-10">
                                            {{ deliveryCharge > 0 ? $t('Calculated per shop') + ' (' + form.shop_ids.length + ' ' + $t('shops') + ')' : $t('Free delivery') }}
                                            <div class="absolute top-full left-1/2 transform -translate-x-1/2 w-0 h-0 border-l-4 border-r-4 border-t-4 border-transparent border-t-gray-900"></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="flex items-center gap-1">
                                    <span v-if="deliveryCharge > 0" class="font-semibold text-blue-600">{{ showCurrency(deliveryCharge) }}</span>
                                    <span v-else class="font-semibold text-green-600 flex items-center gap-1">
                                        <svg class="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"/>
                                        </svg>
                                        0
                                    </span>
                                </div>
                            </div>
                            
                            <div class="border-t border-slate-200 pt-4">
                                <div class="flex items-center justify-between bg-gradient-to-r from-primary/10 to-primary/5 rounded-xl p-4">
                                    <div class="text-slate-900 text-lg font-bold">{{ $t('Total') }}</div>
                                    <div class="text-primary text-2xl font-bold">{{ showCurrency(invoiceTotal) }}</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script setup>
import { HomeIcon } from '@heroicons/vue/24/outline';
import { reactive, ref, watch, onMounted, computed } from 'vue';
import { useMaster } from '../stores/MasterStore';
import { useToast } from 'vue-toastification';
import { useRouter } from 'vue-router';
import axios from 'axios';
import { useBasketStore } from '../stores/BasketStore';

// Stores and utilities
const master = useMaster();
const basketStore = useBasketStore();
const toast = useToast();
const router = useRouter();

// Form data
const form = reactive({
    name: '',
    phone: '',
    shop_ids: [],
    products: [{ product_id: null, shop_id: null, quantity: 1 }],
    address: { 
        name: '', 
        phone: '', 
        address_line: '', 
        area: '', 
        road_no: '', 
        house_no: '', 
        address_line2: '',
        nearest_landmark: ''
    },
    note: '',
    payment_method: master.cashOnDelivery ? 'cash' : 'card',
    coupon_code: '',
});

// Form state
const shopProvinces = ref({}); // {shopId: [provinces]}
const selectedProvinces = ref({}); // {shopId: provinceId}
const paymentType = ref(form.payment_method === 'cash' ? 'cash' : 'card');
const paymentGateway = ref(null);
const isSubmitting = ref(false);
const deliveryCharge = ref(0);

// Form validation - تحديث reactive errors object
const errors = reactive({
    name: '',
    phone: '',
    province: '',
    area: '',
    payment_method: '',
    payment_gateway: '',
    general: ''
});

// Computed property for validation check
const hasValidationErrors = computed(() => {
    return Object.values(errors).some(error => error !== '');
});

// تحديث دالة validateField لتكون أكثر دقة
const validateField = (fieldName) => {
    switch (fieldName) {
        case 'name':
            errors.name = !form.name?.trim() ? 'الاسم مطلوب' : '';
            break;
        case 'phone':
            if (!form.phone?.trim()) {
                errors.phone = 'رقم الهاتف مطلوب';
            } else {
                // Remove any spaces, dashes, or other characters to get clean number
                const cleanPhone = form.phone.trim().replace(/[\s\-\(\)]/g, '');
                
                // Check if it's exactly 11 digits and starts with 077, 078, 074, or 075
                if (!/^(077|078|074|075)\d{8}$/.test(cleanPhone)) {
                    errors.phone = 'رقم الهاتف يجب أن يكون 11 رقم ويبدأ بـ 077 أو 078 أو 074 أو 075';
                } else {
                    errors.phone = '';
                }
            }
            break;
        case 'province':
            errors.province = '';
            for (const shopId of form.shop_ids) {
                if (!selectedProvinces.value[shopId]) {
                    errors.province = 'يرجى اختيار المحافظة لجميع المتاجر';
                    break;
                }
            }
            break;
        case 'area':
            errors.area = !form.address.area?.trim() ? 'المنطقة مطلوبة' : '';
            break;
    }
};

// إضافة دالة للتحقق من جميع الحقول
const validateAllFields = () => {
    validateField('name');
    validateField('phone');
    validateField('province');
    validateField('area');
    
    // التحقق من طريقة الدفع
    if (!form.payment_method) {
        errors.payment_method = 'يرجى اختيار طريقة الدفع';
    } else {
        errors.payment_method = '';
    }
    
    // التحقق من بوابة الدفع إذا تم اختيار الدفع بالبطاقة
    if (paymentType.value === 'card' && !paymentGateway.value) {
        errors.payment_gateway = 'يرجى اختيار بوابة الدفع';
    } else {
        errors.payment_gateway = '';
    }
};

// دالة للتمرير إلى أول حقل به خطأ
function scrollToFirstError() {
    const errorFields = ['name', 'phone', 'province', 'area'];
    
    for (const field of errorFields) {
        if (errors[field]) {
            const element = document.querySelector(`[class*="border-red-300"]`) || 
                           document.querySelector(`input[v-model*="${field}"]`) ||
                           document.querySelector(`select[v-model*="selectedProvinces"]`);
            
            if (element) {
                element.scrollIntoView({ behavior: 'smooth', block: 'center' });
                element.focus();
                break;
            }
        }
    }
}

// Watchers for payment methods
watch(paymentType, () => {
    form.payment_method = paymentType.value === 'card' ? paymentGateway.value : paymentType.value;
});

watch(paymentGateway, () => {
    if (paymentType.value === 'card') form.payment_method = paymentGateway.value;
});

// Main submit function - مع إصلاح شامل للـ validation
async function submitOrder() {
    // مسح جميع الأخطاء السابقة
    Object.keys(errors).forEach(key => {
        errors[key] = '';
    });

    // التحقق من صحة جميع الحقول المطلوبة
    let hasErrors = false;

    // التحقق من الاسم
    if (!form.name || form.name.trim() === '') {
        errors.name = 'الاسم مطلوب';
        hasErrors = true;
    }

    // التحقق من رقم الهاتف
    if (!form.phone || form.phone.trim() === '') {
        errors.phone = 'رقم الهاتف مطلوب';
        hasErrors = true;
    } else {
        // Remove any spaces, dashes, or other characters to get clean number
        const cleanPhone = form.phone.trim().replace(/[\s\-\(\)]/g, '');
        
        // Check if it's exactly 11 digits and starts with 077, 078, 074, or 075
        if (!/^(077|078|074|075)\d{8}$/.test(cleanPhone)) {
            errors.phone = 'رقم الهاتف يجب أن يكون 11 رقم ويبدأ بـ 077 أو 078 أو 074 أو 075';
            hasErrors = true;
        }
    }

    // التحقق من اختيار المحافظة لكل متجر
    for (const shopId of form.shop_ids) {
        if (!selectedProvinces.value[shopId]) {
            errors.province = 'يرجى اختيار المحافظة لجميع المتاجر';
            hasErrors = true;
            break;
        }
    }

    // التحقق من المنطقة
    if (!form.address.area || form.address.area.trim() === '') {
        errors.area = 'المنطقة مطلوبة';
        hasErrors = true;
    }

    // التحقق من وجود منتجات في السلة
    if (!form.products || form.products.length === 0) {
        toast.error('يرجى إضافة منتجات إلى السلة أولاً', {
            position: getToastPosition(),
            timeout: 5000,
        });
        return;
    }

    // التحقق من طريقة الدفع
    if (!form.payment_method) {
        toast.error('يرجى اختيار طريقة الدفع', {
            position: getToastPosition(),
            timeout: 5000,
        });
        return;
    }

    // إذا تم اختيار الدفع بالبطاقة، تأكد من اختيار بوابة الدفع
    if (paymentType.value === 'card' && !paymentGateway.value) {
        toast.error('يرجى اختيار بوابة الدفع', {
            position: getToastPosition(),
            timeout: 5000,
        });
        return;
    }

    // إذا كانت هناك أخطاء، أظهر رسالة خطأ عامة وتوقف
    if (hasErrors) {
        toast.error('يرجى تصحيح الأخطاء المذكورة أعلاه', {
            position: getToastPosition(),
            timeout: 5000,
        });
        
        // التمرير إلى أول حقل به خطأ
        scrollToFirstError();
        return;
    }

    isSubmitting.value = true;
    
    try {
        toast.info('جاري معالجة الطلب...', {
            position: getToastPosition(),
            timeout: 2000,
        });
        
        // Collect unique shop ids from products
        form.shop_ids = [...new Set(form.products.map(p => p.shop_id).filter(Boolean))];
        
        // Calculate delivery charge before submitting
        await calculateDeliveryCharge();
        
        // Ensure address contact mirrors main contact info
        form.address.name = form.name;
        form.address.phone = form.phone;
        form.address.address_line2 = form.address.area;
        
        // إضافة معلومات المحافظة المختارة
        if (form.shop_ids.length > 0) {
            const primaryShopId = form.shop_ids[0];
            const selectedProvinceId = selectedProvinces.value[primaryShopId];
            if (selectedProvinceId) {
                const province = shopProvinces.value[primaryShopId]?.find(p => p.id == selectedProvinceId);
                if (province) {
                    form.address.address_line = province.province_name;
                }
            }
        }

        // Add financial details to form
        const formData = {
            ...form,
            subtotal: invoiceSubtotal.value,
            delivery_charge: deliveryCharge.value,
            total: invoiceTotal.value,
            provinces: Object.fromEntries(
                Object.entries(selectedProvinces.value).map(([shopId, provinceId]) => [
                    shopId, 
                    shopProvinces.value[shopId]?.find(p => p.id == provinceId)
                ])
            )
        };
        
        const { data } = await axios.post('/guest/place-order', formData);
        
        // Clear basket after successful order
        basketStore.products = [];
        
        toast.success(data.message || 'تم إرسال الطلب بنجاح!', {
            position: getToastPosition(),
            timeout: 5000,
        });
        
        if (data?.data?.order_payment_url) {
            toast.info('جاري التوجه لصفحة الدفع...', {
                position: getToastPosition(),
                timeout: 3000,
            });
            setTimeout(() => {
                window.location.href = data.data.order_payment_url;
            }, 1500);
        } else {
            // Navigate to primary shop or home
            const primaryShopId = form.shop_ids[0];
            if (primaryShopId) {
                toast.success('سيتم توجيهك إلى المتجر...', {
                    position: getToastPosition(),
                    timeout: 2000,
                });
                setTimeout(() => {
                    router.push(`/shops/${primaryShopId}`);
                }, 2000);
            } else {
                setTimeout(() => {
                    router.push('/');
                }, 2000);
            }
        }
        
    } catch (error) {
        console.error('Order submission error:', error);
        
        let errorMessage = 'فشل في إرسال الطلب';
        
        // معالجة أخطاء التحقق من الخادم
        if (error.response?.status === 422 && error.response?.data?.errors) {
            const serverErrors = error.response.data.errors;
            
            // عرض أخطاء الخادم في الحقول المناسبة
            if (serverErrors.name) {
                errors.name = serverErrors.name[0];
            }
            if (serverErrors.phone) {
                errors.phone = serverErrors.phone[0];
            }
            if (serverErrors['address.area']) {
                errors.area = serverErrors['address.area'][0];
            }
            if (serverErrors.provinces) {
                errors.province = serverErrors.provinces[0];
            }
            
            errorMessage = 'يرجى تصحيح الأخطاء المذكورة';
            scrollToFirstError();
        } else if (error.response?.data?.message) {
            errorMessage = error.response.data.message;
        } else if (error.response?.status === 500) {
            errorMessage = 'خطأ في الخادم، يرجى المحاولة لاحقاً';
        } else if (!navigator.onLine) {
            errorMessage = 'تحقق من اتصال الإنترنت';
        }
        
        toast.error(errorMessage, {
            position: getToastPosition(),
            timeout: 6000,
        });
    } finally {
        isSubmitting.value = false;
    }
}

// تحديث دالة onChangeProvinces
const onChangeProvinces = (provinceId) => {
    // مسح خطأ المحافظة عند الاختيار
    if (provinceId) {
        errors.province = '';
    }
    
    // Update the form with the selected province
    const provinceObj = (shopProvinces.value[form.shop_ids[0]] || []).find(p => p.id == provinceId);
    form.address.address_line = provinceObj ? provinceObj.province_name : '';
    
    // إعادة حساب رسوم التوصيل
    calculateDeliveryCharge();
};

// Initialize data on mount
onMounted(async () => {
    if (basketStore.products.length > 0) {
        const flattened = [];
        for (const group of basketStore.products) {
            // جلب المحافظات لكل متجر
            const provinces = await fetchProvinces(group.shop_id);
            shopProvinces.value[group.shop_id] = provinces;
            group.products.forEach(prod => {
                flattened.push({
                    product_id: prod.id,
                    shop_id: group.shop_id,
                    quantity: prod.quantity || 1,
                });
            });
        }
        form.products = flattened;
        form.shop_ids = [...new Set(flattened.map(p => p.shop_id))];
        await calculateDeliveryCharge();
    }
});

// Fetch provinces function
async function fetchProvinces(shopId) {
    try {
        const { data } = await axios.get(`shop/${shopId}/provinces-delivery-charges`);
        return data.data || [];
    } catch (error) {
        console.error('Error fetching provinces:', error);
        return [];
    }
}

// Display products computed property
const displayProducts = computed(() => {
    const items = [];
    basketStore.products.forEach(group => {
        group.products.forEach(prod => {
            items.push({
                id: prod.id,
                name: prod.name,
                thumbnail: prod.thumbnail,
                shop_id: group.shop_id,
                shop_name: group.shop_name,
                shop_thumbnail: group.shop_thumbnail,
                shop_rating: group.shop_rating,
                size_name: prod.size_name,
                color_name: prod.color_name,
                unit_price: prod.unit_price,
                quantity: prod.quantity || 1,
            });
        });
    });
    return items;
});

// Product management functions
function removeAt(idx) {
    const item = displayProducts.value[idx];
    if (!item) return;
    
    // Update form list
    if (form.products[idx]) {
        form.products.splice(idx, 1);
    }
    
    // Update basket store
    const group = basketStore.products.find(g => g.shop_id === item.shop_id);
    if (group) {
        group.products = group.products.filter(p => p.id !== item.id);
        if (group.products.length === 0) {
            basketStore.products = basketStore.products.filter(g => g.shop_id !== item.shop_id);
        }
    }
    
    // Update form.shop_ids and recalculate delivery charge
    form.shop_ids = [...new Set(form.products.map(p => p.shop_id).filter(Boolean))];
    calculateDeliveryCharge();
}

// Price calculation functions
function basePriceOf(p) {
    return p.unit_price ?? 0;
}

function itemTotal(p, qty) {
    const price = basePriceOf(p) || 0;
    const q = Number(qty || p.quantity || 1);
    return +(price * q).toFixed(2);
}

// Invoice calculations
const invoiceSubtotal = computed(() => {
    return displayProducts.value.reduce((sum, p, idx) => {
        const formProduct = form.products[idx];
        const qty = formProduct?.quantity || p.quantity || 1;
        return sum + itemTotal(p, qty);
    }, 0);
});

const invoiceTotal = computed(() => {
    return invoiceSubtotal.value + deliveryCharge.value;
});

// Delivery charge calculation
const calculateDeliveryCharge = async () => {
    let total = 0;
    for (const shopId of form.shop_ids) {
        const provinces = shopProvinces.value[shopId] || [];
        const selectedId = selectedProvinces.value[shopId];
        const selected = provinces.find(p => p.id == selectedId);
        total += selected ? Number(selected.delivery_charge) : 0;
    }
    deliveryCharge.value = total;
};

// Watch for changes in shop_ids to recalculate delivery charge
watch(() => form.shop_ids, async (newShopIds) => {
    if (newShopIds.length > 0) {
        for (const shopId of newShopIds) {
            shopProvinces.value[shopId] = await fetchProvinces(shopId);
        }
        // إعادة تعيين المحافظات المختارة
        for (const shopId of newShopIds) {
            if (!selectedProvinces.value[shopId]) {
                selectedProvinces.value[shopId] = '';
            }
        }
        deliveryCharge.value = 0;
    } else {
        shopProvinces.value = {};
        selectedProvinces.value = {};
        deliveryCharge.value = 0;
    }
}, { deep: true });

// Watch for province selection to update delivery charge
watch(selectedProvinces, calculateDeliveryCharge, { deep: true });

// Quantity management functions
function getQuantity(idx) {
    return form.products[idx]?.quantity || displayProducts.value[idx]?.quantity || 1;
}

function setQuantity(idx, value) {
    const numValue = Number(value) || 1;
    if (!form.products[idx]) {
        const displayProduct = displayProducts.value[idx];
        form.products[idx] = {
            product_id: displayProduct.id,
            shop_id: displayProduct.shop_id,
            quantity: numValue
        };
    } else {
        form.products[idx].quantity = numValue;
    }
    
    // Also update in basket store for consistency
    const item = displayProducts.value[idx];
    const group = basketStore.products.find(g => g.shop_id === item.shop_id);
    if (group) {
        const product = group.products.find(p => p.id === item.id);
        if (product) {
            product.quantity = numValue;
        }
    }
}

function increaseQuantity(idx) {
    const currentQty = getQuantity(idx);
    setQuantity(idx, currentQty + 1);
}

function decreaseQuantity(idx) {
    const currentQty = getQuantity(idx);
    if (currentQty > 1) {
        setQuantity(idx, currentQty - 1);
    }
}

function validateQuantity(idx) {
    const currentQty = getQuantity(idx);
    if (currentQty < 1 || isNaN(currentQty)) {
        setQuantity(idx, 1);
    } else if (currentQty > 99) {
        setQuantity(idx, 99);
    }
}

// Utility functions
function showCurrency(amount) {
    try { 
        return master.showCurrency ? master.showCurrency(amount) : amount; 
    } catch { 
        return amount; 
    }
}

function getToastPosition() {
    return master.langDirection === 'rtl' ? "top-right" : "top-left";
}
</script>
<style scoped>
/* Form Styles */
.form-label {
    color: #475569;
    font-size: 1rem;
    font-weight: normal;
    line-height: 1.5;
}

.form-input {
    padding: 0.75rem;
    border-radius: 0.5rem;
    border: 1px solid #e2e8f0;
    width: 100%;
    outline: none;
    font-size: 1rem;
    font-weight: normal;
    line-height: 1.5;
    transition: border-color 0.2s ease;
}

.form-input:focus {
    border-color: var(--primary, #3b82f6);
}

.form-input::placeholder {
    color: #94a3b8;
}

.radioBtn2 {
    width: 1rem;
    height: 1rem;
    border: 1px solid #cbd5e1;
    appearance: none;
    border-radius: 50%;
    margin: 0;
    transition: all 0.1s ease-in-out;
}

.radioBtn2:checked {
    background-color: var(--primary, #3b82f6);
    border-color: var(--primary, #3b82f6);
    outline: 1px solid var(--primary, #3b82f6);
    outline-offset: 1px;
}

.btn {
    padding: 0.5rem 1rem;
    border-radius: 0.5rem;
    border: 1px solid #e2e8f0;
    cursor: pointer;
    transition: all 0.2s ease;
}

.btn-primary {
    background-color: var(--primary, #3b82f6);
    color: white;
    border-color: var(--primary, #3b82f6);
}

.btn-outline {
    background-color: white;
}

/* Product Item Styles */
.product-item {
    background: white;
    border: 1px solid #e2e8f0;
    border-radius: 0.75rem;
    padding: 1rem;
    margin-bottom: 1rem;
    transition: all 0.2s ease;
}

.product-item:hover {
    box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1);
}

.product-header {
    display: flex;
    gap: 0.75rem;
    align-items: flex-start;
    margin-bottom: 1rem;
}

.product-image-wrapper {
    flex-shrink: 0;
}

.product-image {
    width: 4rem;
    height: 4rem;
    object-fit: cover;
    border-radius: 0.5rem;
    border: 1px solid #e2e8f0;
}

@media (min-width: 640px) {
    .product-image {
        width: 5rem;
        height: 5rem;
    }
}

.product-image-placeholder {
    width: 4rem;
    height: 4rem;
    background-color: #f1f5f9;
    border-radius: 0.5rem;
    border: 1px solid #e2e8f0;
    display: flex;
    align-items: center;
    justify-content: center;
}

@media (min-width: 640px) {
    .product-image-placeholder {
        width: 5rem;
        height: 5rem;
    }
}

.product-info {
    flex: 1;
    min-width: 0;
}

.product-name {
    color: #1e293b;
    font-weight: 600;
    font-size: 1rem;
    line-height: 1.25;
    margin-bottom: 0.5rem;
    display: -webkit-box;
    -webkit-line-clamp: 2;
    line-clamp: 2;
    -webkit-box-orient: vertical;
    overflow: hidden;
}

.shop-info {
    margin-top: 0.5rem;
}

.shop-details {
    display: flex;
    align-items: center;
    gap: 0.5rem;
}

.shop-avatar {
    width: 1.5rem;
    height: 1.5rem;
    border-radius: 50%;
    object-fit: cover;
    border: 1px solid #e2e8f0;
    flex-shrink: 0;
}

.shop-text {
    display: flex;
    flex-direction: column;
    min-width: 0;
}

.shop-name {
    color: #475569;
    font-size: 0.875rem;
    font-weight: 500;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
}

.shop-rating {
    display: flex;
    align-items: center;
    gap: 0.25rem;
    margin-top: 0.125rem;
}

.rating-star {
    width: 1rem;
    height: 1rem;
    color: #f59e0b;
    flex-shrink: 0;
}

.rating-value {
    color: #d97706;
    font-size: 0.75rem;
    font-weight: 500;
}

.product-details {
    margin-bottom: 1rem;
}

.product-variants {
    display: flex;
    flex-wrap: wrap;
    gap: 0.5rem;
    margin-bottom: 0.75rem;
}

.variant-badge {
    display: inline-flex;
    align-items: center;
    gap: 0.25rem;
    padding: 0.25rem 0.5rem;
    border-radius: 0.375rem;
    font-size: 0.75rem;
    font-weight: 500;
    border: 1px solid;
}

.size-badge {
    background-color: #eff6ff;
    color: #1d4ed8;
    border-color: #bfdbfe;
}

.color-badge {
    background-color: #faf5ff;
    color: #7c3aed;
    border-color: #d8b4fe;
}

.price-info {
    display: flex;
    align-items: center;
    justify-content: space-between;
    background-color: #f8fafc;
    border-radius: 0.5rem;
    padding: 0.5rem;
}

.unit-price-label {
    color: #475569;
    font-size: 0.875rem;
    font-weight: 500;
}

.unit-price-value {
    color: #1e293b;
    font-size: 0.875rem;
    font-weight: 600;
}

.product-controls {
    display: flex;
    flex-direction: column;
    gap: 1rem;
}

@media (min-width: 640px) {
    .product-controls {
        flex-direction: row;
        align-items: center;
        justify-content: space-between;
    }
}

.quantity-controls {
    display: flex;
    flex-direction: column;
    gap: 0.5rem;
}

@media (min-width: 640px) {
    .quantity-controls {
        flex-direction: row;
        align-items: center;
        gap: 1rem;
    }
}

.quantity-label {
    display: block;
    color: #374151;
    font-size: 0.875rem;
    font-weight: 500;
    margin-bottom: 0.5rem;
}

@media (min-width: 640px) {
    .quantity-label {
        display: none;
    }
}

.quantity-wrapper {
    display: flex;
    align-items: center;
    background-color: #ffffff;
    border: 1.5px solid #e2e8f0;
    border-radius: 0.75rem;
    overflow: hidden;
    box-shadow: 0 1px 3px 0 rgba(0, 0, 0, 0.1);
    transition: all 0.2s ease;
}

.quantity-wrapper:hover {
    border-color: #cbd5e1;
    box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1);
}

.quantity-wrapper:focus-within {
    border-color: var(--primary, #3b82f6);
    box-shadow: 0 0 0 3px rgba(59, 130, 246, 0.1);
}

.quantity-btn {
    width: 2.75rem;
    height: 2.75rem;
    display: flex;
    align-items: center;
    justify-content: center;
    background-color: #f8fafc;
    transition: all 0.2s ease;
    cursor: pointer;
    border: none;
    position: relative;
}

.quantity-btn:hover:not(.disabled) {
    background-color: var(--primary, #3b82f6);
}

.quantity-btn:hover:not(.disabled) .quantity-icon {
    color: white;
    transform: scale(1.1);
}

.quantity-btn:active:not(.disabled) {
    transform: scale(0.95);
}

.quantity-btn.disabled {
    opacity: 0.4;
    cursor: not-allowed;
    background-color: #f1f5f9;
}

.decrease-btn {
    border-right: 1.5px solid #e2e8f0;
}

.decrease-btn:hover:not(.disabled) {
    background: linear-gradient(135deg, #ef4444, #dc2626);
}

.increase-btn {
    border-left: 1.5px solid #e2e8f0;
}

.increase-btn:hover:not(.disabled) {
    background: linear-gradient(135deg, #10b981, #059669);
}

.quantity-icon {
    width: 1.125rem;
    height: 1.125rem;
    color: #64748b;
    transition: all 0.2s ease;
    stroke-width: 2.5;
}

.quantity-display {
    flex: 1;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    padding: 0.5rem;
    background-color: #ffffff;
    min-width: 4rem;
}

.quantity-input {
    width: 100%;
    text-align: center;
    border: none;
    outline: none;
    font-size: 1rem;
    font-weight: 600;
    color: #1e293b;
    background: transparent;
    appearance: none;
    line-height: 1;
}

.quantity-input::-webkit-outer-spin-button,
.quantity-input::-webkit-inner-spin-button {
    appearance: none;
    margin: 0;
}

.quantity-unit {
    font-size: 0.625rem;
    color: #94a3b8;
    font-weight: 500;
    margin-top: 0.125rem;
    text-transform: uppercase;
    letter-spacing: 0.025em;
}

.total-price {
    display: flex;
    flex-direction: column;
    text-align: center;
}

@media (min-width: 640px) {
    .total-price {
        text-align: right;
    }
}

.total-label {
    color: #475569;
    font-size: 0.875rem;
    font-weight: 500;
}

.total-value {
    color: #1e293b;
    font-size: 1.125rem;
    font-weight: 700;
    margin-top: 0.25rem;
}

.remove-btn {
    display: inline-flex;
    align-items: center;
    gap: 0.5rem;
    padding: 0.5rem 0.75rem;
    color: #dc2626;
    background-color: #fef2f2;
    border: 1px solid #fecaca;
    border-radius: 0.5rem;
    font-size: 0.875rem;
    font-weight: 500;
    transition: background-color 0.2s ease;
    cursor: pointer;
    align-self: flex-start;
}

.remove-btn:hover {
    background-color: #fee2e2;
}

@media (min-width: 640px) {
    .remove-btn {
        align-self: center;
    }
}

.remove-text {
    display: none;
}

@media (min-width: 640px) {
    .remove-text {
        display: block;
    }
}

/* Mobile specific adjustments */
@media (max-width: 639px) {
    .product-controls {
        border-top: 1px solid #e2e8f0;
        padding-top: 1rem;
        margin-top: 1rem;
    }
    
    .quantity-controls {
        flex-direction: row;
        align-items: center;
        justify-content: space-between;
    }
    
    .quantity-label {
        display: block;
        flex-shrink: 0;
        margin-bottom: 0;
    }
    
    .total-price {
        flex-direction: row;
        justify-content: space-between;
        align-items: center;
        background-color: #f8fafc;
        border-radius: 0.5rem;
        padding: 0.5rem;
    }
    
    .total-label {
        font-size: 1rem;
    }
    
    .total-value {
        font-size: 1.25rem;
        margin-top: 0;
    }
}
</style>


