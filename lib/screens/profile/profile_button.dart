import 'package:flutter/material.dart';
import 'package:mentor_finder/helper/color.dart';
import 'package:mentor_finder/helper/text.dart';

class ProfileButton extends StatelessWidget {
  final String title;
  final IconData icon;
  const ProfileButton({
    Key? key,
    required this.title,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: lightgrey,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Text(
              title,
              style: b3,
            ),
          ),
          const Icon(
            Icons.keyboard_arrow_right,
          ),
        ],
      ),
    );
  }
}
