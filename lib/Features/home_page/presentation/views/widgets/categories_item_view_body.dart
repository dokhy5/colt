import 'package:colt_shop/Features/home_page/presentation/views/widgets/type_category_listview.dart';
import 'package:colt_shop/core/widgets/button_back_custom.dart';
import 'package:flutter/material.dart';

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
                fontSize: 16,
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



