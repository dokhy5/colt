import 'package:colt_shop/Features/Wishlist/presentation/views/widgets/wishlist_view_body.dart';
import 'package:flutter/material.dart';

class WishlistView extends StatelessWidget {
  const WishlistView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SafeArea(child: WishlistViewBody()),);
  }
}