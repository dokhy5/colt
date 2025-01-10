
import 'package:colt_shop/Features/home_page/presentation/views/widgets/category_two_listview_item.dart';
import 'package:flutter/material.dart';

class CategoryTwoListView extends StatelessWidget {
  const CategoryTwoListView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Expanded( // Ensures the ListView gets proper constraints
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 20, // Update dynamically if needed
        itemBuilder: (context, index) {
          return const CategoryTwoListViewItem(); // Your item widget
        },
        padding: EdgeInsets.zero,
      ),
    );
  }
}
