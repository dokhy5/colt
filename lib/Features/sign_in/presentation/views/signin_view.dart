import 'package:flutter/material.dart';
import 'package:shop/Features/sign_in/presentation/views/widgets/signin_view_body.dart';

class SigninView extends StatelessWidget {
  const SigninView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: SigninViewBody()),
    );
  }
}