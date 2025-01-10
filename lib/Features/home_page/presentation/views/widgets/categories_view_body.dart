import 'package:colt_shop/Features/home_page/presentation/views/widgets/category_two_listview.dart';
import 'package:colt_shop/core/widgets/button_back_custom.dart';
import 'package:flutter/material.dart';

class CategoriesViewBody extends StatelessWidget {
  const CategoriesViewBody({super.key});

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
            'Shop by Categories',
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                ),
          ),
          SizedBox(
            height: 14,
            
          ),
          CategoryTwoListView(),
        ],
      ),
    );
  }
}


