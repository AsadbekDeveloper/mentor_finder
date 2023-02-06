import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../model/mentor_model.dart';

class Constants {
  static const String description =
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.";
}

final mentorData = [
  MentorModel(
    name: "Yuriy Kagramanyan",
    image: "assets/images/YK.jpg",
    tags: ['IT', 'Web', 'Frontend'],
    experience: 10,
    studentCount: '1000+',
    price: 35,
    ratings: 4,
    location: 'Mirzo Ulug\'g\'bek',
    coordinates: const LatLng(41.347, 69.356),
  ),
  MentorModel(
    name: "Dilshod Hamdamov",
    image: "assets/images/DH.jpg",
    experience: 10,
    studentCount: '2000+',
    tags: ['English', 'Lingvist'],
    price: 65,
    ratings: 5,
    location: 'Olmozor',
    coordinates: const LatLng(41.334, 69.228),
  ),
  MentorModel(
    name: "Timur Olimjonov",
    image: "assets/images/TO.jpg",
    experience: 5,
    studentCount: '200+',
    tags: [
      'Python',
      'Backend',
      'IT',
    ],
    price: 30,
    ratings: 3,
    location: 'Amir Temur ko\'chasi',
    coordinates: const LatLng(41.323, 69.283),
  ),
];
