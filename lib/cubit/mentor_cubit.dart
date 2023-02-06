import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mentor_finder/model/mentor_model.dart';
import 'package:mentor_finder/repository/mentor_repo.dart';

part 'mentor_state.dart';

class MentorCubit extends Cubit<MentorState> {
  MentorCubit() : super(MentorInitial());
  Future getMentors() async {
    emit(MentorLoading());
    final List<MentorModel> mentors = await MentorApi().getMentors();
    if (mentors.isNotEmpty) {
      emit(
        MentorLoaded(mentors: mentors),
      );
    } else {
      emit(MentorError());
    }
  }
}
