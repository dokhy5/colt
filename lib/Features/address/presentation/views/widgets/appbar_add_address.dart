import 'package:colt_shop/core/widgets/button_back_custom.dart';
import 'package:flutter/material.dart';

class AppbarAddAddress extends StatelessWidget {
  const AppbarAddAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return const                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                       ButtonBackCustom(),
                       Text(
                        'Add Address',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                       SizedBox(width: 48),
                    ],
                  );
  }
}