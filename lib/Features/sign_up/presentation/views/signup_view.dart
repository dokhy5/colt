import 'package:flutter/material.dart';
import 'package:shop/Features/sign_up/presentation/views/widgets/signup_view_body.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SafeArea(child: SignupViewBody()));
  }
  }