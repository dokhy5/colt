import 'package:colt_shop/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TypeCategoryListViewItem extends StatefulWidget {
  const TypeCategoryListViewItem({super.key});

  @override
  _TypeCategoryListViewItemState createState() => _TypeCategoryListViewItemState();
}

class _TypeCategoryListViewItemState extends State<TypeCategoryListViewItem> {
  // Boolean variable to track whether the icon is pressed or not
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('object');
      },
      child: SizedBox(
        height: 250, // Fixed height for the item
        width: 150, // Fixed width for the item
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            color: Colors.grey[200],
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    SizedBox(
                      height: 180,
                      width: 150,
                      child: Image.asset(
                        AssetsData.test2,
                        height: 180,
                        width: 150,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Positioned(
                      top: 5,
                      right: 6,
                      child: IconButton(
                        icon: FaIcon(
                          isPressed
                              ? FontAwesomeIcons.solidHeart
                              : FontAwesomeIcons.heart,
                          color: isPressed ? Colors.red : Colors.black, // Change color when pressed
                        ),
                        onPressed: () {
                          setState(() {
                            // Toggle the icon state to change color and icon
                            isPressed = !isPressed;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Men\'s Harrington Jacket',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        '\$148.00',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

