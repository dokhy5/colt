import 'package:flutter/material.dart';

class CustomOrderButton extends StatelessWidget {
  const CustomOrderButton({
    super.key,
    required this.onPressed,
    required this.text,
    required this.isSelected,
  });

  final VoidCallback onPressed;
  final String text;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 4.0),
      child: Container(
        constraints: BoxConstraints(
            minWidth: 50.0, maxHeight: 35.0), // Minimum size // Add padding
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: isSelected
              ? Colors.deepPurpleAccent
              : Colors.grey[200], // Highlight if selected
        ),
        child: TextButton(
          onPressed: onPressed,
          child: Text(
            text,
            style: TextStyle(
              fontSize: 12,
              color: isSelected
                  ? Colors.white
                  : Colors.black, // Adjust text color based on selection
            ),
          ),
        ),
      ),
    );
  }
}
