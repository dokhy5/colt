import 'package:colt_shop/Features/info/presentation/views/widgets/custom_circle_avatar.dart';
import 'package:colt_shop/Features/info/presentation/views/widgets/info_me.dart';
import 'package:colt_shop/Features/info/presentation/views/widgets/menu_for_me.dart';
import 'package:flutter/material.dart';

class InfoViewBody extends StatelessWidget {
  const InfoViewBody({super.key});

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
            const CustomCircleAvatar(),
            const SizedBox(
              height: 32),
            const InfoMe(),
            const SizedBox(
              height: 26,
            ),
            const MenuForMe(),
            const SizedBox(
              height: 30,
            ),
            TextButton(
              onPressed: () {
                print('object');
              },
              style: ButtonStyle(
                overlayColor: WidgetStateProperty.all(Colors.transparent), // Removes the click effect
              ),
              child: const Text(
                'Sign Out',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
            ),
          ]),
    );
  }
}
