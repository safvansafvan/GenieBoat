class UserModel {
  String? name;
  String? email;
  String? uid;
  String? datetime;
  String? url;
  UserModel(this.email, this.name, this.uid, this.datetime, this.url);

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'uid': uid,
        'datetime': datetime,
        'url': url
      };
}
