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
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Non-scrollable part
          const SizedBox(height: 63),
          const CustomAppbar(),
          const SizedBox(height: 24),
          const CustomSearchBar(),
          const SizedBox(height: 24),
      
          // Scrollable part
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      
                    ],
                  ),
                ),
                SliverToBoxAdapter(
                  child: CustomRowTextWidget(
                    text: 'Categories',
                    onTap: () {
                      print('Categories');
                    },
                    text2: 'See All',
                  ),
                ),
                SliverToBoxAdapter(
                  child: const SizedBox(height: 16.5),
                ),
                SliverToBoxAdapter(
                  child: const ListViewCategory(),
                ),
                SliverToBoxAdapter(
                  child: const SizedBox(height: 24),
                ),
                SliverToBoxAdapter(
                  child: CustomRowTextWidget(
                    text: 'Top Selling',
                    onTap: () {
                      print('Top Selling');
                    },
                    text2: 'See All',
                  ),
                ),
                SliverToBoxAdapter(
                  child: TopSellingListView(),
                ),
                SliverToBoxAdapter(
                  child: const SizedBox(height: 24),
                ),
                SliverToBoxAdapter(
                  child: CustomRowTextWidget(
                    text: 'New In',
                    onTap: () {
                      print('New Arrivals');
                    },
                    text2: 'See All',
                  ),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(height: 24,),
                ),
                  SliverToBoxAdapter(
                  child: TopSellingListView(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
