import 'package:colt_shop/Features/address/presentation/views/widgets/address_view_body.dart';
import 'package:flutter/material.dart';

class AddressView extends StatelessWidget {
  const AddressView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SafeArea(child: AddressViewBody()),);
  }
}