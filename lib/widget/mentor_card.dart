import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mentor_finder/helper/text.dart';
import 'package:mentor_finder/widget/ratings.dart';

import '../model/mentor_model.dart';
import '../screens/profile/profile_page.dart';

class MentorCard extends StatelessWidget {
  const MentorCard({
    Key? key,
    required this.model,
  }) : super(key: key);

  final MentorModel model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ProfilePage(model: model)));
        },
        child: Row(
          children: <Widget>[
            Container(
              height: 75.h,
              width: 75.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    image: AssetImage(model.image),
                  ),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      blurRadius: 10,
                      color: Colors.grey.shade400,
                      offset: const Offset(4, 4),
                    )
                  ]),
            ),
            const SizedBox(
              width: 12,
            ),
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Ratings(rating: model.ratings),
                SizedBox(height: 5.h),
                Text(
                  "\$${model.price}/hr",
                  style: paymentText,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
