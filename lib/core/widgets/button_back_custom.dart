import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonBackCustom extends StatelessWidget {
  const ButtonBackCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
  alignment: Alignment.centerLeft, // Aligns the widget to the left
  child: GestureDetector(
    onTap: () {
      GoRouter.of(context).pop();
    },
    child: CircleAvatar(
      radius: 25, // Adjust the radius for the circle size
      backgroundColor: Colors.grey[200], // Circle background color
      child: const Icon(
        Icons.arrow_back,
        size: 24, // Icon size
        color: Colors.black, // Icon color
      ),
    ),
  ),
);
  }
}
