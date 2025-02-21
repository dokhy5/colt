import 'package:colt_shop/Features/address/presentation/views/widgets/add_address_view_body.dart';
import 'package:flutter/material.dart';

class AddAddressView extends StatelessWidget {
  const AddAddressView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: AddAddressViewBody()),
    );
  }
}