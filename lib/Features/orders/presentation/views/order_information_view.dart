import 'package:colt_shop/Features/orders/presentation/views/widgets/order_information_view_body.dart';
import 'package:flutter/material.dart';

class OrderInformationView extends StatelessWidget {
  const OrderInformationView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: OrderInformationViewBody(),
      ),
    );
  }
}