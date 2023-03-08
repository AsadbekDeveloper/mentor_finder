import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mentor_finder/cubit/mentor_cubit.dart';
import 'package:mentor_finder/model/mentor_model.dart';
import 'package:mentor_finder/screens/favourite/cubit/favourite_mentor_cubit.dart';
import 'package:mentor_finder/widget/mentor_card.dart';

import '../../helper/text.dart';

class FavouritePage extends StatelessWidget {
  const FavouritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                'Favourites',
                style: h2,
              ),
            ),
            Expanded(
              child: BlocBuilder<FavouriteMentorCubit, FavouriteMentorState>(
                builder: (context, state) {
                  List<MentorModel> favouriteMentors = [];
                  final mentorState = context.read<MentorCubit>().state;
                  if (mentorState is MentorLoaded) {
                    List<MentorModel> allMentors = mentorState.mentors;
                    for (final mentor in allMentors) {
                      if (state.favouriteMentors
                          .any((element) => element == mentor.id)) {
                        favouriteMentors.add(mentor);
                      }
                    }
                  }
                  return ListView.builder(
                    itemCount: favouriteMentors.length,
                    itemBuilder: (context, index) => MentorCard(
                      model: favouriteMentors[index],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
