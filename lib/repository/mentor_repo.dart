import 'dart:developer';

import 'package:mentor_finder/helper/constants.dart';
import 'package:mentor_finder/model/mentor_model.dart';

class MentorApi {
  Future<List<MentorModel>> getMentors() async {
    try {
      await Future.delayed(
        const Duration(seconds: 1),
      );
      final List<MentorModel> mentors = mentorData;
      return mentors;
    } catch (e) {
      log(e.toString());
      return [];
    }
  }
}
