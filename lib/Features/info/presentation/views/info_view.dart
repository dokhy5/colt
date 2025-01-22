import 'package:colt_shop/Features/info/presentation/views/widgets/info_view_body.dart';
import 'package:flutter/material.dart';

class InfoView extends StatelessWidget {
  const InfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SafeArea(child:InfoViewBody() ),);
  }
}