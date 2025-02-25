import 'package:colt_shop/Features/cart/presentation/views/widgets/cart_item_card.dart';
import 'package:flutter/material.dart';

class CartListView extends StatelessWidget {
  final List<Map<String, dynamic>> cartItems;
  const CartListView({super.key, required this.cartItems});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: cartItems.length,
      itemBuilder: (context, index) {
        final item = cartItems[index];
        return CartItemCard(item: item);
      },
    );
  }
}
