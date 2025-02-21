import 'package:colt_shop/core/utils/app_router.dart';
import 'package:flutter/material.dart';

class MenuForMe extends StatelessWidget {
  const MenuForMe({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildMenuItem(
          context,
          icon: Icons.location_on,
          text: 'Address',
          onTap: () => AppRouter.router.push( AppRouter.kAddress),
        ),
        _buildMenuItem(
          context,
          icon: Icons.favorite_border,
          text: 'Wishlist',
          onTap: () => _navigateToPage(context, const WishlistPage()),
        ),
        _buildMenuItem(
          context,
          icon: Icons.payment,
          text: 'Payment',
          onTap: () => _navigateToPage(context, const PaymentPage()),
        ),
        _buildMenuItem(
          context,
          icon: Icons.help_outline,
          text: 'Help',
          onTap: () => _navigateToPage(context, const HelpPage()),
        ),
        _buildMenuItem(
          context,
          icon: Icons.support_agent,
          text: 'Support',
          onTap: () => _navigateToPage(context, const SupportPage()),
        ),
      ],
    );
  }

  Widget _buildMenuItem(BuildContext context,
      {required IconData icon, required String text, required VoidCallback onTap}) {
    return Container(
      height: 56,
      width: 342,
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[200], // Adjust background color as needed
        boxShadow: [
          BoxShadow(
            // ignore: deprecated_member_use
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        
        title: Text(text, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
        leading: Icon(icon, color: Colors.deepPurpleAccent),
        onTap: onTap,
      ),
    );
  }

  void _navigateToPage(BuildContext context, Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }
}

// Placeholder Pages (Replace with actual pages)
class AddressPage extends StatelessWidget {
  const AddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text("Address")));
  }
}

class WishlistPage extends StatelessWidget {
  const WishlistPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text("Wishlist")));
  }
}

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text("Payment")));
  }
}

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text("Help")));
  }
}

class SupportPage extends StatelessWidget {
  const SupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text("Support")));
  }
}
