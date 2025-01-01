import 'package:flutter/material.dart';
import 'package:shop/Features/sign_in/presentation/views/widgets/create_account_prompt.dart';
import 'package:shop/Features/sign_in/presentation/views/widgets/custom_Signin_button_methods.dart';
import 'package:shop/core/utils/assets.dart';
import 'package:shop/core/widgets/custom_button.dart';
import 'package:shop/core/widgets/text_field_register.dart';

class SigninViewBody extends StatelessWidget {
  const SigninViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 123), // Adds spacing between fields
          const Text(
            'Sign In',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 32), // Adds spacing between fields
          const TextFieldRegister(
            labelText: 'Email',
            hintText: 'Email Address',

          ),
          const SizedBox(height: 16), // Adds spacing between fields
          const TextFieldRegister(
            labelText: 'Password',
            hintText: 'Password',
           
          ),
          const SizedBox(height: 16),
          CustomButton(
            text: 'Sign In',
            onPressed: () {},
          ),
          SizedBox(height: 16,),
                    const CreateAccountPrompt(),

         const  SizedBox(height: 71,),
          const CustomSignInButtonMethods(text: 'Continue With Apple', icon: AssetsData.apple),
          const SizedBox(height: 12),
          const CustomSignInButtonMethods(text: 'Continue With Google', icon: AssetsData.google),
          const SizedBox(height: 12),
          const CustomSignInButtonMethods(text: 'Continue With Facebook', icon: AssetsData.face),
          // const SizedBox(height: 95.66666666666667),
        ],
      ),
    );
  }
}