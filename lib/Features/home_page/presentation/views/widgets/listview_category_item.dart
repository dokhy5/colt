import 'package:flutter/material.dart';

import '../../../../../core/utils/assets.dart';

class ListViewCategoryItem extends StatelessWidget {
  const ListViewCategoryItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Define your action here
      },
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
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
          const SizedBox(height: 5),
          const Text('Hoodies', style: TextStyle(fontSize: 12, color: Colors.black)),
        ],
      ),
    );
  }
}
