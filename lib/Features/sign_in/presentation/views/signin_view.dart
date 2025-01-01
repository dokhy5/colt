import 'package:colt_shop/Features/sign_in/presentation/views/widgets/signin_view_body.dart';
import 'package:flutter/material.dart';

class SigninView extends StatelessWidget {
  const SigninView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: SigninViewBody()),
    );
  }
}