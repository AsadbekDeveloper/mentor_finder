// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MentorModel {
  final String id;
  final String name;
  final String? image;
  final String location;
  final List<String> tags;
  final double ratings;
  final double experience;
  final String studentCount;
  final LatLng? coordinates;
  final double price;
  MentorModel({
    required this.id,
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

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'image': image,
      'location': location,
      'tags': tags,
      'ratings': ratings,
      'experience': experience,
      'studentCount': studentCount,
      'coordinates': coordinates,
      'price': price,
    };
  }

  factory MentorModel.fromMap(String id, Map<String, dynamic> map) {
    final GeoPoint coordinates = map['coordinates'];
    return MentorModel(
      id: id,
      name: map['name'] as String,
      image: map['image'],
      location: map['location'] as String,
      tags: (map['tags'] as List).map((item) => item as String).toList(),
      ratings: double.parse(map['ratings'].toString()),
      experience: double.parse(map['experience'].toString()),
      studentCount: map['studentCount'] as String,
      coordinates: LatLng(coordinates.latitude, coordinates.longitude),
      price: double.parse(map['price'].toString()),
    );
  }
}
