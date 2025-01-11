import 'package:flutter/material.dart';
import 'package:colt_shop/Features/orders/presentation/views/widgets/custom_order_button.dart';
import 'package:colt_shop/Features/orders/presentation/views/widgets/order_listview.dart';
import 'package:colt_shop/Features/orders/presentation/views/widgets/order_listview_item.dart';

class OrderStatusRow extends StatefulWidget {
  final void Function(String) onSelect; // Callback to pass status selection

  // Constructor to receive the callback
  const OrderStatusRow({super.key, required this.onSelect});

  @override
  _OrderStatusRowState createState() => _OrderStatusRowState();
}

class _OrderStatusRowState extends State<OrderStatusRow> {
  String _selected = 'Processing'; // Default selected status

  final List<String> orderStatuses = [
    'Processing',
    'Shipped',
    'Delivered',
    'Returned',
    'Canceled',
  ];

  void _onSelect(String status) {
    setState(() {
      _selected = status; // Update selected status
    });
    widget.onSelect(status); // Notify parent widget of status change
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal, // Scrollable Row
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: orderStatuses.map((status) {
          return CustomOrderButton(
            text: status,
            isSelected: _selected == status,
            onPressed: () => _onSelect(status),
          );
        }).toList(),
      ),
    );
  }
}
