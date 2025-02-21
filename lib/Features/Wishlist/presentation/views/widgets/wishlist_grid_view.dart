
import 'package:colt_shop/Features/Wishlist/presentation/views/widgets/wishlist_grid_item.dart';
import 'package:flutter/material.dart';

class WishlistGridView extends StatelessWidget {
  final List<Map<String, String>> wishlistItems;
  final Function(int) onRemove;

  const WishlistGridView({
    super.key,
    required this.wishlistItems,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: wishlistItems.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // 2 items per row
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.7, // Adjust aspect ratio
      ),
      itemBuilder: (context, index) {
        return WishlistGridItem(
          name: wishlistItems[index]["name"]!,
          price: wishlistItems[index]["price"]!,
          image: wishlistItems[index]["image"]!,
          onRemove: () => onRemove(index),
        );
      },
    );
  }
}
