import 'package:colt_shop/core/utils/app_router.dart';
import 'package:colt_shop/core/widgets/button_back_custom.dart';
import 'package:colt_shop/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
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

  Future<void> _loadSavedAddresses() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _savedAddresses = prefs.getStringList('addresses') ?? [];
    });
  }

  Future<void> _removeAddress(int index) async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _savedAddresses.removeAt(index);
      prefs.setStringList('addresses', _savedAddresses);
    });
  }

  Widget _buildAddressCard(String address, int index) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              address,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          GestureDetector(
            onTap: () => _removeAddress(index),
            child: const Text(
              'Remove',
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
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
              const SizedBox(width: 48),
            ],
          ),
          const SizedBox(height: 20),
          Expanded(
            child: _savedAddresses.isEmpty
                ? const Center(child: Text("No saved addresses"))
                : ListView.builder(
                    itemCount: _savedAddresses.length,
                    itemBuilder: (context, index) {
                      return _buildAddressCard(_savedAddresses[index], index);
                    },
                  ),
          ),
          const SizedBox(height: 20),
          CustomButton(
            text: 'Add Address',
            onPressed: () async {
              await AppRouter.router.push(AppRouter.kAddAddress);
              _loadSavedAddresses(); // Reload addresses after returning
            },
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
