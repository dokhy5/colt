import 'package:flutter/material.dart';

import 'order_step_item.dart';

class OrderStepsList extends StatelessWidget {
  final List<Map<String, dynamic>> steps;

  const OrderStepsList({super.key, required this.steps});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: steps.asMap().entries.map((entry) {
        final index = entry.key;
        final step = entry.value;
        return Column(
          children: [
            OrderStepItem(
              title: step['title'] as String,
              date: step['date'] as String,
              isDone: step['done'] as bool,
            ),
            if (index < steps.length - 1) const SizedBox(height: 51),
          ],
        );
      }).toList(),
    );
  }
}
