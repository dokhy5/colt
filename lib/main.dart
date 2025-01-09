
import 'package:colt_shop/constants.dart';
import 'package:colt_shop/core/utils/app_router.dart';
import 'package:colt_shop/core/widgets/test.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false,
      
    );
    // return MaterialApp(
    //   title: 'Colt Shop',
    //   theme: ThemeData(
    //     primarySwatch: Colors.blue,
    //     visualDensity: VisualDensity.adaptivePlatformDensity,
    //   ),
    //   home: const Scaffold(
    //     body: SafeArea(
    //       child: BottomNavDashboard(),
    //     ),
    //   ),
    // );
  }
}