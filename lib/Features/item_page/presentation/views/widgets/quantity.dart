import 'package:colt_shop/Features/item_page/presentation/views/widgets/quantity_selector.dart';
import 'package:flutter/material.dart';

class Quantity extends StatefulWidget {
  final Function(int) onQuantityChanged;

  const Quantity({super.key, required this.onQuantityChanged});

  @override
  State<Quantity> createState() => _QuantityState();
}

class _QuantityState extends State<Quantity> {
  int _quantity = 1;

  void _updateQuantity(int newQuantity) {
    setState(() {
      _quantity = newQuantity;
    });
    widget.onQuantityChanged(newQuantity);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      height: 60,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Quantity',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          Row(
            children: [
              QuantitySelector(
                initialQuantity: _quantity,
                onQuantityChanged: _updateQuantity,
              ),
              const SizedBox(width: 10),
              
              
            ],
          ),
        ],
      ),
    );
  }
}
