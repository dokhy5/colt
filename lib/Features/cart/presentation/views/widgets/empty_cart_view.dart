
import 'package:colt_shop/core/utils/assets.dart';
import 'package:colt_shop/core/widgets/button_back_custom.dart';
import 'package:colt_shop/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class EmptyCartView extends StatelessWidget {
  const EmptyCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 40),
        Align(alignment: Alignment.topLeft, child: ButtonBackCustom()),
        const Spacer(),
        Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(AssetsData.cart, height: 100, width: 100),
              const SizedBox(height: 27),
              const Text(
                'Your Cart is Empty',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 27),
              CustomButton(onPressed: () {}, text: 'Explore Categories'),
            ],
          ),
        ),
        const Spacer(),
      ],
    );
  }
}

