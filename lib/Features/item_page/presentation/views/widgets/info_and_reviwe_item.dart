import 'package:colt_shop/core/utils/assets.dart';
import 'package:flutter/material.dart';

class InfoAndReviweItem extends StatelessWidget {
  const InfoAndReviweItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          'Built for life and made to last, this full-zip corduroy jacket is part of our Nike Life collection. The spacious fit gives you plenty of room to layer underneath, while the soft corduroy keeps it casual and timeless.',
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 24),
        Text(
          'Shipping & Returns',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        Text(
          'Free standard shipping and free 60-day returns.',
          style: TextStyle(fontSize: 12, color: Colors.grey),
        ),
        const SizedBox(height: 24),
        Text(
          'Reviews',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        Text(
          '4.5 Ratings',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        Text(
          '213 Reviews',
          style: TextStyle(fontSize: 12, color: Colors.grey),
        ),
        const SizedBox(height: 12),
        ReviewsItemListView(),
      ],
    );
  }
}

class ReviewsItemListview extends StatelessWidget {
  const ReviewsItemListview({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.grey[200],
              radius: 25, // Reduced size for better layout
              child: Image.asset(
                AssetsData.test, // Replace with your actual asset path
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(width: 12),

            // User Name & Rating Stars
            const Text(
              'John Doe', // Change this dynamically if needed
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
            Spacer(),
            Row(
              children: List.generate(5, (index) {
                return const Icon(
                  Icons.star,
                  color: Color(0Xff8e6cef), // Gold color for stars
                  size: 18,
                );
              }),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          'Gucci transcribes its heritage, creativity, and innovation into a plenitude of collections. From staple items to distinctive accessories.',
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey,
          ),
        ),
        SizedBox(height: 4),
        Text(
          '12days ago',
          style: TextStyle(
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}

class ReviewsItemListView extends StatelessWidget {
  const ReviewsItemListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true, // Ensures it takes only necessary space
      physics: const NeverScrollableScrollPhysics(), // Prevents conflict with parent scroll
      itemCount: 6, // Adjust dynamically if needed
      itemBuilder: (context, index) {
        return const Padding(
          padding: EdgeInsets.only(bottom: 12), // Spacing between items
          child: ReviewsItemListview(), // Keeping your item structure intact
        );
      },
    );
  }
}
