import 'package:colt_shop/Features/cart/presentation/views/widgets/successfully_view_body.dart';
import 'package:flutter/material.dart';

class SuccessfullyView extends StatelessWidget {
  const SuccessfullyView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: SuccessfullyViewBody()),
    );
  }
}