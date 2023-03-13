class UserModel {
  String? token;
  bool? isLoggedIn;

  UserModel({this.token, this.isLoggedIn});

  UserModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    isLoggedIn = json['isLoggedIn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['isLoggedIn'] = this.isLoggedIn;
    return data;
  }
}
