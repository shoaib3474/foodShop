// filepath: /d:/New Projects/food_shop/lib/models/user_model.dart
class UserModel {
  final String message;
  final int status;
  final UserData userData;

  UserModel({
    required this.message,
    required this.status,
    required this.userData,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      message: json['message'],
      status: json['status'],
      userData: UserData.fromJson(json['data']),
    );
  }
}

class UserData {
  final String name;
  final int age;
  final String email;

  UserData({
    required this.name,
    required this.age,
    required this.email,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      name: json['name'],
      age: json['age'],
      email: json['email'],
    );
  }
}
