import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class SelectBirthData extends StatefulWidget {
  const SelectBirthData({super.key});

  @override
  State<SelectBirthData> createState() => _SelectBirthDataState();
}

class _SelectBirthDataState extends State<SelectBirthData> {
  final List<int> items = List.generate(100, (index) => index + 1); // Generates numbers from 1 to 100
  int? selectedValue;

  @override
  Widget build(BuildContext context) {
    // Create a list of DropdownMenuItems using a for loop
    List<DropdownMenuItem<int>> dropdownItems = [];
    for (int item in items) {
      dropdownItems.add(
        DropdownMenuItem<int>(
          value: item,
          child: Text(
            '$item', // Display number as text
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      );
    }

    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: 500, // Ensures the dropdown has a maximum width
          maxHeight: 60, // Limits the dropdown button height
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton2<int>(
            isExpanded: true,
            hint: const Row(
              children: [
                SizedBox(width: 4),
                Expanded(
                  child: Text(
                    'Select Item',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            items: dropdownItems,
            value: selectedValue,
            onChanged: (int? value) {
              setState(() {
                selectedValue = value;
              });
            },
            buttonStyleData: ButtonStyleData(
              height: 50,
              width: 400, // Explicitly set the width
              padding: const EdgeInsets.symmetric(horizontal: 14),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.grey[200],
              ),
            ),
            iconStyleData: const IconStyleData(
              icon: Icon(
                Icons.arrow_forward_ios_outlined,
              ),
              iconSize: 14,
              iconEnabledColor: Colors.black,
              iconDisabledColor: Colors.grey,
            ),
            dropdownStyleData: DropdownStyleData(
              maxHeight: 300,
              width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: Colors.grey[200],
              ),
              offset: const Offset(5, 0),
              scrollbarTheme: ScrollbarThemeData(
                radius: const Radius.circular(100),
                thickness: MaterialStateProperty.all<double>(6),
                thumbVisibility: MaterialStateProperty.all<bool>(true),
              ),
            ),
            menuItemStyleData: const MenuItemStyleData(
              height: 40,
              padding: EdgeInsets.symmetric(horizontal: 14),
            ),
          ),
        ),
      ),
    );
  }
}
