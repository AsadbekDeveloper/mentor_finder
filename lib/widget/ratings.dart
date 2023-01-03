import 'package:flutter/material.dart';
import '/helper/color.dart';

class Ratings extends StatelessWidget {
  const Ratings({super.key, required this.rating});
  final double rating;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(rating.toInt(),
              (index) => const Icon(Icons.star, size: 12, color: mainyellow))
          .toList(),
    );
  }
}
