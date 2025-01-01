import 'package:flutter/material.dart';

class TextFieldRegister extends StatelessWidget {
  final String labelText;
  final String hintText;

  const TextFieldRegister({
    super.key,
    required this.labelText,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        border:const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide.none),
        filled: true,
        fillColor: Colors.grey[200], // Optional: Adds a background color
      ),
    );
  }
}
