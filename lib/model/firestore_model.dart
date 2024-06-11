import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreModel {
  String? id;
  String? qus;
  String? ans;
  String? date;
  String? time;
  int? count;
  Timestamp? timestamp;

  FirestoreModel(
      {this.id,
      this.qus,
      this.ans,
      this.date,
      this.time,
      this.count,
      this.timestamp});

  Map<String, dynamic> toJson() => {
        "id": id,
        "qus": qus,
        "ans": ans,
        "date": date,
        'count': count,
        "time": time,
        'timestamp': timestamp
      };
}
