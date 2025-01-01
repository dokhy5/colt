import 'package:colt_shop/Features/sign_up/presentation/views/widgets/send_password_view_bady.dart';
import 'package:flutter/material.dart';

class SendPasswordView extends StatelessWidget {
  const SendPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SafeArea(child: SendPasswordViewBady()));
  }
}