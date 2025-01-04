import 'package:colt_shop/Features/home_page/presentation/views/widgets/top_selling_item_listview.dart';
import 'package:flutter/material.dart';

class TopSellingListView extends StatelessWidget {
  const TopSellingListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 260,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return TopSellingItemListView(); // Using the renamed widget
        },
        padding: const EdgeInsets.all(0.0),
      ),
    );
  }
}
