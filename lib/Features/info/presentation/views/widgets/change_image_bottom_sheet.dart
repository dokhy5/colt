
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ChangeImageBottomSheet extends StatelessWidget {
  const ChangeImageBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Change Profile Picture',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),

          const SizedBox(height: 20),
          ListTile(
            leading:FaIcon (FontAwesomeIcons.camera),
            title: const Text('Take a new picture'),
            onTap: () {
              Navigator.pop(context); // أغلق النافذة
            },
          ),
          ListTile(
            leading: FaIcon (FontAwesomeIcons.photoFilm),
            title: const Text('Choose from gallery'),
            onTap: () {
              Navigator.pop(context); // أغلق النافذة
            },
          ),
          const SizedBox(height: 10),
          Center(
            child: TextButton(
              onPressed: () {
                print("Cancel tapped");
                Navigator.pop(context); // أغلق النافذة
              },
              child: const Text(
                'Cancel',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.deepPurpleAccent,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
