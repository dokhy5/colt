import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:colt_shop/Features/home_page/presentation/views/home_view.dart';
import 'package:colt_shop/Features/info/presentation/views/info_view.dart';
import 'package:colt_shop/Features/notifications/presentation/views/notifications_view.dart';
import 'package:colt_shop/Features/orders/presentation/views/orders_view.dart';
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
    TabItem(icon: Icons.home,),
    TabItem(icon: Icons.notification_add, ),
    TabItem(icon: Icons.shopping_cart_outlined, ),
    TabItem(icon: Icons.account_box,),
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
            backgroundColor:  Color(0xffF4F4F4),
            color: Colors.grey,
            colorSelected: const Color(0xff8E6CEF),
            indexSelected: visit,
            onTap: (int index) => setState(() {
              visit = index;
              },
            ),
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
        return const NotificationsView(); // Wishlist Content
      case 2:
        return const OrdersView(); // Cart Content
      case 3:
        return const InfoView(); // Profile Content
      default:
        return const HomeView(); // Default to Home
    }
  }
}
