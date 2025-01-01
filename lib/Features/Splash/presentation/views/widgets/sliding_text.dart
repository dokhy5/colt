import 'package:flutter/material.dart';

class Slidingtext extends StatelessWidget {
  const Slidingtext({
    super.key,
    required this.slaidingAnimatin,
  });

  final Animation<Offset> slaidingAnimatin;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: slaidingAnimatin,
        builder: (context, _) {
          return SlideTransition(
              position: slaidingAnimatin,
              child: const Text(
                'Ready to Bookmark',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12),
              ));
        });
  }
}
