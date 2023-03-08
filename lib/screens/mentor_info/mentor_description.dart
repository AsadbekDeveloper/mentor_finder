import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mentor_finder/helper/text.dart';

import '../../helper/color.dart';
import '../../helper/constants.dart';
import '../../model/mentor_model.dart';
import '../../utils/load_image_from_storage.dart';
import '../../widget/ratings.dart';

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
      children: [
        Row(
          children: [
            ClipOval(
              child: SizedBox(
                height: 80.h,
                width: 80.h,
                child: model.image != null
                    ? FutureBuilder(
                        future: loadImage(model.image!),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                                  ConnectionState.done &&
                              snapshot.hasData) {
                            return CachedNetworkImage(
                              imageUrl: snapshot.data!,
                              progressIndicatorBuilder:
                                  (context, url, progress) => Center(
                                child: SizedBox(
                                  width: 15,
                                  height: 15,
                                  child: CircularProgressIndicator(
                                    value: progress.progress,
                                  ),
                                ),
                              ),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            );
                          }
                          return Image.asset('assets/icons/mentor.jpg');
                        },
                      )
                    : Image.asset('assets/icons/mentor.jpg'),
              ),
            ),
            SizedBox(
              width: 20.h,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 5.h),
              height: 85.h,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.name,
                    style: h3,
                  ),
                  Text(
                    "${model.experience} yillik tajriba",
                    style: b4,
                  ),
                  Text(
                    "${model.studentCount} studentlar",
                    style: b4,
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10.h,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "\$${model.price}/soat",
              style: paymentText,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  model.ratings.toString(),
                  style: ratingText,
                ),
                SizedBox(width: 10.w),
                Ratings(rating: model.ratings),
              ],
            ),
          ],
        ),
        SizedBox(
          height: 70.h,
          child: ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: model.tags.length,
            itemBuilder: (context, index) => Center(
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 15.w,
                  vertical: 10.h,
                ),
                decoration: BoxDecoration(
                  color: maingrey.withOpacity(.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  model.tags[index],
                ),
              ),
            ),
            separatorBuilder: (context, index) => SizedBox(
              width: 10.w,
            ),
          ),
        ),
        Text(
          "${model.name.split(" ")[0]} haqida qisqacha:",
          style: h3,
        ),
        SizedBox(height: 5.h),
        Text(
          Constants.description.substring(0, 350),
          style: b4,
        ),
      ],
    );
  }
}
