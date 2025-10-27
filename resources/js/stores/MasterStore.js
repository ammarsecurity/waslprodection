import { defineStore } from "pinia";

export const useMaster = defineStore("masterStore", {
    state: () => ({
        locale: "ar",
        langDirection: "rtl",
        defaultLocale: "ar",
        logo: null,
        currency: {
            symbol: "$",
            position: "prefix",
            name: "USD",
        },
        defaultCurrency: "USD",
        selectedCurrency: null,
        currencies: [],
        cashOnDelivery: false,
        onlinePayment: false,
        defaultDeliveryCharge: 0,
        appName: "",
        showDownloadApp: false,
        playStoreLink: null,
        appStoreLink: null,
        multiVendor: true,
        paymentGateways: [],
        mobile: null,
        showFooter: true,
        address: null,
        footerText: null,
        footerDescription: null,
        footerLogo: null,
        footerQr: null,
        socialLinks: [],
        basketCanvas: false,
        search: null,
        categories: [],
        themeColors: {
            primary: null,
            primary50: null,
            primary100: null,
            primary200: null,
            primary300: null,
            primary400: null,
            primary500: null,
            primary600: null,
            primary700: null,
            primary800: null,
            primary900: null,
            primary950: null,
        },
        pusher_app_key: null,
        pusher_app_cluster: null,
        app_environment: "local",
        register_otp_verify: false,
        register_otp_type: null,
        forgot_otp_type: null,
        languages: [],
        socialAuths: [],
        phoneRequired: true,
        phoneMinLength: 9,
        phoneMaxLength: 16,
        orderPlaceAccountVerify: false,
        menus: [],
        footers: [],
    }),

    getters: {
        getPosition: (state) => {
            return state.position;
        },

        getPlayStoreLink: (state) => {
            return state.playStoreLink;
        },

        getAppStoreLink: (state) => {
            return state.appStoreLink;
        },
        getMultiVendor: (state) => {
            return state.multiVendor;
        },
    },

    actions: {
        fetchData() {
            axios.get("/master").then((response) => {
                const data = response.data.data;
                this.currency = data.currency;
                this.currencies = data.currencies;
                this.position = data.currency.position;
                this.cashOnDelivery = data.cash_on_delivery;
                this.onlinePayment = data.online_payment;
                this.defaultDeliveryCharge = data.default_delivery_charge || 0;
                this.appName = data.app_name;
                this.playStoreLink = data.google_playstore_link;
                this.appStoreLink = data.app_store_link;
                this.multiVendor = data.multi_vendor;
                this.mobile = data.mobile;
                this.showFooter = data.web_show_footer;
                this.address = data.address;
                this.paymentGateways = data.payment_gateways;
                this.footerText = data.web_footer_text;
                this.footerDescription = data.web_footer_description;
                this.footerLogo = data.web_footer_logo;
                this.footerQr = data.footer_qr;
                this.logo = data.web_logo;
                this.socialLinks = data.social_links;
                this.themeColors = data.theme_colors;
                this.pusher_app_key = data.pusher_app_key;
                this.pusher_app_cluster = data.pusher_app_cluster;
                this.app_environment = data.app_environment;
                this.showDownloadApp = data.show_download_app;
                this.register_otp_verify = data.register_otp_verify;
                this.register_otp_type = data.register_otp_type;
                this.forgot_otp_type = data.forgot_otp_type;
                this.languages = data.languages;
                this.socialAuths = data.social_auths;
                this.phoneRequired = data.phone_required;
                this.phoneMinLength = data.phone_min_length;
                this.phoneMaxLength = data.phone_max_length;
                this.orderPlaceAccountVerify = data.order_place_account_verify;
                this.menus = data.menus;
                this.footers = data.footers;

                // Check localStorage first for user's language preference
                const savedLocale = localStorage.getItem('locale');
                const targetLocale = savedLocale || data.app_locale;
                
                if (this.defaultLocale != targetLocale) {
                    this.locale = targetLocale;
                    this.defaultLocale = targetLocale;
                    const defaultLanguage = this.languages.find(
                        (language) => language.name == this.locale
                    );
                    if (defaultLanguage) {
                        this.langDirection = defaultLanguage.direction ?? "rtl";
                    }
                    window.location.reload();
                }

                const defaultCurrency = this.currencies.find(
                    (currency) => currency.is_default == true
                );
                if (this.defaultCurrency != this.currency.name) {
                    this.defaultCurrency = this.currency.name;
                    this.setSelectedCurrency(defaultCurrency);
                } else if (!this.selectedCurrency) {
                    this.setSelectedCurrency(defaultCurrency ?? null);
                }
            });
        },
        setSelectedCurrency(defaultCurrency = null) {
            if (defaultCurrency) {
                this.selectedCurrency = defaultCurrency;
            } else {
                this.selectedCurrency.name = this.currency?.name ?? "USD";
                this.selectedCurrency.symbol = this.currency?.symbol ?? "$";
                this.selectedCurrency.rate = this.currency?.rate ?? 1;
            }
        },

        toggleLanguage() {
            const newLocale = this.locale === 'ar' ? 'en' : 'ar';
            const newDirection = newLocale === 'ar' ? 'rtl' : 'ltr';
            
            this.locale = newLocale;
            this.langDirection = newDirection;
            this.defaultLocale = newLocale;
            
            localStorage.setItem('locale', newLocale);
            
            // Update language on server session first
            axios.get('/change-language', {
                params: { language: newLocale }
            }).then(() => {
                // Reload to apply language changes
                window.location.reload();
            }).catch((error) => {
                console.error('Failed to change language', error);
                // Reload anyway even if server request fails
                window.location.reload();
            });
        },

        showCurrency(amount) {
            const currentRateFromDefault =
                this.selectedCurrency?.rate_from_default ?? 1;

            amount = parseFloat(amount * currentRateFromDefault).toFixed(2);

            if (this.currency.position == "prefix") {
                return (this.selectedCurrency?.symbol ?? "$") + amount;
            }
            return amount + (this.selectedCurrency?.symbol ?? "$");
        },
    },

    persist: true,
});
