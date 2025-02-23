
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SelectAttribute extends StatefulWidget {
  final String label;
  final List<Map<String, dynamic>> items;
  final dynamic initialValue;
  final bool isColorPicker;

  const SelectAttribute({
    super.key,
    required this.label,
    required this.items,
    this.initialValue,
    this.isColorPicker = false,
  });

  @override
  State<SelectAttribute> createState() => _SelectAttributeState();
}

class _SelectAttributeState extends State<SelectAttribute> {
  dynamic selectedValue;

  @override
  void initState() {
    super.initState();
    
    // ✅ Extract valid values from the items list
    final validValues = widget.items.map((item) => item['value']).toSet();

    // ✅ Ensure initialValue is valid
    selectedValue = (widget.initialValue != null && validValues.contains(widget.initialValue))
        ? widget.initialValue
        : validValues.isNotEmpty
            ? validValues.first
            : null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      height: 60,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.label,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          DropdownButtonHideUnderline(
            child: DropdownButton2<dynamic>(
              isExpanded: false,
              value: selectedValue, // ✅ Ensured it exists
              onChanged: (dynamic value) {
                setState(() {
                  selectedValue = value;
                });
              },
              items: _getUniqueDropdownItems(), // ✅ Ensuring unique items
              buttonStyleData: const ButtonStyleData(
                height: 50,
                padding: EdgeInsets.symmetric(horizontal: 12),
              ),
              iconStyleData: const IconStyleData(
                icon: FaIcon(FontAwesomeIcons.arrowDown, size: 20),
                iconEnabledColor: Colors.black,
              ),
              dropdownStyleData: DropdownStyleData(
                maxHeight: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// ✅ Remove duplicate values
  List<DropdownMenuItem<dynamic>> _getUniqueDropdownItems() {
    final uniqueValues = <dynamic>{}; // Store unique values
    return widget.items
        .where((item) => uniqueValues.add(item['value'])) // ✅ Remove duplicates
        .map((item) {
      return DropdownMenuItem<dynamic>(
        value: item['value'],
        child: widget.isColorPicker
            ? _buildColorCircle(_convertToColor(item['value']))
            : Text(
                item['label'],
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
      );
    }).toList();
  }

  /// ✅ Convert String to Color correctly
  Color _convertToColor(dynamic colorValue) {
    if (colorValue is Color) return colorValue; // Already a Color

    if (colorValue is String) {
      switch (colorValue.toLowerCase()) {
        case 'red':
          return Colors.red;
        case 'blue':
          return Colors.blue;
        case 'green':
          return Colors.green;
        case 'yellow':
          return Colors.yellow;
        case 'black':
          return Colors.black;
        case 'white':
          return Colors.white;
      }
    }
    
    return Colors.grey; // Default color if unknown
  }

  Widget _buildColorCircle(Color color) {
    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.black26),
      ),
    );
  }
}
