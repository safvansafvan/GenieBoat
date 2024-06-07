class UserModel {
  String? name;
  String? email;
  String? uid;
  String? datetime;
  String? number;
  String? url;
  String? lastUpdated;
  UserModel(
      {this.email,
      this.name,
      this.uid,
      this.datetime,
      this.url,
      this.number,
      this.lastUpdated});

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'uid': uid,
        'datetime': datetime,
        'url': url,
        'number': number,
        'lastUpdated': lastUpdated
      };

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
      name: json["name"],
      email: json["email"],
      uid: json["uid"],
      url: json['url'],
      number: json['number'],
      lastUpdated: json['lastUpdated'],
      datetime: json['datetime']);
}
