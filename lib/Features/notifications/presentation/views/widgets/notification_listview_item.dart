import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NotificationListviewItem extends StatelessWidget {
  const NotificationListviewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: FaIcon(
              FontAwesomeIcons.bell,
              size: 20,
              color: Colors.black,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Text(
                'Gilbert, you placed an order. Check your order history for full details.',
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.start,
                softWrap: true,
                maxLines: 2,
                style: const TextStyle(fontSize: 12, color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}