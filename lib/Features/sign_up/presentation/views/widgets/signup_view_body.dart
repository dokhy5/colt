import 'package:colt_shop/Features/sign_up/presentation/views/widgets/reset_prompt.dart';
import 'package:colt_shop/core/utils/app_router.dart';
import 'package:colt_shop/core/widgets/button_back_custom.dart';
import 'package:colt_shop/core/widgets/custom_button.dart';
import 'package:colt_shop/core/widgets/text_field_register.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class SignupViewBody extends StatelessWidget {
  const SignupViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
    padding: const EdgeInsets.symmetric(horizontal: 24.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 63),
        const ButtonBackCustom(),
        const SizedBox(height: 20),
        const Text(
          'Create Account',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 32),
        const TextFieldRegister(
          labelText: 'Firstname',
          hintText: 'Firstname',
        ),
        const SizedBox(height: 16),
        const TextFieldRegister(
          labelText: 'Lastname',
          hintText: 'Lastname',
        ),
        const SizedBox(height: 16),
        const TextFieldRegister(
          labelText: 'Email',
          hintText: 'Email Address',
        ),
        const SizedBox(height: 16),
        const TextFieldRegister(
          labelText: 'Password',
          hintText: 'Password',
        ),
        const SizedBox(height: 40),

        CustomButton(onPressed: () {
           GoRouter.of(context).push(AppRouter.kOnboarding);
        }, text: 'Continue'),
        const SizedBox(height: 40),
        const ResetPrompt()
      ],
    ),
  );
}
}
