
import 'package:flutter/material.dart';

class OrderStepItem extends StatelessWidget {
  final String title;
  final String date;
  final bool isDone;

  const OrderStepItem({
    super.key,
    required this.title,
    required this.date,
    required this.isDone,
  });

  @override
  Widget build(BuildContext context) {
    final textColor = isDone ? Colors.black : Colors.grey;

    return Row(
      children: [
        CircleAvatar(
          radius: 10,
          backgroundColor: isDone ? Colors.deepPurpleAccent : Colors.grey,
          child: const Icon(
            Icons.check,
            size: 12,
            color: Colors.white,
          ),
        ),
        const SizedBox(width: 12),
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            color: textColor,
          ),
        ),
        const Spacer(),
        Text(
          date,
          style: TextStyle(
            fontSize: 12,
            color: textColor,
          ),
        ),
      ],
    );
  }
}
