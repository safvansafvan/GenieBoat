import 'dart:developer';
import 'package:chatboat/model/firestore_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FireStoreRes {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  List<FirestoreModel> allHistory = [];
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> addHistoryToFirestore({required FirestoreModel model}) async {
    User? user = auth.currentUser;
    await firestore
        .collection('users')
        .doc(user?.uid)
        .collection('historys')
        .doc(model.id)
        .set(model.toJson());
    log('HISTORY LIST TO ADDED VALUE');
  }

  Future<List<FirestoreModel>> getHistoryFromFireStore() async {
    User? user = auth.currentUser;
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await historys(user?.uid ?? '');
    allHistory.clear();
    for (QueryDocumentSnapshot<Map<String, dynamic>> document
        in querySnapshot.docs) {
      Map<String, dynamic> data = document.data();
      allHistory.add(
        FirestoreModel(
            id: data['id'],
            ans: data['ans'],
            qus: data['qus'],
            date: data['date'],
            time: data['time']),
      );
    }
    log('FETCHED VALUES FROM FIRESTORE ${allHistory.length}');
    return allHistory;
  }

  Future<QuerySnapshot<Map<String, dynamic>>> historys(String userId) async {
    return await firestore
        .collection('users')
        .doc(userId)
        .collection('historys')
        .get();
  }

  Future<void> deleteCollection() async {
    User? user = auth.currentUser;
    final collectionRef = FirebaseFirestore.instance
        .collection('users')
        .doc(user?.uid)
        .collection('historys');
    var snapshots = await collectionRef.get();
    for (var doc in snapshots.docs) {
      await doc.reference.delete();
    }
  }
}
