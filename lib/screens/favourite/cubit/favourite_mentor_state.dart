// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'favourite_mentor_cubit.dart';

class FavouriteMentorState extends Equatable {
  final List<MentorModel> favouriteMentors;
  const FavouriteMentorState(
    this.favouriteMentors,
  );

  @override
  List<Object> get props => [favouriteMentors];
}
