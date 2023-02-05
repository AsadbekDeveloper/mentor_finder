import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mentor_finder/helper/text.dart';

import '../../helper/constants.dart';
import '../../model/mentor_model.dart';

class MentorDescription extends StatelessWidget {
  const MentorDescription({
    Key? key,
    required this.model,
  }) : super(key: key);

  final MentorModel model;

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    model.name,
                    style: h3,
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    model.type,
                    style: b4,
                  ),
                ],
              ),
              const Spacer(),
              Text(
                "\$${model.price}/hr",
                style: paymentText,
              ),
            ],
          ),
          SizedBox(height: 20.h),
          Text(
            "About ${model.name.split(" ")[0]}",
            style: h3,
          ),
          SizedBox(height: 5.h),
          Text(
            Constants.description.substring(0, 350),
            style: b4,
          ),
        ]);
  }
}
