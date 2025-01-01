// ignore: file_names
import 'package:flutter/material.dart';
class CustomSignInButtonMethods extends StatelessWidget {
  const CustomSignInButtonMethods({super.key, required this.text, required this.icon});

  final String text;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
        fixedSize: const Size(double.infinity, 50),
        backgroundColor: Colors.grey[200],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        minimumSize: Size.zero, // Ensures no minimum size
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            icon, // Using the passed icon path
            width: 25,
            height: 29.56,
          ),
          const Spacer(),
          Text(
            text, // Using the passed text
            style:const TextStyle(fontSize: 16, color: Colors.black),

          ),
         const Spacer()
        ],
      ),
    );
  }
}
