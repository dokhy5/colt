import 'package:colt_shop/Features/Splash/presentation/views/splash_view.dart';
import 'package:colt_shop/Features/home_page/presentation/views/home_view.dart';
import 'package:colt_shop/Features/sign_in/presentation/views/signin_view.dart';
import 'package:colt_shop/Features/sign_up/presentation/views/forgot_password_view.dart';
import 'package:colt_shop/Features/sign_up/presentation/views/onboarding_view.dart';
import 'package:colt_shop/Features/sign_up/presentation/views/send_password_view.dart';
import 'package:colt_shop/Features/sign_up/presentation/views/signup_view.dart';
import 'package:colt_shop/core/widgets/test.dart';
import 'package:go_router/go_router.dart';


abstract class AppRouter {
  static const kSignIn = '/signin_View';
  static const kSignUp = '/SignupView';
  static const kForgetPass = '/ForgotpasswordView';
  static const ksendpass = '/Sendpassword_View';
  static const kOnboarding = '/OnboardingView';
  static const kHome = '/HomeView';
  static const kTest = '/test';

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
       GoRoute(
        path: ksendpass,
        builder: (context, state) => const SendPasswordView(),
      ),
       GoRoute(
        path: kOnboarding,
        builder: (context, state) => const OnboardingView(),
      ),
       GoRoute(
        path: kHome,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: kTest, // مسار شاشة الـ BottomNavDashboard
        builder: (context, state) {
          return const BottomNavDashboard();
        },
      )

    ],
  );
}
