import 'package:colt_shop/Features/notifications/presentation/views/widgets/notification_listview_item.dart';
import 'package:flutter/material.dart';

class NotificationListview extends StatelessWidget {
  const NotificationListview({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 1000,
      child: ListView.builder(
        itemCount: 20, // Number of items in the list
        padding: const EdgeInsets.symmetric(vertical: 4.0), // Optional padding for the list
        itemBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: 4.0), // Spacing between items
            child: NotificationListviewItem(), // Reusable notification item
          );
        },
      ),
    );
  }
}
