import 'package:colt_shop/Features/cart/presentation/views/widgets/shipping_address.dart';
import 'package:colt_shop/Features/cart/presentation/views/widgets/summary_row.dart';
import 'package:colt_shop/core/utils/app_router.dart';
import 'package:colt_shop/core/widgets/button_back_custom.dart';
import 'package:colt_shop/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CheckoutViewBody extends StatelessWidget {
  final List<Map<String, dynamic>> cartItems;
  final double subtotal;
  final double shippingCost;
  final double tax;
  final double total;

  const CheckoutViewBody({
    super.key,
    required this.cartItems,
    required this.subtotal,
    required this.shippingCost,
    required this.tax,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const ButtonBackCustom(),
              const Text(
                'Checkout',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(width: 48),
            ],
          ),
          const SizedBox(height: 20),
          const ShippingAddress(),
          Spacer(),
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
           const SizedBox(height: 30),
           CustomButton(onPressed: (){},text:'Place Order'),
           const SizedBox(height: 20),
        ],
      ),
    );
  }
}