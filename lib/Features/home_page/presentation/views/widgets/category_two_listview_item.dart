import 'package:colt_shop/core/utils/app_router.dart';
import 'package:colt_shop/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CategoryTwoListViewItem extends StatelessWidget {
  const CategoryTwoListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
         GoRouter.of(context).push(AppRouter.kCategoriesItem);
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 4.0,top: 4),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            height: 72,
            width: 342,
            color: Colors.grey[200],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Avatar Section
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SizedBox(
                    height: 75,
                    width: 52,
                    child: CircleAvatar(
                      backgroundColor: Colors.grey[200],
                      radius: 100,
                      child: Image.asset(AssetsData.test),
                    ),
                  ),
                ),
                const SizedBox(width: 4),
                // Text Section
                const Text(
                  'Hoodies',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
                const SizedBox(width: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}