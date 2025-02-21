import 'package:flutter/material.dart';

class CustomButtonSaveAddress extends StatelessWidget {
  final bool isButtonEnabled;
  final VoidCallback onSave;

  const CustomButtonSaveAddress({
    super.key,
    required this.isButtonEnabled,
    required this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: isButtonEnabled
                ? () {
                    onSave(); // Save the address
                    Navigator.pop(context); // Return to previous screen
                  }
                : null,
            style: ElevatedButton.styleFrom(
              backgroundColor: isButtonEnabled ? Colors.deepPurpleAccent : Colors.grey,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
            child: Text(
              'Save Address',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: isButtonEnabled ? Colors.white : Colors.black54,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
