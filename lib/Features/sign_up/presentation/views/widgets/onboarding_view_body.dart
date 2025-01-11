import 'package:colt_shop/Features/sign_up/presentation/views/widgets/custom_Sslect_sex.dart';
import 'package:colt_shop/Features/sign_up/presentation/views/widgets/select_birthdata.dart';
import 'package:colt_shop/Features/sign_up/presentation/views/widgets/select_sex_screen.dart';
import 'package:colt_shop/core/widgets/custom_button.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class OnboardingViewBody extends StatelessWidget {
  const OnboardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 161),
          const Text('Tell us About yourself', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
                const    SizedBox(height: 46),
                const    Text('Who do you shop for ?', style: TextStyle(fontSize: 16, ),),
         const  SizedBox(height: 22),
          SelectSexScreen(),
          const SizedBox(height: 56),
          const Text('How Old are you ?', style: TextStyle(fontSize: 16, ),),
         const SizedBox(height: 13),
         const SelectBirthData(),
         SizedBox(height: 200),
          CustomButton(onPressed: (){},text: 'Finish'),

        ]

      ),
    );
  }
}





