import 'package:colt_shop/Features/sign_up/presentation/views/widgets/custom_Sslect_sex.dart';
import 'package:flutter/material.dart';

class SelectSexScreen extends StatefulWidget {
  const SelectSexScreen({super.key});

  @override
  _SelectSexScreenState createState() => _SelectSexScreenState();
}

class _SelectSexScreenState extends State<SelectSexScreen> {
  String? _selectedSex; // Holds the currently selected sex

  void _onSelect(String sex) {
    setState(() {
      _selectedSex = sex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomSelectSex(
          text: 'Male',
          isSelected: _selectedSex == 'Male',
          onPressed: () => _onSelect('Male'),
        ),
        const SizedBox(width: 20),
        CustomSelectSex(
          text: 'Female',
          isSelected: _selectedSex == 'Female',
          onPressed: () => _onSelect('Female'),
        ),
      ],
    );
  }
}



