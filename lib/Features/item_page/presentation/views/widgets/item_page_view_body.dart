import 'package:colt_shop/Features/item_page/presentation/views/widgets/image_generator.dart';
import 'package:colt_shop/Features/item_page/presentation/views/widgets/select_attribute.dart';
import 'package:colt_shop/core/widgets/button_back_custom.dart';
import 'package:colt_shop/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class ItemPageViewBody extends StatelessWidget {
  const ItemPageViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:const Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
             SizedBox(height: 40),
             ButtonBackCustom(),
             SizedBox(height: 24),
             ImageGenerator(),
             SizedBox(height: 24),
             Text(
              'Nike Air Max 270',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
             SizedBox(height: 15),
             Text(
              '\$148',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0XFF8E6CEF),
              ),
            ),
          SizedBox(height: 33),

    SelectAttribute(
      label: 'Size',
      items: [
        {'label': 'S', 'value': 'S'},
        {'label': 'M', 'value': 'M'},
        {'label': 'L', 'value': 'L'},
        {'label': 'XL', 'value': 'XL'},
      ],
      initialValue: 'S',
    ),
     SizedBox(height: 12),

    // Color Dropdown (Unique Values)
    SelectAttribute(
      label: 'Color',
      items: [
        {'label': 'Red', 'value': 'red'},
        {'label': 'Blue', 'value': 'blue'},
        {'label': 'Green', 'value': 'green'},
        {'label': 'Yellow', 'value': 'yellow'},
      ],
      initialValue: 'green',
      isColorPicker: true,
    ),
     SizedBox(height: 12),
     Quantity(),


          ],
        ),
      ),


      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CustomButton(
          onPressed: () {},
          text: '\$148.00                                   Add to Bag',
        ),
      ),
    );
  }
}
class Quantity extends StatelessWidget {
  const Quantity ({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      height: 60,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
         const Text(
            'Quantity',
            style:  TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          QuantitySelector(
            initialQuantity: 1,
            onQuantityChanged: (value) {},
          ),
         
        ],
      ),
    );
  
  }
}



class QuantitySelector extends StatefulWidget {
  final int initialQuantity;
  final Function(int) onQuantityChanged;

  const QuantitySelector({
    super.key,
    this.initialQuantity = 1,
    required this.onQuantityChanged,
  });

  @override
  _QuantitySelectorState createState() => _QuantitySelectorState();
}

class _QuantitySelectorState extends State<QuantitySelector> {
  late int quantity;

  @override
  void initState() {
    super.initState();
    quantity = widget.initialQuantity;
  }

  void _increment() {
    setState(() {
      quantity++;
    });
    widget.onQuantityChanged(quantity);
  }

  void _decrement() {
    if (quantity > 1) {
      setState(() {
        quantity--;
      });
      widget.onQuantityChanged(quantity);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ElevatedButton(
            onPressed: _decrement,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xff8E6CEF),
              shape: const CircleBorder(),
              padding: EdgeInsets.zero, // 🔥 Removes button padding
              minimumSize: const Size(40, 40), // Ensures a fixed size
            ),
            child: const Icon(Icons.remove, color: Colors.white),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8), // Keeps some spacing for text
            child: Text(
              '$quantity',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          ElevatedButton(
            onPressed: _increment,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xff8E6CEF),
              shape: const CircleBorder(),
              padding: EdgeInsets.zero, // 🔥 Removes button padding
              minimumSize: const Size(40, 40), // Ensures a fixed size
            ),
            child: const Icon(Icons.add, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
