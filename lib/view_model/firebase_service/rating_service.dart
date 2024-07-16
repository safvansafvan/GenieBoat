import 'dart:developer';
import 'package:chatboat/model/rating_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RatingService {
  static Future<void> addUserRating({required RatingModel model}) async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final FirebaseFirestore firestore = FirebaseFirestore.instance;

    User? user = auth.currentUser;

    if (user == null) {
      log('No authenticated user.');
      return;
    }

    if (model.id!.isEmpty) {
      log('Model ID is empty.');
      return;
    }

    await firestore
        .collection('users')
        .doc(user.uid)
        .collection('rating')
        .doc(model.id)
        .set(model.toJson());
    log('ADDED USER RATING');
  }

  static Future<RatingModel> getUserRatings() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final FirebaseFirestore firestore = FirebaseFirestore.instance;

    User? user = auth.currentUser;

    try {
      QuerySnapshot snapshot = await firestore
          .collection('users')
          .doc(user?.uid)
          .collection('rating')
          .get();

      List<RatingModel> ratings = snapshot.docs.map((doc) {
        return RatingModel.fromJson(doc.data() as Map<String, dynamic>);
      }).toList();

      log('RETRIEVED USER RATINGS');
      return ratings.first;
    } catch (e) {
      log('Error retrieving user ratings: $e');
    }
    return RatingModel();
  }
}
