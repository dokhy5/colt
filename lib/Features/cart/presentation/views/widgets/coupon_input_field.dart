
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CouponInputField extends StatelessWidget {
  const CouponInputField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.discount, color: Colors.green),
        hintStyle: TextStyle(color: Colors.grey),
        hintText: 'Enter Coupon Code',
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide.none,
        ),
        suffixIcon: Padding(
          padding: const EdgeInsets.only(right: 10),
          child: CircleAvatar(
            backgroundColor: Color(0xff8E6CEF),
            child: IconButton(
              icon: const FaIcon(FontAwesomeIcons.chevronRight,
                  size: 20, color: Colors.white),
              onPressed: () {},
            ),
          ),
        ),
        filled: true,
        fillColor: Colors.grey[200],
      ),
    );
  }
}