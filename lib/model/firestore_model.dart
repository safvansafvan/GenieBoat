class FirestoreModel {
  String? id;
  String? qus;
  String? ans;
  String? date;
  String? time;

  FirestoreModel({
    this.id,
    this.qus,
    this.ans,
    this.date,
    this.time,
  });

  Map<String, dynamic> toJson() => {
        "id": id,
        "qus": qus,
        "ans": ans,
        "date": date,
        "time": time,
      };
}
