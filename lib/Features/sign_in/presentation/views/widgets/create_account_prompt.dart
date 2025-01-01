import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shop/core/utils/app_router.dart';

class CreateAccountPrompt extends StatelessWidget {
  const CreateAccountPrompt({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          'Dont have an Account ? ',
          style: TextStyle(fontSize: 12, color: Colors.grey),
        ),
        const SizedBox(width: 8),
        TextButton(
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            minimumSize: Size.zero, // Ensures no minimum size
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          onPressed: () {
            GoRouter.of(context).push(AppRouter.kSignUp);
            },
          child: const Text(
            'Create Account',
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
