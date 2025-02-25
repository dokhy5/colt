import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SelectAttribute extends StatefulWidget {
  final String label;
  final List<Map<String, dynamic>> items;
  final dynamic initialValue;
  final Function(String)? onChanged;
  final bool isColorPicker;
  final String preferenceKey;

  const SelectAttribute({
    super.key,
    required this.label,
    required this.items,
    required this.preferenceKey,
    this.initialValue,
    this.onChanged,
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
    _loadSelectedValue();
  }

  Future<void> _loadSelectedValue() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedValue = prefs.getString(widget.preferenceKey) ?? widget.initialValue ?? widget.items.first['value'];
    });
  }

  Future<void> _saveSelectedValue(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(widget.preferenceKey, value);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showColorPicker(context),
      child: Container(
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
              _getLabelForValue(selectedValue),
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const Icon(Icons.keyboard_arrow_down, size: 24),
          ],
        ),
      ),
    );
  }

  void _showColorPicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.label,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close, size: 24),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              ListView.builder(
                shrinkWrap: true,
                itemCount: widget.items.length,
                itemBuilder: (context, index) {
                  final item = widget.items[index];
                  final isSelected = item['value'] == selectedValue;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedValue = item['value'];
                      });
                      _saveSelectedValue(item['value']);
                      widget.onChanged?.call(item['value']);
                      Navigator.pop(context);
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 6),
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      decoration: BoxDecoration(
                        color: isSelected ? const Color(0Xff8e6cef) : Colors.grey[100],
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        children: [
                          if (widget.isColorPicker)
                            _buildColorCircle(_convertToColor(item['value'])),
                          const SizedBox(width: 12),
                          Text(
                            item['label'],
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: isSelected ? Colors.white : Colors.black,
                            ),
                          ),
                          const Spacer(),
                          if (isSelected)
                            const Icon(Icons.check, color: Colors.white, size: 22),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  String _getLabelForValue(dynamic value) {
    return widget.items.firstWhere((item) => item['value'] == value, orElse: () => widget.items.first)['label'];
  }

  Color _convertToColor(dynamic colorValue) {
    if (colorValue is Color) return colorValue;
    if (colorValue is String) {
      switch (colorValue.toLowerCase()) {
        case 'red':
          return Colors.red;
        case 'blue':
          return Colors.blue;
        case 'yellow':
          return Colors.yellow;
        case 'black':
          return Colors.black;
        case 'orange':
          return Colors.orange;
        default:
          return Colors.grey;
      }
    }
    return Colors.grey;
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