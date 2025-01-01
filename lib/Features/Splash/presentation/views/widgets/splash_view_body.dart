
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shop/Features/Splash/presentation/views/widgets/sliding_text.dart';
import 'package:shop/constants.dart';
import 'package:shop/core/utils/app_router.dart';
import 'package:shop/core/utils/assets.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slaidingAnimatin;
  @override
  void initState() {
    super.initState();
    initslidinganimation();
    navigateToHome();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kSecondaryColor,
      child: Column(
        
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.100,
            width: MediaQuery.of(context).size.width * 0.2,
            child: Image.asset(
              AssetsData.logo,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Slidingtext(slaidingAnimatin: slaidingAnimatin),
        ],
      ),
    );
  }

  void initslidinganimation() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    slaidingAnimatin =
        Tween<Offset>(begin: const Offset(0.0, 20), end: Offset.zero)
            .animate(animationController);
    animationController.forward();
  }

  void navigateToHome() {
    Future.delayed(const Duration(seconds: 3), () {
      // ignore: use_build_context_synchronously
      GoRouter.of(context).push(AppRouter.kSignIn);
    });
  }
}
