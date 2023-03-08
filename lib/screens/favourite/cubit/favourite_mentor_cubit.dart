// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mentor_finder/utils/mentor_preferences.dart';

part 'favourite_mentor_state.dart';

class FavouriteMentorCubit extends Cubit<FavouriteMentorState> {
  FavouriteMentorCubit() : super(const FavouriteMentorState([]));

  init() {
    final favourites = MentorPreferences.getMentor();
    emit(
      FavouriteMentorState(favourites),
    );
  }

  add(String mentor) {
    MentorPreferences.addMentor(mentor);
    emit(
      FavouriteMentorState(
        [...super.state.favouriteMentors, mentor],
      ),
    );
  }

  remove(String mentor) {
    List<String> favourites = [...super.state.favouriteMentors];
    favourites.remove(mentor);
    MentorPreferences.removeMentor(mentor);
    emit(
      FavouriteMentorState(favourites),
    );
  }
}
