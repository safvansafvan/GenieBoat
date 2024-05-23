import 'dart:developer';

import 'package:chatboat/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserFirestoreRes {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> addUserToFirestore({required UserModel model}) async {
    await firestore.collection('users').doc(model.uid).set(model.toJson());
    log('Users List To added Values');
  }
}
