class EditUserModel {
  String? name;
  String? uid;
  String? lastUpdated;
  String? number;
  String? email;
  String? datetime;
  String? url;

  EditUserModel({
    this.email,
    this.name,
    this.uid,
    this.lastUpdated,
    this.url,
    this.datetime,
    this.number,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        'uid': uid,
        'lastUpdated': lastUpdated,
        'url': url,
        'number': number,
        'email': email,
        'datetime': datetime,
      };

  factory EditUserModel.fromJson(Map<String, dynamic> json) => EditUserModel(
        name: json["name"],
        uid: json["uid"],
        url: json['url'],
        number: json['number'],
        email: json['email'],
        datetime: json['datetime'],
        lastUpdated: json['lastUpdated'],
      );
}
