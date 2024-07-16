class RatingModel {
  String? id;
  double? ratingCount;
  String? message;
  String? date;

  RatingModel({
    this.id,
    this.date,
    this.message,
    this.ratingCount,
  });

  Map<String, dynamic> toJson() => {
        "id": id,
        "ratingCount": ratingCount,
        "message": message,
        "date": date,
      };

  factory RatingModel.fromJson(Map<String, dynamic> json) => RatingModel(
      date: json['date'],
      id: json['id'],
      message: json['message'],
      ratingCount: json['ratingCount']);
}
