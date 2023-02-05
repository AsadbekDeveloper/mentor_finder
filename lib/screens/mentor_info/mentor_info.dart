import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: SingleChildScrollView(
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
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MentorPage(
                            model: MentorModel(
                              name: "Stefan stefencfik",
                              image: "assets/images/face_1.jpg",
                              type: "Business",
                              price: 35,
                              ratings: 4,
                            ),
                          ),
                        ),
                      );
                    },
                    child: Row(
                      children: <Widget>[
                        Container(
                          height: 85,
                          width: 85,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: AssetImage(model.image),
                            ),
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                blurRadius: 10,
                                color: Colors.grey.shade400,
                                offset: const Offset(4, 4),
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 24, vertical: 10),
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: maingrey.withOpacity(.5)),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Row(
                              children: <Widget>[
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    const Icon(Icons.star,
                                        color: mainyellow, size: 15),
                                    SizedBox(height: 5.h),
                                    Text(
                                      "${model.ratings}/hr",
                                      style: ratingText,
                                    ),
                                  ],
                                ),
                                const SizedBox(width: 12),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    Text(
                                      "Reviews",
                                      style: ratingText,
                                    ),
                                    SizedBox(height: 8.h),
                                    Text(
                                      "1500",
                                      style: ratingText,
                                    ),
                                  ],
                                ),
                              ],
                            ))
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                MentorDescription(model: model),
                SizedBox(height: 20.h),
                const Achievements(),
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
                      "Hire Now",
                      style: linkWhite,
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
