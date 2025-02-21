import 'package:colt_shop/Features/Wishlist/presentation/views/widgets/wishlist_grid_item.dart';
import 'package:colt_shop/core/widgets/button_back_custom.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class WishlistViewBody extends StatefulWidget {
  const WishlistViewBody({super.key});

  @override
  _WishlistViewBodyState createState() => _WishlistViewBodyState();
}

class _WishlistViewBodyState extends State<WishlistViewBody> {
  List<Map<String, String>> wishlistItems = [];

  @override
  void initState() {
    super.initState();
    _loadWishlist();
  }

  // Load wishlist from SharedPreferences
  Future<void> _loadWishlist() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> wishlist = prefs.getStringList('wishlist') ?? [];

    setState(() {
      wishlistItems = wishlist.map((item) => Map<String, String>.from(jsonDecode(item))).toList();
    });
  }

  // Remove item from wishlist
  Future<void> _removeFromWishlist(int index) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> wishlist = prefs.getStringList('wishlist') ?? [];

    wishlist.removeAt(index);
    await prefs.setStringList('wishlist', wishlist);

    setState(() {
      wishlistItems.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ButtonBackCustom(),
              const Text(
                'Wishlist',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(width: 48), // Placeholder for symmetry
            ],
          ),
          const SizedBox(height: 20),
          Expanded(
            child: wishlistItems.isEmpty
                ? const Center(
                    child: Text(
                      "Your wishlist is empty",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  )
                : WishlistGridView(
                    wishlistItems: wishlistItems,
                    onRemove: _removeFromWishlist,
                  ),
          ),
        ],
      ),
    );
  }
}

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
