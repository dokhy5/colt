import 'package:flutter/material.dart';

import 'widgets/categories_item_view_body.dart';

class CategoriesItemView extends StatelessWidget {
  const CategoriesItemView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: CategoriesItemViewBody()),
    );
  }
}