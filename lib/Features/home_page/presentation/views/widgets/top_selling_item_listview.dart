import 'package:colt_shop/core/utils/app_router.dart';
import 'package:colt_shop/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class TopSellingItemListView extends StatefulWidget {
  const TopSellingItemListView({super.key});

  @override
  _TopSellingItemListViewState createState() => _TopSellingItemListViewState();
}

class _TopSellingItemListViewState extends State<TopSellingItemListView> {
  bool isPressed = false;
  final String itemName = "Men's Harrington Jacket";
  final String itemPrice = "\$148.00";
  final String itemImage = AssetsData.test2;

  @override
  void initState() {
    super.initState();
    _loadWishlistStatus();
  }

  // Load the wishlist status
  Future<void> _loadWishlistStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> wishlist = prefs.getStringList('wishlist') ?? [];

    setState(() {
      isPressed = wishlist.contains(itemName); 
    });
  }

  // Toggle wishlist item
  Future<void> _toggleWishlist() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> wishlist = prefs.getStringList('wishlist') ?? [];

    if (isPressed) {
      // Remove from wishlist
      wishlist.remove(itemName);
    } else {
      // Add to wishlist
      Map<String, String> item = {
        "name": itemName,
        "price": itemPrice,
        "image": itemImage,
      };
      wishlist.add(jsonEncode(item)); 
    }

    await prefs.setStringList('wishlist', wishlist);

    setState(() {
      isPressed = !isPressed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
                  // print('object');  
                  AppRouter.router.push(AppRouter.kItemPage);
                },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            color: Colors.grey[200],
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    SizedBox(
                      height: 180,
                      width: 159,
                      child: Image.asset(
                        itemImage,
                        height: 180,
                        width: 159,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Positioned(
                      top: 5,
                      right: 6,
                      child: IconButton(
                        icon: FaIcon(
                          isPressed
                              ? FontAwesomeIcons.solidHeart
                              : FontAwesomeIcons.heart,
                          color: isPressed ? Colors.red : Colors.black,
                        ),
                        onPressed: _toggleWishlist,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        itemName,
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        itemPrice,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
