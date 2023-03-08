import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mentor_finder/model/mentor_model.dart';

part 'favourite_mentor_state.dart';

class FavouriteMentorCubit extends Cubit<FavouriteMentorState> {
  FavouriteMentorCubit() : super(const FavouriteMentorState([]));
  add(MentorModel mentor) {
    emit(
      FavouriteMentorState(
        [...super.state.favouriteMentors, mentor],
      ),
    );
  }

  remove(MentorModel mentor) {
    final favourites = super.state.favouriteMentors;
    for (final favourite in favourites) {
      if (favourite.id == mentor.id) {
        favourites.remove(favourite);
      }
    }
    emit(
      FavouriteMentorState(favourites),
    );
  }
}
