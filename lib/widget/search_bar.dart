import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mentor_finder/helper/color.dart';
import 'package:mentor_finder/helper/text.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      margin: const EdgeInsets.symmetric(
        vertical: 20,
      ),
      decoration: BoxDecoration(
        color: const Color(0xffd2d1e1).withOpacity(.3),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: <Widget>[
          const SizedBox(width: 16),
          const Icon(Icons.search),
          const SizedBox(width: 12),
          SizedBox(
            width: MediaQuery.of(context).size.width - 150,
            child: TextField(
              decoration: InputDecoration(
                  hintText: "Search", hintStyle: b3, border: InputBorder.none),
            ),
          ),
          const Spacer(),
          Container(
            width: 60.h,
            height: 60.h,
            decoration: BoxDecoration(
              color: mainblue,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const RotatedBox(
              quarterTurns: 1,
              child: Icon(
                Icons.filter_list_rounded,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
