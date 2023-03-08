// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'mentor_cubit.dart';

abstract class MentorState extends Equatable {
  const MentorState();

  @override
  List<Object> get props => [];
}

class MentorInitial extends MentorState {}

class MentorLoading extends MentorState {}

class MentorLoaded extends MentorState {
  final Set<String> tags;
  final List<MentorModel> mentors;
  const MentorLoaded({
    required this.tags,
    required this.mentors,
  });
  @override
  List<Object> get props => [mentors];
}

class MentorError extends MentorState {}
