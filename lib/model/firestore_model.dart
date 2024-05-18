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

  factory FirestoreModel.fromJson(Map<String, dynamic> json) => FirestoreModel(
        id: json["id"],
        qus: json["qus"],
        ans: json["ans"],
        date: json["date"],
        time: json["time"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "qus": qus,
        "ans": ans,
        "date": date,
        "time": time,
      };
}
