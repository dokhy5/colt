import 'package:colt_shop/constants.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.onPressed, required this.text});
  final String text;
final VoidCallback  onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: kSecondaryColor,
          shape: RoundedRectangleBorder(  
            borderRadius: BorderRadius.circular(30), 
             
          ),  
        ),
        child:  Text(
          text,
          style:const TextStyle(fontSize: 16, color: Colors.white),
        ),
      ),
    );
  }
}