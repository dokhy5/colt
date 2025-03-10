import 'package:colt_shop/core/utils/app_router.dart';
import 'package:colt_shop/core/utils/assets.dart';
import 'package:colt_shop/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SuccessfullyViewBody extends StatelessWidget {
  const SuccessfullyViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff8E6CEF), 

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 80),
          Center(
            child: Image.asset(
              AssetsData.kSuccessfully, 
              height: 250,
            ),
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Order Placed\nSuccessfully',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 25),
                const Text(
                  'You will receive an email confirmation',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                const SizedBox(height: 90),
                SizedBox(
                  width: double.infinity,
                  child:
                  CustomButton(onPressed: (){
                    GoRouter.of(context).push(AppRouter.kOrderInformation);
                  }, 
                  text: 'See Order details')

                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
