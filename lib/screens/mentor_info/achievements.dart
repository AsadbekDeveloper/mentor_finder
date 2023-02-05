import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mentor_finder/helper/text.dart';

import 'achivement_card.dart';

class Achievements extends StatelessWidget {
  const Achievements({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Achievments",
          style: h3,
        ),
        SizedBox(height: 16.h),
        const AchievementCard(),
        SizedBox(height: 16.h),
        const AchievementCard(),
        SizedBox(height: 16.h),
      ],
    );
  }
}
