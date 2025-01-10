import 'package:colt_shop/Features/home_page/presentation/views/widgets/type_category_listviewi_tem.dart';
import 'package:flutter/material.dart';

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
