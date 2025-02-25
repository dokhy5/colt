import 'dart:convert';
import 'package:colt_shop/Features/cart/presentation/views/widgets/cart_list_view.dart';
import 'package:colt_shop/Features/cart/presentation/views/widgets/coupon_input_field.dart';
import 'package:colt_shop/Features/cart/presentation/views/widgets/empty_cart_view.dart';
import 'package:colt_shop/Features/cart/presentation/views/widgets/summary_row.dart';
import 'package:colt_shop/core/widgets/button_back_custom.dart';
import 'package:colt_shop/core/widgets/custom_button.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class CartViewBody extends StatefulWidget {
  const CartViewBody({super.key});

  @override
  State<CartViewBody> createState() => _CartViewBodyState();
}

class _CartViewBodyState extends State<CartViewBody> {
  List<Map<String, dynamic>> cartItems = [];

  @override
  void initState() {
    super.initState();
    _loadCart();
  }

  Future<void> _loadCart() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> savedCart = prefs.getStringList('cart') ?? [];
    setState(() {
      cartItems = savedCart
          .map((item) => jsonDecode(item) as Map<String, dynamic>)
          .toList();
    });
  }

  Future<void> _saveCart() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> encodedCart =
        cartItems.map((item) => jsonEncode(item)).toList();
    await prefs.setStringList('cart', encodedCart);
  }

  void _clearCart() async {
    setState(() {
      cartItems.clear();
    });
    await _saveCart();
  }

  double _calculateSubtotal() {
    return cartItems.fold(0, (total, item) => total + (item['price'] as num));
  }

  @override
  Widget build(BuildContext context) {
    double subtotal = _calculateSubtotal();
    double shippingCost = 8.0;
    double tax = 0.0;
    double total = subtotal + shippingCost + tax;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: cartItems.isEmpty
          ? _buildEmptyCart()
          : Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ButtonBackCustom(),
                    const Text(
                      'Cart',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    const SizedBox(width: 48),
                  ],
                ),
                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.topRight,
                  child: TextButton(
                    onPressed: _clearCart,
                    child: const Text(
                      'Remove All',
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  ),
                ),
                Expanded(child: CartListView(cartItems: cartItems)),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SummaryRow(label: 'Subtotal', value: subtotal),
                      SummaryRow(label: 'Shipping Cost', value: shippingCost),
                      SummaryRow(label: 'Tax', value: tax),
                      SummaryRow(label: 'Total', value: total, isTotal: true),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                const CouponInputField(),
                const SizedBox(height: 20),
                CustomButton(
                  onPressed: () {
                    context.push('/checkout', extra: {
                      'cartItems': cartItems,
                      'subtotal': subtotal,
                      'shippingCost': shippingCost,
                      'tax': tax,
                      'total': total,
                    });
                  },
                  text: 'Checkout',
                ),
                const SizedBox(height: 20),
              ],
            ),
    );
  }

  Widget _buildEmptyCart() {
    return const EmptyCartView();
  }
}
