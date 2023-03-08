// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../model/mentor_model.dart';

part 'marker_state.dart';

class MarkerCubit extends Cubit<MarkerState> {
  MarkerCubit() : super(const MarkerState({}));
  void generateMarkers(List<MentorModel> mentors) {
    final Set<Marker> markers = List.generate(
      mentors.length,
      (index) => Marker(
        markerId: MarkerId(
          UniqueKey().hashCode.toString(),
        ),
        infoWindow: InfoWindow(
          title: mentors[index].name,
        ),
        position: mentors[index].coordinates!,
      ),
    ).toSet();
    emit(
      MarkerState(markers),
    );
  }
}
