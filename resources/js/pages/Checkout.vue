<template>
    <div class="main-container">

        <!-- Breadcrumbs -->
        <div class="flex items-center gap-2 overflow-hidden pt-4">
            <router-link to="/" class="w-6 h-6">
                <HomeIcon class="w-5 h-5 text-slate-600" />
            </router-link>

            <div class="grow w-full overflow-hidden">
                <div class="space-x-1 text-slate-600 text-sm font-normal truncate">
                    <span>{{ $t('Home') }} </span>
                    <span>/</span>
                    <span>{{ $t('Cart') }}</span>
                    <span>/</span>
                    <span>{{ $t('Checkout') }}</span>
                </div>
            </div>
        </div>

        <div class="grid grid-cols-1 xl:grid-cols-3 my-3 gap-8">

            <div class="col-span-1 xl:col-span-2">

                <div class="py-4 border-b tran" :class="showProductItems ? 'border-primary' : 'border-slate-200'">
                    <!-- checkout -->
                    <div class="flex gap-2 justify-between items-center">
                        <div class="text-slate-950 text-lg sm:text-3xl font-medium leading-10">{{ $t('Checkout') }}
                        </div>
                        <div class="flex items-center gap-2 cursor-pointer"
                            @click="showProductItems = !showProductItems">
                            <div class="text-primary-600 text-lg font-medium leading-normal tracking-tight">
                                ({{ basketStore.checkoutTotalItems }} {{ $t('items') }})
                            </div>
                            <ChevronDownIcon class="w-5 h-5 text-primary-600 transition duration-300"
                                :class="showProductItems ? 'rotate-180' : ''" />
                        </div>
                    </div>

                    <!-- Product items -->
                    <div v-if="showProductItems">
                        <checkoutProducts />
                    </div>
                </div>

                <!-- Shipping Address -->
                <CheckoutShippingAddress 
                    :shopProvinces="shopProvinces"
                    :selectedProvinces="selectedProvinces"
                    :onChangeProvinces="onChangeProvinces"
                    :showCurrency="showCurrency"
                    :provinceArea="provinceArea"
                    :nearestLandmark="nearestLandmark"
                    @update:nearestLandmark="nearestLandmark = $event"
                />

                <div class="mt-6">
                    <div class="mb-1">
                        <span class="text-slate-950 text-xl font-medium leading-7">{{ $t('Note') }}</span>
                        <span class="text-slate-500 text-lg font-normal leading-7 tracking-tight">
                            ({{ $t('Optional') }})
                        </span>
                    </div>
                    <textarea v-model="note" rows="3" class="form-input"
                        :placeholder="$t('Write your note') + '...'"></textarea>
                </div>

                <!-- Payment Method -->
                <div class="p-6 mt-4 bg-white rounded-2xl border border-slate-200">
                    <div class="text-slate-950 text-xl font-medium leading-7">
                        {{ $t('Payment Method') }}
                    </div>

                    <div class="mt-4 flex flex-wrap gap-4">

                        <label v-if="master.cashOnDelivery" for="cash" class="flex items-center gap-4 xl:min-w-80">
                            <input v-model="paymentType" id="cash" name="payment" type="radio" class="radioBtn2"
                                value="cash" checked />
                            <div class="p-2 bg-white rounded-xl border border-slate-200">
                                <img :src="'assets/icons/money-2.svg'" alt="" class="w-7 h-7">
                            </div>
                            <span class="text-slate-500 text-base font-normal leading-normal">{{ $t('Cash on delivery')
                                }}</span>
                        </label>

                        <label v-if="master.onlinePayment" for="card" class="flex items-center gap-4 xl:min-w-80">
                            <input v-model="paymentType" id="card" name="payment" type="radio" class="radioBtn2"
                                value="card" />
                            <div class="p-2 bg-white rounded-xl border border-slate-200">
                                <img :src="'assets/icons/card.svg'" alt="" class="w-7 h-7">
                            </div>
                            <span class="text-slate-500 text-base font-normal leading-normal">
                                {{ $t('Credit or Debit Card') }}
                            </span>
                        </label>

                    </div>
                    <!-- Payment Gateways -->
                    <Transition leave-active-class="transition ease-in duration-300"
                        enter-active-class="transition ease-out duration-300"
                        enter-from-class="transform opacity-0 scale-95" enter-to-class="transform opacity-100 scale-100"
                        leave-from-class="transform opacity-100 scale-100"
                        leave-to-class="transform opacity-0 scale-95">

                        <div v-if="paymentType === 'card'" class="mt-5 border-t border-slate-200">
                            <span class="text-slate-600 pt-2 block text-md font-medium leading-7">
                                {{ $t('Available Payment Gateways') }}
                            </span>
                            <div class="mt-3 flex flex-wrap gap-4">
                                <label v-for="gateway in master.paymentGateways" :key="gateway.id" :for="gateway.name"
                                    class="flex items-center gap-4 border relative has-[:checked]:border-primary has-[:checked]:shadow-lg p-2 rounded-md border-slate-200 cursor-pointer">
                                    <input v-model="paymentGateway" :id="gateway.name" name="paymentGateway"
                                        type="radio" class="sr-only" :value="gateway.name" />
                                    <div class="">
                                        <img :src="gateway.logo" alt="" class="w-32 h-16 object-contain">
                                    </div>
                                </label>
                            </div>
                        </div>
                    </Transition>

                </div>

            </div>

            <!-- Order Summary -->
            <CheckoutOrderSummary 
                :note="note" 
                :paymentMethod="paymentMethod" 
                :deliveryCharge="deliveryCharge"
                :selectedProvinces="selectedProvinces"
                :provinceName="provinceName"
                :provinceArea="provinceArea"
                :nearestLandmark="nearestLandmark"
                :showCurrency="showCurrency"
            />

        </div>

    </div>
</template>

<script setup>
import { ChevronDownIcon, HomeIcon } from '@heroicons/vue/24/outline';
import { onMounted, ref, watch, computed, reactive } from 'vue';
import axios from 'axios';

import CheckoutOrderSummary from '../components/CheckoutOrderSummary.vue';
import checkoutProducts from '../components/checkoutProducts.vue';
import CheckoutShippingAddress from '../components/CheckoutShippingAddress.vue';

import { useAuth } from '../stores/AuthStore';
const AuthStore = useAuth();

import { useBasketStore } from '../stores/BasketStore';
import { useMaster } from '../stores/MasterStore';

import { useRouter } from 'vue-router';
const router = new useRouter();

const master = useMaster();
const basketStore = useBasketStore();

const showProductItems = ref(false);
const note = ref("");

const checkPayment = master.cashOnDelivery ? 'cash' : 'card';
const paymentType = ref(checkPayment);
const paymentMethod = ref(null);
const paymentGateway = ref(null);

// Form data for address management
const form = reactive({
    shop_ids: [],
    address: { 
        area: '', 
        nearest_landmark: ''
    }
});

// Province management
const shopProvinces = ref({}); // {shopId: [provinces]}
const selectedProvinces = ref({}); // {shopId: provinceId}
const deliveryCharge = ref(0);

// Province form data
const provinceName = ref('');
const provinceArea = ref('');
const nearestLandmark = ref('');

// Form validation
const errors = reactive({
    province: '',
    area: ''
});

// Computed property for validation check
const hasValidationErrors = computed(() => {
    return Object.values(errors).some(error => error !== '');
});

// Fetch provinces function
async function fetchProvinces(shopId) {
    try {
        const { data } = await axios.get(`/shop/${shopId}/provinces-delivery-charges`);
        return data.data || [];
    } catch (error) {
        console.error('Error fetching provinces:', error);
        return [];
    }
}

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

// Province change handler
const onChangeProvinces = (provinceId, shopId) => {
    // Clear province error when selecting
    if (provinceId) {
        errors.province = '';
    }
    
    // Find the province from the specific shop
    const provinces = shopProvinces.value[shopId] || [];
    const provinceObj = provinces.find(p => p.id == provinceId);
    
    if (provinceObj) {
        form.address.area = provinceObj.province_name;
        provinceName.value = provinceObj.province_name;
        provinceArea.value = provinceObj.province_name;
        nearestLandmark.value = form.address.nearest_landmark;
        
    }
    
    // Recalculate delivery charge
    calculateDeliveryCharge();
};

// Field validation
const validateField = (fieldName) => {
    switch (fieldName) {
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

// Utility function
function showCurrency(amount) {
    try { 
        return master.showCurrency ? master.showCurrency(amount) : amount; 
    } catch { 
        return amount; 
    }
}

// Initialize data on mount
onMounted(async () => {
    window.scrollTo(0, 0);
    basketStore.coupon_code = "";
    paymentMethod.value = paymentType.value;
    
    // If not logged-in, use guest checkout flow
    if (!AuthStore.user) {
        router.push({ name: 'guest-checkout' });
        return;
    }
    
    AuthStore.showAddressModal = false;
    AuthStore.showChangeAddressModal = false;
    
    // Initialize shop data and provinces
    if (basketStore.products.length > 0) {
        const shopIds = [...new Set(basketStore.products.map(group => group.shop_id))];
        form.shop_ids = shopIds;
        
        // Fetch provinces for each shop
        for (const shopId of shopIds) {
            const provinces = await fetchProvinces(shopId);
            shopProvinces.value[shopId] = provinces;
        }
        
        await calculateDeliveryCharge();
    }
});

// Watch for changes in shop_ids to recalculate delivery charge
watch(() => form.shop_ids, async (newShopIds) => {
    if (newShopIds.length > 0) {
        for (const shopId of newShopIds) {
            shopProvinces.value[shopId] = await fetchProvinces(shopId);
        }
        // Reset selected provinces
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

// Watch for form changes to update nearestLandmark
watch(() => form.address.nearest_landmark, (newValue) => {
    nearestLandmark.value = newValue;
});

// Watch for form changes to update provinceArea and provinceName
watch(() => form.address.area, (newValue) => {
    provinceArea.value = newValue;
    provinceName.value = newValue;
});

watch(paymentType, () => {
    if (paymentType.value === 'card') {
        paymentMethod.value = paymentGateway.value;
    } else {
        paymentMethod.value = paymentType.value;
    }
});

watch(paymentGateway, () => {
    if (paymentType.value === 'card') {
        paymentMethod.value = paymentGateway.value;
    }
});

</script>
<style scoped>
.form-label {
    @apply text-slate-700 text-base font-normal leading-normal;
}

.form-input {
    @apply p-3 rounded-lg border border-slate-200 focus:border-primary w-full outline-none text-base font-normal leading-normal placeholder:text-slate-400;
}

.formInputCoupon {
    @apply rounded-lg border border-slate-200 focus:border-primary w-full outline-none text-base font-normal leading-normal placeholder:text-slate-400;
}

.radio-btn {
    @apply w-5 h-5 border appearance-none border-slate-300 rounded-full checked:bg-primary ring-primary checked:outline-1 outline-offset-1 checked:outline-primary checked:outline transition duration-100 ease-in-out m-0;
}

.radioBtn2 {
    @apply w-4 h-4 border appearance-none border-slate-300 rounded-full checked:bg-primary ring-primary checked:outline-1 outline-offset-1 checked:outline-primary checked:outline transition duration-100 ease-in-out m-0;
}
</style>
