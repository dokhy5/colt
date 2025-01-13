
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class OrderItems extends StatelessWidget {
  const OrderItems({super.key});

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
          const Padding(
            padding: EdgeInsets.all(15),
            child: FaIcon(
              FontAwesomeIcons.fileLines,
              size: 20,
              color: Colors.black,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            '4 items',
            style: TextStyle(
                fontSize: 16, color: Colors.black, fontWeight: FontWeight.w500),
          ),
          const Spacer(),
          TextButton(
            onPressed: () {},
            style: ButtonStyle(
              overlayColor: WidgetStateProperty.all(Colors.transparent),
  ),
            child: Text(
              'View All',
              style: TextStyle(
                  fontSize: 12,
                  color: Colors.deepPurpleAccent,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            width: 15,
          )
        ],
      ),
    );
  }
}
