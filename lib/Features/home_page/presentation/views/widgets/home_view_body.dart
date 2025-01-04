import 'package:colt_shop/Features/home_page/presentation/views/widgets/custom_appbar.dart';
import 'package:colt_shop/Features/home_page/presentation/views/widgets/custom_row_text_widget.dart';
import 'package:colt_shop/Features/home_page/presentation/views/widgets/custom_search_bar.dart';
import 'package:colt_shop/Features/home_page/presentation/views/widgets/listview_category.dart';
import 'package:colt_shop/Features/home_page/presentation/views/widgets/top_selling_listview.dart';
import 'package:flutter/material.dart';


class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 63),
          const CustomAppbar(),
          const SizedBox(height: 24),
          const CustomSearchBar(),
          const SizedBox(height: 24),
          CustomRowTextWidget(
            text: 'Categories',
            onTap: () {
              print('Categories');
            },
            text2: 'See All',
          ),
          const SizedBox(height: 16.5),
          const ListViewCategory(),
          const SizedBox(height: 24),
          CustomRowTextWidget(
              text: 'Top Selling',
              onTap: () {
                print('Top Selling');
              },
              text2: 'See All'),
          TopSellingListView(),
        ],
      ),
    );
  }
}
