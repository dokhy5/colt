import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return  TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
        fixedSize: const Size(double.infinity, 40),
        backgroundColor: Colors.grey[200],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        minimumSize: Size.zero, // Ensures no minimum size
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ), child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const FaIcon(FontAwesomeIcons.magnifyingGlass,
                color: Colors.black,
                size: 16,
                ),
          SizedBox(width: 12,),
          Text(
            'Search', // Using the passed text
            style:const TextStyle(fontSize: 12, color: Colors.black),
          ),
        ],
      ),
    );
  }
}