import 'package:colt_shop/Features/sign_up/presentation/views/widgets/forgot_password_view_body.dart';
import 'package:flutter/material.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body:SafeArea(child:  ForgotPasswordViewBody()));
  }
}