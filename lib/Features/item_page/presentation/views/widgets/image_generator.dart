
import 'package:colt_shop/core/utils/assets.dart';
import 'package:flutter/material.dart';

class ImageGenerator extends StatelessWidget {
  const ImageGenerator({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200, // Adjust height as needed
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5, // Number of images
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                AssetsData.test2, // Replace with actual image URLs
                width: 150, // Adjust width as needed
                height: 200,
                fit: BoxFit.cover,
  
              ),              
            ),
          );
        },
      ),
    );
  }
}