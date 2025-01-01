import 'package:go_router/go_router.dart';
import 'package:shop/Features/Splash/presentation/views/splash_view.dart';
import 'package:shop/Features/sign_in/presentation/views/signin_view.dart';
import 'package:shop/Features/sign_up/presentation/views/forgot_password_view.dart';
import 'package:shop/Features/sign_up/presentation/views/signup_view.dart';

abstract class AppRouter {
  static const kSignIn = '/signin_View';
  static const kSignUp = '/SignupView';
  static const kForgetPass = '/ForgotpasswordView';

  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kSignIn,
        builder: (context, state) => const SigninView(),
      ),
      GoRoute(
        path: kSignUp,
        builder: (context, state) => const SignupView(),
      ),
      GoRoute(
        path: kForgetPass,
        builder: (context, state) => const ForgotPasswordView(),
      ),
    ],
  );
}
