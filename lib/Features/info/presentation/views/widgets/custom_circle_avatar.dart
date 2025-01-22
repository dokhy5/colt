import 'package:colt_shop/Features/info/presentation/views/widgets/change_image_bottom_sheet.dart';
import 'package:colt_shop/core/utils/assets.dart';
import 'package:flutter/material.dart';

class CustomCircleAvatar extends StatelessWidget {
  const CustomCircleAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (context) => const ChangeImageBottomSheet(),
        );
      },
      child: CircleAvatar(
        radius: 50, // حجم الدائرة
        child: ClipOval(
          child: Image.asset(
            AssetsData.test,
            fit: BoxFit.fill,
            width: 100,
            height: 100,
          ),
        ),
      ),
    );
  }
}
