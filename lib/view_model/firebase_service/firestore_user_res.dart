import 'dart:developer';

import 'package:chatboat/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserFirestoreRes {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> addUserToFirestore({required UserModel model}) async {
    await firestore.collection('users').doc(model.uid).set(model.toJson());
    log('Users List To added Values');
  }

  Future<UserModel?> getUserDetails() async {
    User? user = auth.currentUser;
    DocumentSnapshot<Map<String, dynamic>> querySnapshot =
        await userDetails(user?.uid ?? '');
    if (querySnapshot.exists) {
      return UserModel.fromJson(querySnapshot.data()!);
    }
    return null;
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> userDetails(
      String userId) async {
    return await firestore.collection('users').doc(userId).get();
  }
}
