// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mentor_finder/model/mentor_model.dart';
import 'package:mentor_finder/repository/mentor_repo.dart';

part 'mentor_state.dart';

class MentorCubit extends Cubit<MentorState> {
  MentorCubit() : super(MentorInitial());
  Future<List<MentorModel>> getMentors() async {
    emit(MentorLoading());
    final List<MentorModel> mentors = await MentorApi().getMentors();
    if (mentors.isNotEmpty) {
      Set<String> tags = {};
      for (final mentor in mentors) {
        for (final tag in mentor.tags) {
          tags.add(tag);
        }
      }
      emit(
        MentorLoaded(mentors: mentors, tags: tags),
      );
    } else {
      emit(MentorError());
    }
    return mentors;
  }
}
