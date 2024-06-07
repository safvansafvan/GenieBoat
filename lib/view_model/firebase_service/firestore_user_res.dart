import 'dart:developer';
import 'dart:typed_data';

import 'package:chatboat/model/edit_user_model.dart';
import 'package:chatboat/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class UserFirestoreRes {
  FirebaseStorage firebaseStorage = FirebaseStorage.instance;

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> addUserToFirestore({required UserModel model}) async {
    await firestore.collection('users').doc(model.uid).set(model.toJson());
    log('CURRENT USER DETAILS ADDED');
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

  Future<String> uploadImageToStorage(Uint8List file) async {
    User? user = auth.currentUser;
    Reference reference =
        firebaseStorage.ref().child('profile_img/${user?.uid}');
    UploadTask uploadTask = reference.putData(file);
    TaskSnapshot snapshot = await uploadTask;
    String downloadedUrl = await snapshot.ref.getDownloadURL();
    return downloadedUrl;
  }

  Future<void> editUserDetails(EditUserModel model) async {
    User? user = auth.currentUser;
    await firestore.collection('users').doc(user?.uid).set(model.toJson());
    log('CURRENT USER DETAILS UPDATED');
  }
}
