import 'package:colt_shop/Features/info/presentation/views/widgets/custom_circle_avatar.dart';
import 'package:flutter/material.dart';

class InfoViewBody extends StatelessWidget {
  const InfoViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
           SizedBox(
            height: 40,
          ),
          CustomCircleAvatar()
          ]
      ),
    );
  }
}