import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mentor_finder/helper/text.dart';

import '../../helper/color.dart';
import '../../helper/constants.dart';

class AchievementCard extends StatelessWidget {
  const AchievementCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: maingrey.withOpacity(.1),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: Container(
            width: 30.w,
            alignment: Alignment.center,
            child: const Icon(Icons.star, color: mainyellow)),
        title: Text(
          "Supported 100+ startups",
          style: h3,
        ),
        subtitle: Text(
          Constants.description.substring(0, 90),
          style: b4,
        ),
      ),
    );
  }
}
