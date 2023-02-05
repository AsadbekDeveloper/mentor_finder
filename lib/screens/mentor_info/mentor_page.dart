import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mentor_finder/helper/constants.dart';
import 'package:mentor_finder/helper/text.dart';
import 'package:mentor_finder/screens/mentor_info/mentor_description.dart';
import '/helper/color.dart';
import '/model/mentor_model.dart';

import 'achievements.dart';

class MentorPage extends StatelessWidget {
  const MentorPage({super.key, required this.model});
  final MentorModel model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            left: 15.w,
            right: 15.w,
            bottom: 15.h,
          ),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            child: const Icon(Icons.keyboard_arrow_left),
                          ),
                        ),
                        const Spacer(),
                        const Icon(Icons.favorite),
                      ],
                    ),
                    MentorDescription(model: model),
                    SizedBox(height: 20.h),
                    const Achievements(),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: mainblue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
                child: Container(
                  height: 60.h,
                  alignment: Alignment.center,
                  child: Text(
                    "Aloqaga chiqing",
                    style: linkWhite,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
