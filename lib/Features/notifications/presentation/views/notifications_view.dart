import 'package:colt_shop/Features/notifications/presentation/views/widgets/notifications_view_body.dart';
import 'package:flutter/material.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: NotificationsViewBody(),
      ),
    );
  }
}
