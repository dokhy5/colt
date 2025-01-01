import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class CustomSelectSex extends StatelessWidget {
  const CustomSelectSex({
    super.key,
    required this.text,
    required this.isSelected,
    required this.onPressed,
  });

  final String text;
  final bool isSelected;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 146, // Adjust width as needed
      height: 50,  // Adjust height as needed
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: isSelected ? Colors.deepPurpleAccent : Colors.grey[200], // Background changes on selection
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100), // Rounded corners
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 16,
            color: isSelected ? Colors.white : Colors.black, // Text color changes on selection
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
