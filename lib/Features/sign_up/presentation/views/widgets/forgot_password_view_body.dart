import 'package:colt_shop/core/utils/app_router.dart';
import 'package:colt_shop/core/widgets/button_back_custom.dart';
import 'package:colt_shop/core/widgets/custom_button.dart';
import 'package:colt_shop/core/widgets/text_field_register.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class ForgotPasswordViewBody extends StatelessWidget {
  const ForgotPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 63),
          const ButtonBackCustom(),
          const SizedBox(height: 20),
          const Text(
            'Forgot Password',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          const TextFieldRegister(
            labelText: 'Email',
            hintText: 'Email Address',
          ),
          const SizedBox(height: 40),
          CustomButton(onPressed: () {
            GoRouter.of(context).push(AppRouter.ksendpass);
          }, text: 'Continue'),
          
         
        ],
      ),
    );
  }
}