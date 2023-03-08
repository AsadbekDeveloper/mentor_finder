import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mentor_finder/helper/text.dart';
import 'package:mentor_finder/widget/ratings.dart';

import '../model/mentor_model.dart';
import '../screens/mentor_info/mentor_page.dart';
import '../utils/load_image_from_storage.dart';

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
        behavior: HitTestBehavior.opaque,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MentorPage(model: model),
            ),
          );
        },
        child: Row(
          children: <Widget>[
            ClipOval(
              child: SizedBox(
                height: 50.h,
                width: 50.h,
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
                        })
                    : Image.asset('assets/icons/mentor.jpg'),
              ),
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
                  model.tags.join(', '),
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
                  "\$${model.price}/soat",
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
