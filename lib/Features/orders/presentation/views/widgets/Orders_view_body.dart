import 'package:colt_shop/Features/orders/presentation/views/widgets/order_listview.dart';
import 'package:colt_shop/Features/orders/presentation/views/widgets/order_listview_item.dart';
import 'package:colt_shop/Features/orders/presentation/views/widgets/order_status_row.dart';
import 'package:colt_shop/core/utils/app_router.dart';
import 'package:colt_shop/core/utils/assets.dart';
import 'package:colt_shop/core/widgets/button_back_custom.dart';
import 'package:colt_shop/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class OrdersViewBody extends StatefulWidget {
  const OrdersViewBody({super.key});

  @override
  _OrdersViewBodyState createState() => _OrdersViewBodyState();
}

class _OrdersViewBodyState extends State<OrdersViewBody> {
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
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(
            height: 40,
          ),
          const ButtonBackCustom(),
          const SizedBox(
            height: 16,
          ),
          const Text(
            'Orders',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          // Add order status row and pass the callback function
          OrderStatusRow(onSelect: _onSelect), // Adjusted to pass callback
          const SizedBox(
            height: 20,
          ),
          // Add a scrollable content section with a properly constrained height
          Expanded(
            child: SingleChildScrollView(
              child: _buildStatusContent(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusContent() {
    switch (_selected) {
      case 'Processing':
        return const OrderListview(); // Content for Processing
      case 'Shipped':
        return const OrderListviewItem(); // Content for Shipped
      case 'Delivered':
        return const OrderListview(); // Content for Delivered
      case 'Returned':
        return const OrderListviewItem(); // Content for Returned
      case 'Canceled':
        return const OrderListviewItem(); // Content for Canceled
      default:
        return const SizedBox(); // Empty container for default case
    }
  }
}
