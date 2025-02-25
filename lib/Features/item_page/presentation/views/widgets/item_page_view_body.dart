import 'package:colt_shop/Features/item_page/presentation/views/widgets/image_generator.dart';
import 'package:colt_shop/Features/item_page/presentation/views/widgets/info_and_reviwe_item.dart';
import 'package:colt_shop/Features/item_page/presentation/views/widgets/quantity.dart';
import 'package:colt_shop/Features/item_page/presentation/views/widgets/select_attribute.dart';
import 'package:colt_shop/core/widgets/button_back_custom.dart';
import 'package:colt_shop/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class ItemPageViewBody extends StatefulWidget {
  const ItemPageViewBody({super.key});

  @override
  State<ItemPageViewBody> createState() => _ItemPageViewBodyState();
}

class _ItemPageViewBodyState extends State<ItemPageViewBody> {
  String selectedSize = 'S';
  String selectedColor = 'orange';
  int selectedQuantity = 1;

  static const String sizeKey = 'selectedSize';
  static const String colorKey = 'selectedColor';
  static const String quantityKey = 'selectedQuantity';

  @override
  void initState() {
    super.initState();
    _loadPreferences();
  }

  Future<void> _loadPreferences() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedSize = prefs.getString(sizeKey) ?? 'S';
      selectedColor = prefs.getString(colorKey) ?? 'orange';
      selectedQuantity = prefs.getInt(quantityKey) ?? 1;
    });
  }

  void updateSize(String size) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(sizeKey, size);
    setState(() => selectedSize = size);
  }

  void updateColor(String color) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(colorKey, color);
    setState(() => selectedColor = color);
  }

  void updateQuantity(int quantity) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(quantityKey, quantity);
    setState(() => selectedQuantity = quantity);
  }

  Future<void> addToCart() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    Map<String, dynamic> cartItem = {
      'name': 'Nike Air Max 270',
      'price': 148,
      'size': selectedSize,
      'color': selectedColor,
      'quantity': selectedQuantity,
    };

    List<String> cart = prefs.getStringList('cart') ?? [];

    bool itemExists = cart.any((item) {
      Map<String, dynamic> decodedItem = jsonDecode(item);
      return decodedItem['name'] == cartItem['name'] &&
          decodedItem['size'] == cartItem['size'] &&
          decodedItem['color'] == cartItem['color'];
    });

    String message = itemExists ? 'Item already in cart!' : 'Item added to cart!';
    Color backgroundColor = itemExists ? Colors.orange : Colors.green;

    if (!itemExists) {
      cart.add(jsonEncode(cartItem));
      await prefs.setStringList('cart', cart);
    }

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          duration: const Duration(seconds: 2),
          backgroundColor: backgroundColor,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  const SizedBox(height: 40),
                  const ButtonBackCustom(),
                  const SizedBox(height: 24),
                  const ImageGenerator(),
                  const SizedBox(height: 24),
                  const Text(
                    'Nike Air Max 270',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    '\$148',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0XFF8E6CEF)),
                  ),
                  const SizedBox(height: 33),
                  SelectAttribute(
                    label: 'Size',
                    items: [
                      {'label': 'S', 'value': 'S'},
                      {'label': 'M', 'value': 'M'},
                      {'label': 'L', 'value': 'L'}, 
                      {'label': 'XL', 'value': 'XL'},
                    ],
                    initialValue: selectedSize,
                    preferenceKey: sizeKey,
                    onChanged: (value) => updateSize(value as String),
                  ),
                  const SizedBox(height: 12),
                  SelectAttribute(
                    label: 'Select Color',
                    items: [
                      {'label': 'Orange', 'value': 'orange'},
                      {'label': 'Black', 'value': 'black'},
                      {'label': 'Red', 'value': 'red'},
                      {'label': 'Yellow', 'value': 'yellow'},
                      {'label': 'Blue', 'value': 'blue'},
                    ],
                    initialValue: selectedColor,
                    preferenceKey: colorKey,
                    onChanged: (value) => updateColor(value as String),
                    isColorPicker: true,
                  ),
                  const SizedBox(height: 12),
                  Quantity(onQuantityChanged: updateQuantity),
                  const SizedBox(height: 26),
                  const InfoAndReviweItem(),
                  const SizedBox(height: 50),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CustomButton(
          onPressed: addToCart,
          text: '\$148.00                                   Add to Bag',
        ),
      ),
    );
  }
}
