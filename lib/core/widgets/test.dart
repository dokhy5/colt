import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:colt_shop/Features/home_page/presentation/views/home_view.dart';
import 'package:flutter/material.dart';

class BottomNavDashboard extends StatefulWidget {
  const BottomNavDashboard({super.key});

  @override
  _BottomNavDashboardState createState() => _BottomNavDashboardState();
}

class _BottomNavDashboardState extends State<BottomNavDashboard> {
  int visit = 0; // To track the selected bottom navigation index

  // List of Tab items for BottomBar
  static const List<TabItem> items = [
    TabItem(icon: Icons.home, title: 'Home'),
    TabItem(icon: Icons.favorite_border, title: 'Wishlist'),
    TabItem(icon: Icons.shopping_cart_outlined, title: 'Cart'),
    TabItem(icon: Icons.account_box, title: 'Profile'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _getPageContent(visit),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 20.0, left: 20, right: 20),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10), // Rounded corners
          child: BottomBarFloating(
            items: items,
            backgroundColor: const Color.fromARGB(255, 215, 215, 215),
            color: Colors.grey,
            colorSelected: const Color(0xff8E6CEF),
            indexSelected: visit,
            onTap: (int index) => setState(() {
              visit = index;
            }),
          ),
        ),
      ),
    );
  }

  Widget _getPageContent(int index) {
    switch (index) {
      case 0:
        return const HomeView(); // Home Content
      case 1:
        return const Center(child: Text('Wishlist')); // Wishlist Content
      case 2:
        return const Center(child: Text('Cart')); // Cart Content
      case 3:
        return const Center(child: Text('Profile')); // Profile Content
      default:
        return const HomeView(); // Default to Home
    }
  }
}
