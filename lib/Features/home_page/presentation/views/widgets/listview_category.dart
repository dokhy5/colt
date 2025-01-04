import 'package:colt_shop/Features/home_page/presentation/views/widgets/listview_category_item.dart';
import 'package:flutter/material.dart';

class ListViewCategory extends StatelessWidget {
  const ListViewCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      
        child:ListView.builder(
          
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {

            return ListViewCategoryItem();
          },
          padding: const EdgeInsets.all(0.0),
        ),
    );
    
    
  }
}