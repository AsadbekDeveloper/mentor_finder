import '../model/mentor_model.dart';

class Constants {
  static const String description =
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.";
}

final mentorData = [
  MentorModel(
      name: "Stefan stefencfik",
      image: "assets/images/face_1.jpg",
      type: "Business",
      price: 35,
      ratings: 4),
  MentorModel(
      name: "Jenny Nackos",
      image: "assets/images/face_2.jpg",
      type: "Parenting",
      price: 65,
      ratings: 5),
  MentorModel(
      name: "Joseph Gonzalez",
      image: "assets/images/face_3.jpg",
      type: "Health",
      price: 30,
      ratings: 3),
  MentorModel(
    name: "Jenny Leiefser",
    image: "assets/images/face_4.jpg",
    type: "lawyer",
    price: 80,
    ratings: 5,
  ),
];
