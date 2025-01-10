import 'package:colt_shop/Features/home_page/presentation/views/widgets/category_two_listview.dart';
import 'package:colt_shop/Features/home_page/presentation/views/widgets/top_selling_item_listview.dart';
import 'package:colt_shop/core/utils/assets.dart';
import 'package:colt_shop/core/widgets/button_back_custom.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CategoriesItemViewBody extends StatelessWidget {
  const CategoriesItemViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 63,
          ),
          ButtonBackCustom(),
          SizedBox(
            height: 16,
          ),
          Text(
            'Hoodies',
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                ),
          ),
          SizedBox(
            height: 14,
            
          ),
          TypeCategoryListView(),
          
        ],
      ),
    );
  }
}



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

class TypeCategoryListView extends StatelessWidget {
  const TypeCategoryListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Two columns
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
          childAspectRatio: 0.58, 
        ),
        itemCount: 20,
        itemBuilder: (context, index) {
          return const TypeCategoryListViewItem(); // Using the renamed widget
        },
        padding:  EdgeInsets.zero,
      ),
    );
  }
}
