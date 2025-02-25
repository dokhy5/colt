import 'package:colt_shop/Features/cart/presentation/views/widgets/checkout_view_body.dart';
import 'package:flutter/material.dart';

class CheckoutView extends StatelessWidget {
  final List<Map<String, dynamic>> cartItems;
  final double subtotal;
  final double shippingCost;
  final double tax;
  final double total;

  const CheckoutView({
    super.key,
    required this.cartItems,
    required this.subtotal,
    required this.shippingCost,
    required this.tax,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: CheckoutViewBody(
          cartItems: cartItems,
          subtotal: subtotal,
          shippingCost: shippingCost,
          tax: tax,
          total: total,
        ),
      ),
    );
  }
}
