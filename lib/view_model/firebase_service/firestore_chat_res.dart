import 'dart:developer';
import 'dart:typed_data';
import 'package:chatboat/model/firestore_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

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
            image: data['image'],
            timestamp: data['timeStamp'],
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
        .orderBy('timestamp', descending: false)
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

  Future<String> uploadImageToStorage(Uint8List file, String id) async {
    FirebaseStorage firebaseStorage = FirebaseStorage.instance;
    Reference reference = firebaseStorage.ref().child('chat_img/$id');
    UploadTask uploadTask = reference.putData(file);
    TaskSnapshot snapshot = await uploadTask;
    String downloadedUrl = await snapshot.ref.getDownloadURL();
    return downloadedUrl;
  }
}
