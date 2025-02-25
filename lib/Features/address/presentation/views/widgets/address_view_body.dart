import 'package:colt_shop/Features/address/presentation/views/widgets/address_card.dart';
import 'package:colt_shop/core/utils/app_router.dart';
import 'package:colt_shop/core/widgets/button_back_custom.dart';
import 'package:colt_shop/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddressViewBody extends StatefulWidget {
  const AddressViewBody({super.key});

  @override
  _AddressViewBodyState createState() => _AddressViewBodyState();
}

class _AddressViewBodyState extends State<AddressViewBody> {
  List<String> _savedAddresses = [];

  @override
  void initState() {
    super.initState();
    _loadSavedAddresses();
  }

  /// Load saved addresses from SharedPreferences
  Future<void> _loadSavedAddresses() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _savedAddresses = prefs.getStringList('addresses') ?? [];
    });
  }

  /// Remove an address and update SharedPreferences
  Future<void> _removeAddress(int index) async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _savedAddresses.removeAt(index);
      prefs.setStringList('addresses', _savedAddresses);
    });
  }

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
              ButtonBackCustom(),
              const Text(
                'Address',
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
            child: _savedAddresses.isEmpty
                ? const Center(child: Text("No saved addresses"))
                : ListView.builder(
                    itemCount: _savedAddresses.length,
                    itemBuilder: (context, index) {
                      return AddressCard(
                        address: _savedAddresses[index],
                        onRemove: () => _removeAddress(index),
                      );
                    },
                  ),
          ),
          const SizedBox(height: 20),
          CustomButton(
            text: 'Add Address',
            onPressed: () async {
              await AppRouter.router.push(AppRouter.kAddAddress);
              // Delay ensures SharedPreferences is updated before UI refresh
              Future.delayed(const Duration(milliseconds: 300), _loadSavedAddresses);
            },
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}


