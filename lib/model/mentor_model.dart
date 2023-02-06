// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MentorModel {
  final String name;
  final String image;
  final String location;
  final List<String> tags;
  final double ratings;
  final double experience;
  final String studentCount;
  final LatLng coordinates;
  final double price;
  MentorModel({
    required this.name,
    required this.image,
    required this.location,
    required this.tags,
    required this.ratings,
    required this.experience,
    required this.studentCount,
    required this.coordinates,
    required this.price,
  });
}
