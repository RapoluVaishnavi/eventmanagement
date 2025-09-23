class UserModel {
  String? fullName;
  String? emailId;
  String? password;

  UserModel({this.fullName, this.emailId, this.password});

  // JSON → Dart
  UserModel.fromJson(Map<String, dynamic> json) {
    fullName = json['fullName'];
    emailId = json['emailId'];
    password = json['password'];
  }

  // Dart → JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['fulName'] = fullName;
    data['emailId'] = emailId;
    data['password'] = password;
    return data;
  }
}
