import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mentor_finder/helper/constants.dart';
import 'package:mentor_finder/helper/text.dart';
import '../../widget/mentor_card.dart';
import '../../widget/search_bar.dart';

import 'categories.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 20.h),
            Text(
              "Find Your",
              style: h2,
            ),
            Text(
              "Perfect Mentor",
              style: h2,
            ),
            SizedBox(height: 7.h),
            const SearchBar(),
            SizedBox(height: 25.h),
            const Categories(),
            SizedBox(height: 20.h),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) =>
                    MentorCard(model: mentorData[index]),
                itemCount: mentorData.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
