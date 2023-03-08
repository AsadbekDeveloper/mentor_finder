import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mentor_finder/model/mentor_model.dart';

class MentorApi {
  final mentorCollection = FirebaseFirestore.instance.collection('mentors');
  Future<List<MentorModel>> getMentors() async {
    try {
      await Future.delayed(
        const Duration(seconds: 1),
      );
      QuerySnapshot snapshot = await mentorCollection.get();
      final List<MentorModel> mentors = snapshot.docs
          .map(
            (doc) => MentorModel.fromMap(doc.id, doc.data() as Map<String, dynamic>),
          )
          .toList();
      return mentors;
    } catch (e) {
      log(e.toString());
      return [];
    }
  }

  Future<void> addNewTodo(MentorModel mentor) {
    return mentorCollection.add(mentor.toMap());
  }

  Future<void> deleteTodo(MentorModel mentor) async {
    return mentorCollection.doc(mentor.id).delete();
  }

  Stream<List<MentorModel>> mentors() {
    return mentorCollection.snapshots().map((snapshot) {
      return snapshot.docs
          .map(
            (doc) => MentorModel.fromMap(doc.id, doc.data()),
          )
          .toList();
    });
  }

  Future<void> updateMentor(MentorModel mentor) {
    return mentorCollection.doc(mentor.id).update(mentor.toMap());
  }
}
