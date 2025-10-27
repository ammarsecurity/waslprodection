<template>
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
            <div v-for="shopId in props.shopProvinces ? Object.keys(props.shopProvinces) : []" :key="shopId">
                <label class="form-label">
                    {{ $t('Governorate') }} ({{ $t('المحافظة') }}) <span class="text-red-500">*</span>
                    <span class="text-xs text-slate-500">{{ $t('Shop') }} #{{ shopId }}</span>
                </label>
                <select 
                    v-model="props.selectedProvinces[shopId]"
                    class="form-input"
                    :class="{ 'border-red-300 focus:border-red-500': errors.province && !props.selectedProvinces[shopId] }"
                    @change="props.onChangeProvinces && props.onChangeProvinces(props.selectedProvinces[shopId], shopId)"
                >
                    <option value="" disabled>{{ $t('Select province') }}</option>
                    <option v-for="province in props.shopProvinces[shopId]" :key="province.id" :value="province.id">
                        {{ province.province_name }} - {{ props.showCurrency ? props.showCurrency(province.delivery_charge) : province.delivery_charge }}
                    </option>
                </select>
                <p v-if="errors.province && !props.selectedProvinces[shopId]" class="mt-1 text-sm text-red-600">{{ errors.province }}</p>
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
</template>

<script setup>
import { reactive, watch } from 'vue';

const emit = defineEmits(['update:nearestLandmark', 'update:provinceArea']);

const props = defineProps({
    shopProvinces: {
        type: Object,
        default: () => ({})
    },
    selectedProvinces: {
        type: Object,
        default: () => ({})
    },
    onChangeProvinces: {
        type: Function,
        default: null
    },
    showCurrency: {
        type: Function,
        default: null
    },
    provinceArea: {
        type: String,
        default: ''
    },
    nearestLandmark: {
        type: String,
        default: ''
    }
});

// Form data
const form = reactive({
    address: { 
        area: props.provinceArea || '', 
        nearest_landmark: props.nearestLandmark || ''
    }
});

// Form validation
const errors = reactive({
    province: '',
    area: ''
});

// Field validation
const validateField = (fieldName) => {
    switch (fieldName) {
        case 'area':
            errors.area = !form.address.area?.trim() ? 'المنطقة مطلوبة' : '';
            break;
    }
};

// Watch for form changes to update nearestLandmark
watch(() => form.address.nearest_landmark, (newValue) => {
    emit('update:nearestLandmark', newValue);
});

// Watch for form changes to update provinceArea
watch(() => form.address.area, (newValue) => {
    emit('update:provinceArea', newValue);
});

// Watch for props changes to update form
watch(() => props.provinceArea, (newValue) => {
    form.address.area = newValue;
});

watch(() => props.nearestLandmark, (newValue) => {
    form.address.nearest_landmark = newValue;
});
</script>

<style scoped>
.form-label {
    @apply text-slate-700 text-base font-normal leading-normal;
}

.form-input {
    @apply p-3 rounded-lg border border-slate-200 focus:border-primary w-full outline-none text-base font-normal leading-normal placeholder:text-slate-400;
}
</style>
