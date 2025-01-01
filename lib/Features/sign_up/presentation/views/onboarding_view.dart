import 'package:colt_shop/Features/sign_up/presentation/views/widgets/onboarding_view_body.dart';
import 'package:flutter/material.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SafeArea(child: OnboardingViewBody()));
  }
}