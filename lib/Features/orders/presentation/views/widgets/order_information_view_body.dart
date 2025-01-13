import 'package:colt_shop/Features/orders/presentation/views/widgets/shipping_details.dart';
import 'package:colt_shop/core/widgets/button_back_custom.dart';
import 'package:flutter/material.dart';
import 'order_items.dart';
import 'order_steps_list.dart';

class OrderInformationViewBody extends StatelessWidget {
  const OrderInformationViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ButtonBackCustom(),
              const Text(
                'Order #456765',
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
          const SizedBox(
            height: 42,
          ),
          const OrderStepsList(
            steps: [
              {'title': 'Delivered', 'date': '28 May', 'done': false},
              {'title': 'Shipped', 'date': '28 May', 'done': true},
              {'title': 'Order Confirmed', 'date': '28 May', 'done': true},
              {'title': 'Order Placed', 'date': '28 May', 'done': true},
            ],
          ),
          SizedBox(
            height: 42,
          ),
          Text(
            'Order Items',
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          SizedBox(
            height: 16,
          ),
          OrderItems(),
          const SizedBox(
            height: 40,
          ),
          Text('shipping details',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black)),
          SizedBox(
            height: 16,
          ),
          ShippingDetails(),
        ],
      ),
    );
  }
}
