import 'dart:developer';

import 'package:chatboat/model/firestore_model.dart';
import 'package:chatboat/view/widgets/msg_toast.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreCtrl extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  bool isLoadingGet = false;
  bool isLoadingNew = false;
  List<FirestoreModel> allHistory = <FirestoreModel>[];
  int allHistoryLength = 0;

  Future<void> addHistoryToFirestore(
      {required FirestoreModel model, context}) async {
    try {
      isLoadingNew = false;
      await firestore.collection('historys').doc(model.id).set(model.toJson());
      log('Historys List To added Values');
    } catch (e) {
      boatSnackBar(
          ctx: context, text: 'Error', message: 'Check Internet Connection');
      log(e.toString());
    } finally {
      isLoadingNew = true;
    }
  }

  Future<void> getHistoryFromFireStore() async {
    isLoadingGet = true;
    update();
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot = await historys();
      allHistory.clear();
      for (QueryDocumentSnapshot<Map<String, dynamic>> document
          in querySnapshot.docs) {
        Map<String, dynamic> data = document.data();
        allHistory.add(
          FirestoreModel(
              ans: data['ans'],
              qus: data['qus'],
              date: data['date'],
              time: data['time']),
        );
        allHistoryLength = allHistory.length;
        update();
        log('Fetched Values From firestore cloud ${allHistory.length}');
      }
    } catch (e) {
      log(e.toString());
    } finally {
      isLoadingGet = false;
      update();
    }
  }

  Future<QuerySnapshot<Map<String, dynamic>>> historys() async {
    return await firestore.collection('historys').get();
  }
}
