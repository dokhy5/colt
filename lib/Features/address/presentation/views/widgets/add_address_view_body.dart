import 'package:colt_shop/Features/address/presentation/views/widgets/appbar_add_address.dart';
import 'package:colt_shop/Features/address/presentation/views/widgets/custom_button_save_address.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:colt_shop/core/widgets/text_field_register.dart';

class AddAddressViewBody extends StatefulWidget {
  const AddAddressViewBody({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AddAddressViewBodyState createState() => _AddAddressViewBodyState();
}

class _AddAddressViewBodyState extends State<AddAddressViewBody> {
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _zipController = TextEditingController();
  bool _isButtonEnabled = false;

  /// Load saved data from SharedPreferences
  Future<void> _loadSavedData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _addressController.text = prefs.getString('address') ?? '';
      _cityController.text = prefs.getString('city') ?? '';
      _stateController.text = prefs.getString('state') ?? '';
      _zipController.text = prefs.getString('zip') ?? '';
      setState(() {
        _isButtonEnabled = _addressController.text.isNotEmpty &&
            _cityController.text.isNotEmpty &&
            _stateController.text.isNotEmpty &&
            _zipController.text.isNotEmpty;
      });
// Check if button should be enabled
    });
  }

  /// Save data to SharedPreferences
  Future<void> _saveData() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> addresses = prefs.getStringList('addresses') ?? [];

    // إضافة العنوان الجديد
    String newAddress =
        "${_addressController.text}, ${_cityController.text}, ${_stateController.text}, ${_zipController.text}";
    addresses.add(newAddress);

    await prefs.setStringList('addresses', addresses);
    _loadSavedData(); // إعادة تحميل القائمة
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Address saved successfully!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 40),
                const AppbarAddAddress(),
                const SizedBox(height: 16),
                TextFieldRegister(
                  controller: _addressController,
                  labelText: 'Address',
                  hintText: 'Address',
                  onChanged: (_) => () {
                    setState(() {
                      _isButtonEnabled = _addressController.text.isNotEmpty &&
                          _cityController.text.isNotEmpty &&
                          _stateController.text.isNotEmpty &&
                          _zipController.text.isNotEmpty;
                    });
                  }(),
                ),
                const SizedBox(height: 16),
                TextFieldRegister(
                  controller: _cityController,
                  labelText: 'City',
                  hintText: 'City',
                  onChanged: (_) => () {
                    setState(() {
                      _isButtonEnabled = _addressController.text.isNotEmpty &&
                          _cityController.text.isNotEmpty &&
                          _stateController.text.isNotEmpty &&
                          _zipController.text.isNotEmpty;
                    });
                  }(),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    SizedBox(
                      width: 148,
                      height: 56,
                      child: TextFieldRegister(
                        controller: _stateController,
                        labelText: 'State',
                        hintText: 'State',
                        onChanged: (_) => () {
                          setState(() {
                            _isButtonEnabled =
                                _addressController.text.isNotEmpty &&
                                    _cityController.text.isNotEmpty &&
                                    _stateController.text.isNotEmpty &&
                                    _zipController.text.isNotEmpty;
                          });
                        }(),
                      ),
                    ),
                    const SizedBox(width: 16),
                    SizedBox(
                      width: 148,
                      height: 56,
                      child: TextFieldRegister(
                        controller: _zipController,
                        labelText: 'Zip Code',
                        hintText: 'Zip Code',
                        onChanged: (_) => () {
                          setState(() {
                            _isButtonEnabled =
                                _addressController.text.isNotEmpty &&
                                    _cityController.text.isNotEmpty &&
                                    _stateController.text.isNotEmpty &&
                                    _zipController.text.isNotEmpty;
                          });
                        }(),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
          CustomButtonSaveAddress(
            isButtonEnabled: _isButtonEnabled,
            onSave: _saveData,
          ),
        ],
      ),
    );
  }
}
