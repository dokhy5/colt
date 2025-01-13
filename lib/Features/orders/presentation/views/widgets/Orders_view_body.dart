import 'package:colt_shop/Features/orders/presentation/views/widgets/order_listview.dart';
import 'package:colt_shop/Features/orders/presentation/views/widgets/order_listview_item.dart';
import 'package:colt_shop/Features/orders/presentation/views/widgets/order_status_row.dart';
import 'package:flutter/material.dart';
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
          
          const Text(
            'Orders',
            textAlign: TextAlign.center,
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
            height: 24,
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
