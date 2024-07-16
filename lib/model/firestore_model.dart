import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreModel {
  String? id;
  String? qus;
  String? ans;
  String? date;
  String? time;
  Timestamp? timestamp;
  String? image;

  FirestoreModel(
      {this.id,
      this.qus,
      this.ans,
      this.date,
      this.time,
      this.image,
      this.timestamp});

  Map<String, dynamic> toJson() => {
        "id": id,
        "qus": qus,
        "ans": ans,
        "date": date,
        "time": time,
        'image': image,
        'timestamp': timestamp
      };
}
