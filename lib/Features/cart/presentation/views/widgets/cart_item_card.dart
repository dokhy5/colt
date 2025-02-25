import 'package:colt_shop/core/utils/assets.dart';
import 'package:flutter/material.dart';

class CartItemCard extends StatelessWidget {
  final Map<String, dynamic> item;

  const CartItemCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:12.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Image.asset(AssetsData.test2, width: 60, height: 60, fit: BoxFit.fill),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item['name'], style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  RichText(
                    text: TextSpan(
                      style: const TextStyle(fontSize: 14, color: Colors.grey),
                      children: [
                        const TextSpan(text: 'Size - '),
                        TextSpan(
                          text: item['size'], 
                          style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                        const TextSpan(text: '   Color - '),
                        TextSpan(
                          text: item['color'], 
                          style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children:[
                Text('\$${item['price']}', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
