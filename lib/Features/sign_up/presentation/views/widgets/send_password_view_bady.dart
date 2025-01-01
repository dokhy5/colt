import 'package:colt_shop/core/utils/app_router.dart';
import 'package:colt_shop/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SendPasswordViewBady extends StatelessWidget {
  const SendPasswordViewBady({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Center(  // Centers everything inside this widget
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start, // Centers content vertically
          crossAxisAlignment: CrossAxisAlignment.center, // Centers content horizontally
          children: [
            const SizedBox(height: 292),  // Adjust this height if necessary
            const Image(
              image: AssetImage('assets/images/image.png'),
              width: 100,
              height: 100,
            ),
            const SizedBox(height: 24),
            const Text(
              'We Sent you an Email to reset your password.',
              textAlign: TextAlign.center,  // Centers the text within the widget
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 24 ),
            CustomButton(onPressed: (){GoRouter.of(context).push(AppRouter.kSignIn);},
             text: 'Return to Login')
          ],
        ),
      ),
    );
  }
}
