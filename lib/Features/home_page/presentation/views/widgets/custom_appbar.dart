import 'package:colt_shop/core/utils/app_router.dart';
import 'package:colt_shop/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {},
          child: SizedBox(
            width: 40,
            height: 40,
            child: CircleAvatar(
              backgroundImage: AssetImage(AssetsData.test),
              backgroundColor: Colors.grey[200],
              radius: 100,
            )
          
          ),
        ),
        GestureDetector(
          onTap: () {
            AppRouter.router.push(AppRouter.kCart);
          },

          child: const SizedBox(
            
            width: 40,
            height: 40,
            child: CircleAvatar(
              backgroundColor: Colors.deepPurpleAccent,
              radius: 100,
              child: FaIcon(FontAwesomeIcons.bagShopping,
                color: Colors.white,
                size: 16,
                ),
            ),
          ),
              ),
              
           
        
      ],
    );
  }
}