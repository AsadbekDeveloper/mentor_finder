import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mentor_finder/cubit/mentor_cubit.dart';
import 'package:mentor_finder/helper/color.dart';
import 'package:mentor_finder/helper/text.dart';
import '../../widget/mentor_card.dart';
import '../../widget/search_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 20.h),
            Text(
              "O'zingizga ustoz toping",
              style: h2,
            ),
            SizedBox(height: 7.h),
            const SearchBar(),
            Expanded(
              child: BlocBuilder<MentorCubit, MentorState>(
                builder: (context, state) {
                  if (state is MentorLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is MentorLoaded) {
                    return Column(
                      children: [
                        SizedBox(
                          height: 40,
                          child: ListView.separated(
                            itemBuilder: (context, index) => Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 8,
                                horizontal: 20,
                              ),
                              decoration: BoxDecoration(
                                color: lightgrey,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Text(
                                state.tags.elementAt(index),
                              ),
                            ),
                            itemCount: state.tags.length,
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                              width: 10,
                            ),
                            scrollDirection: Axis.horizontal,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemBuilder: (context, index) =>
                                MentorCard(model: state.mentors[index]),
                            itemCount: state.mentors.length,
                          ),
                        ),
                      ],
                    );
                  } else {
                    return SizedBox(
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 150.w,
                            child: Image.asset('assets/icons/wrong.png'),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            'Xatolik yuz berdi!',
                            style: h3,
                          ),
                        ],
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
