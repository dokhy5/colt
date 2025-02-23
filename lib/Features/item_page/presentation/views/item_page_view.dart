import 'package:colt_shop/Features/item_page/presentation/views/widgets/item_page_view_body.dart';
import 'package:flutter/material.dart';

class ItemPageView extends StatelessWidget {
  const ItemPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SafeArea(child: ItemPageViewBody()),);
  }
}