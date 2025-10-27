import axios from "axios";
import { defineStore } from "pinia";
import { useToast } from "vue-toastification";
import AddToCartDialog from "../components/AddCartPopupDialog.vue";
import RemoveCartPopupDialog from "../components/RemoveCartPopupDialog.vue";

import { useAuth } from "./AuthStore";
import { useMaster } from "./MasterStore";

const toast = useToast();

export const useBasketStore = defineStore("basketStore", {
    state: () => ({
        total: 0,
        products: [],
        checkoutProducts: [],
        selectedShopIds: [],
        total_amount: 0,
        delivery_charge: 0,
        coupon_discount: 0,
        payable_amount: 0,
        order_tax_amount: 0,
        coupon_code: "",
        all_vat_taxes: [],
        showOrderConfirmModal: false,
        orderPaymentCancelModal: false,
        address: null,
        buyNowShopId: null,
        buyNowProduct: null,
        isLoadingCart: false,
    }),

    getters: {
        totalAmount: (state) => {
            let total = 0;
            state.products.forEach((item) => {
                item.products.forEach((product) => {
                    let price = product.unit_price ?? (
                        product.discount_price > 0
                            ? product.discount_price
                            : product.price
                    );
                    total += price * product.quantity;
                });
            });
            return total.toFixed(2);
        },

        totalCheckoutAmount: (state) => {
            let total = 0;
            state.checkoutProducts.forEach((item) => {
                item.products.forEach((product) => {
                    let price =
                        product.discount_price > 0
                            ? product.discount_price
                            : product.price;
                    total += price * product.quantity;
                });
            });
            return total.toFixed(2);
        },

        checkoutTotalItems: (state) => {
            let total = 0;
            state.checkoutProducts.forEach((item) => {
                total += item.products.length;
            });
            return total;
        },

        /**
         * المنتجات مجمعة حسب المتجر للزائر
         */
        groupedProductsByShop: (state) => {
            // يرجع مصفوفة: كل عنصر يمثل متجر وله المنتجات الخاصة به
            return state.products.map(group => ({
                shop_id: group.shop_id,
                shop_name: group.shop_name,
                shop_thumbnail: group.shop_thumbnail,
                shop_rating: group.shop_rating,
                products: group.products
            }));
        },
    },

    actions: {
        /**
         * Add a product to cart.
         * @param {object} data - object containing product id, quantity, color, size, unit.
         * @param {object} product - the product to add to cart.
         * @returns {Promise}
         */
        addToCart(data, product) {

            const masterStore = useMaster();
            if (data.product_id) {
                this.isLoadingCart = true;
                const content = {
                    component: AddToCartDialog,
                    props: {
                        product: product,
                    },
                };
                const authStore = useAuth();
                if (!authStore.token) {
                    this.isLoadingCart = false;
                    const shopId = product?.shop?.id;
                    console.log("Adding to shop group:", data);
                    if (!shopId) return;
                    // find or create shop group
                    let shopGroup = this.products.find((g) => g.shop_id === shopId);
                    if (!shopGroup) {
                        console.log("Creating new shop group:", shopId);    
                        shopGroup = {
                            shop_id: product?.shop?.id,
                            shop_name: product?.shop?.name || null,
                            shop_thumbnail: product?.shop?.thumbnail || null,
                            shop_rating: product?.shop?.average_rating || product?.shop?.rating || null,
                            products: []
                        };
                        this.products.push(shopGroup);
                    }
                    // تحقق أن المنتج لا يضاف إلا لمجموعة المتجر الصحيح
                    let existing = shopGroup.products.find((p) => p.id === data.product_id);
                    const basePrice = (product?.discount_price > 0 ? product.discount_price : product?.price) || 0;
                    // try to add size/color price if available on product
                    let extraSizePrice = 0;
                    let extraColorPrice = 0;
                    let sizeName = null;
                    let colorName = null;

                    if (data.size && Array.isArray(product?.sizes)) {
                        const sz = product.sizes.find((s) => s.id == data.size);
                        if (sz) { extraSizePrice = sz.price || 0; sizeName = sz.name || null; }
                    }
                    if (data.color && Array.isArray(product?.colors)) {
                        const cl = product.colors.find((c) => c.id == data.color);
                        if (cl) { extraColorPrice = cl.price || 0; colorName = cl.name || null; }
                    }
                    const unitPrice = basePrice + extraSizePrice + extraColorPrice;
                    if (existing) {
                        existing.quantity += data.quantity || 1;
                    } else {
                        let thumbnail = null;
                        if (Array.isArray(product?.thumbnails) && product.thumbnails.length > 0) {
                            thumbnail = product.thumbnails[0]?.thumbnail || product.thumbnails[0];
                        } else if (typeof product?.thumbnails === "string") {
                            thumbnail = product.thumbnails;
                        } else {
                            thumbnail = product?.thumbnail || null;
                        }
                        shopGroup.products.push({
                            id: data.product_id,
                            name: product?.name,
                            thumbnail : thumbnail,
                            price: product?.price,
                            discount_price: product?.discount_price || 0,
                            quantity: data.quantity || 1,
                            unit: data.unit || null,
                            size: data.size || null,
                            size_name: sizeName,
                            color: data.color || null,
                            color_name: colorName,
                            unit_price: unitPrice,
                        });
                    }
                    // تأكد أن كل منتج يذهب لمجموعة المتجر الصحيح فقط
                    this.products = this.products
                        .filter(group => group.products.length)
                        .sort((a, b) => a.shop_id - b.shop_id);
                    // recompute total items
                    let totalItems = 0;
                    this.products.forEach((g) => g.products.forEach((p) => { totalItems += p.quantity; }));
                    this.total = totalItems;
                    if (!data.is_buy_now) {
                        toast(content, {
                            type: "default",
                            hideProgressBar: true,
                            icon: false,
                            position: masterStore.langDirection === 'rtl' ? "bottom-right" : "bottom-left",
                            toastClassName: "vue-toastification-alert",
                            timeout: 3000,
                        });
                    }
                    return;
                }
                axios.post("/cart/store", data, {
                    headers: {
                        Authorization: authStore.token,
                    },
                }).then((response) => {
                    this.isLoadingCart = false;
                    if (!data.is_buy_now) {
                        this.total = response.data.data.total;
                        this.products = response.data.data.cart_items;
                        toast(content, {
                            type: "default",
                            hideProgressBar: true,
                            icon: false,
                            position: masterStore.langDirection === 'rtl' ? "bottom-right" : "bottom-left",
                            toastClassName: "vue-toastification-alert",
                            timeout: 3000,
                        });

                        if (response.data.data.info) {
                            toast.warning(response.data.data.info, {
                                position: authStore.langDirection === 'rtl' ? "bottom-right" : "bottom-left",
                            });
                        }
                    }
                }).catch((error) => {
                    this.isLoadingCart = false;
                    const msg = error?.response?.data?.message || "Failed";
                    toast.error(msg, {
                        position: masterStore.langDirection === 'rtl' ? "bottom-right" : "bottom-left",
                    });
                    return error;
                });
            }
        },

        /**
         * Fetches the cart data from the server and updates the state.
         * If the user is not logged in, it clears the cart and related state.
         */
        fetchCart() {
            const authStore = useAuth();
            if (authStore.token) {
                axios.get("/carts", {
                    headers: {
                        Authorization: authStore.token,
                    },
                }).then((response) => {
                    this.total = response.data.data.total;
                    this.products = response.data.data.cart_items;

                    if (response.data.data.info) {
                        toast.warning(response.data.data.info, {
                            position: authStore.langDirection === 'rtl' ? "bottom-right" : "bottom-left",
                        });
                    }
                }).catch((error) => {
                    if (error.response.status === 401) {
                        authStore.token = null;
                        authStore.user = null;
                        authStore.addresses = [];
                        authStore.favoriteProducts = 0;
                    }
                });
            } else {
                // keep guest cart as-is (persisted)
                return;
            }
        },

        /**
         * Decrement the quantity of a given product in the cart
         * @param {object} product - the product to decrement the quantity for
         */
        decrementQuantity(product) {
            const authStore = useAuth();
            const masterStore = useMaster();
            if (!product) return;
            const content = {
                component: RemoveCartPopupDialog,
                props: { product: product },
            };
            if (!authStore.token) {
                // guest: update local cart
                let group = this.products.find((g) => g.shop_id === product.shop_id);
                if (!group) {
                    group = this.products.find((g) => g.products.some((p) => p.id === product.id));
                }
                if (!group) return;
                const item = group.products.find((p) => p.id === product.id);
                if (!item) return;
                if (item.quantity > 1) {
                    item.quantity -= 1;
                } else {
                    group.products = group.products.filter((p) => p.id !== product.id);
                    if (group.products.length === 0) {
                        this.products = this.products.filter((g) => g.shop_id !== group.shop_id);
                    }
                }
                // recompute total
                let totalItems = 0;
                this.products.forEach((g) => g.products.forEach((p) => { totalItems += p.quantity; }));
                this.total = totalItems;
                toast(content, { type: "default", hideProgressBar: true, icon: false, position: masterStore.langDirection === 'rtl' ? "bottom-right" : "bottom-left", toastClassName: "vue-toastification-alert", timeout: 3000 });
                return;
            }
            axios.post("/cart/decrement",
                { product_id: product.id },
                { headers: { Authorization: authStore.token } }
            ).then((response) => {
                this.total = response.data.data.total;
                this.products = response.data.data.cart_items;
                this.fetchCheckoutProducts();
                if (response.data.message == "product removed from cart") {
                    const shopIds = this.products.map((shop) => shop.shop_id);
                    this.selectedShopIds = this.selectedShopIds.filter((id) => shopIds.includes(id));
                    if (this.products.length === 0) {
                        this.selectedShopIds = [];
                        this.checkoutProducts = [];
                        this.total_amount = 0;
                        this.delivery_charge = 0;
                        this.coupon_discount = 0;
                        this.payable_amount = 0;
                    }
                    toast(content, { type: "default", hideProgressBar: true, icon: false, position: masterStore.langDirection === 'rtl' ? "bottom-right" : "bottom-left", toastClassName: "vue-toastification-alert", timeout: 3000 });
                    if (response.data.data.info) {
                        toast.warning(response.data.data.info, { position: authStore.langDirection === 'rtl' ? "bottom-right" : "bottom-left" });
                    }
                }
            });
        },

        /**
         * Increment the quantity of the given product in the cart
         * @param {object} product - the product to increment the quantity for
         */
        incrementQuantity(product) {
            const authStore = useAuth();
            const masterStore = useMaster();
            if (!product) return;
            if (!authStore.token) {
                let group = this.products.find((g) => g.shop_id === product.shop_id);
                if (!group) {
                    group = this.products.find((g) => g.products.some((p) => p.id === product.id));
                }
                if (!group) return;
                const item = group.products.find((p) => p.id === product.id);
                if (!item) return;
                item.quantity += 1;
                let totalItems = 0;
                this.products.forEach((g) => g.products.forEach((p) => { totalItems += p.quantity; }));
                this.total = totalItems;
                return;
            }
            axios.post("/cart/increment", { product_id: product.id }, { headers: { Authorization: authStore.token } })
                .then((response) => {
                    this.total = response.data.data.total;
                    this.products = response.data.data.cart_items;
                    this.fetchCheckoutProducts();
                    if (response.data.data.info) {
                        toast.warning(response.data.data.info, { position: authStore.langDirection === 'rtl' ? "bottom-right" : "bottom-left" });
                    }
                }).catch((error) => {
                    toast.error(error?.response?.data?.message || 'Failed', { position: masterStore.langDirection === 'rtl' ? "bottom-right" : "bottom-left" });
                });
        },

        /**
         * Remove the given product from the cart
         * @param {object} product - the product to remove from the cart
         */
        removeFromBasket(product) {
            const authStore = useAuth();
            if (!product) return;
            if (!authStore.token) {
                let group = this.products.find((g) => g.shop_id === product.shop_id);
                if (!group) {
                    group = this.products.find((g) => g.products.some((p) => p.id === product.id));
                }
                if (!group) return;
                group.products = group.products.filter((p) => p.id !== product.id);
                if (group.products.length === 0) {
                    this.products = this.products.filter((g) => g.shop_id !== group.shop_id);
                }
                let totalItems = 0;
                this.products.forEach((g) => g.products.forEach((p) => { totalItems += p.quantity; }));
                this.total = totalItems;
                return;
            }
            axios.post("/cart/delete", { product_id: product.id }, { headers: { Authorization: authStore.token } })
                .then((response) => {
                    this.total = response.data.data.total;
                    this.products = response.data.data.cart_items;
                    this.fetchCheckoutProducts();
                    if (response.data.data.info) {
                        toast.warning(response.data.data.info, { position: authStore.langDirection === 'rtl' ? "bottom-right" : "bottom-left" });
                    }
                });
        },

        /**
         * Select or deselect the given shop for checkout
         * @param {number} shop - the shop to select or deselect
         */
        selectCartItemsForCheckout(shop) {
            const authStore = useAuth();
            if (!authStore.token) {
                // فلترة المنتجات من اللوكل ستورج حسب المتجر المختار
                this.selectedShopIds = [shop];
                const filtered = this.products.filter(g => g.shop_id === shop);
                this.checkoutProducts = filtered;
                this.products = filtered;
                // احسب الإجمالي فقط للمنتجات المختارة
                let total = 0;
                let delivery = 0;
                this.checkoutProducts.forEach(group => {
                    group.products.forEach(product => {
                        total += product.unit_price * product.quantity;
                    });
                });
                this.total_amount = total;
                this.delivery_charge = delivery;
                this.payable_amount = total + delivery;
            } else {
                this.selectedShopIds =  [];
                if (!this.selectedShopIds.includes(shop)) {
                    this.selectedShopIds.push(shop);
                } else {
                    this.selectedShopIds = this.selectedShopIds.filter(
                        (item) => item !== shop
                    );
                }
                this.fetchCheckoutProducts();
            }
        },

        /**
         * Fetches the checkout products for the currently selected shops and updates
         * the checkout-related state, including total amount, delivery charge, coupon
         * discount, and payable amount. If the checkout products are empty, it clears
         * the selected shop IDs. Uses the auth token for authorization.
         */
        fetchCheckoutProducts() {
            const authStore = useAuth();
            const masterStore = useMaster();
            if (authStore.token) {
                axios.post("/cart/checkout", {
                    shop_ids: this.selectedShopIds,
                }, {
                    headers: {
                        Authorization: authStore.token,
                    },
                }).then((response) => {
                    this.checkoutProducts = response.data.data.checkout_items;
                    this.total_amount = response.data.data.checkout.total_amount;
                    this.delivery_charge = response.data.data.checkout.delivery_charge;
                    this.coupon_discount = response.data.data.checkout.coupon_discount;
                    this.payable_amount = response.data.data.checkout.payable_amount;
                    this.order_tax_amount = response.data.data.checkout.order_tax_amount;
                    this.all_vat_taxes = response.data.data.checkout.all_vat_taxes;
                    if (this.checkoutProducts.length === 0) {
                        this.selectedShopIds = [];
                    }
                }).catch((error) => {
                    if (error.response.status == 401) {
                        authStore.token = null;
                        authStore.user = null;
                        authStore.addresses = [];
                        authStore.favoriteProducts = 0;
                    }
                    toast.error(error.response.data.message, {
                        position: masterStore.langDirection === 'rtl' ? "bottom-right" : "bottom-left",
                    });
                });
            }
        },

        checkShopIsSelected(shopId) {
            return this.selectedShopIds.includes(shopId);
        },
    },

    persist: true,
});
