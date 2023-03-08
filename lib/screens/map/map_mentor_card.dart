// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mentor_finder/helper/text.dart';

import 'package:mentor_finder/model/mentor_model.dart';

import '../../helper/color.dart';
import '../../utils/load_image_from_storage.dart';
import '../../widget/ratings.dart';

class MapMentorCard extends StatelessWidget {
  final MentorModel mentor;
  const MapMentorCard({
    Key? key,
    required this.mentor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300.w,
      padding: const EdgeInsets.symmetric(
        vertical: 5,
        horizontal: 15,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: mainwhite,
      ),
      child: Row(
        children: [
          ClipOval(
            child: SizedBox(
              height: 80,
              width: 80,
              child: mentor.image != null
                  ? FutureBuilder(
                      future: loadImage(mentor.image!),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done &&
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
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                mentor.name,
                style: h3,
              ),
              Text(
                mentor.tags.join(', '),
                style: b4,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    mentor.ratings.toString(),
                    style: ratingText,
                  ),
                  SizedBox(width: 10.w),
                  Ratings(rating: mentor.ratings),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
