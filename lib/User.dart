import 'dart:ffi';

class User {
  late String email;
  late String password;
  late int id;

  User({required this.email, required this.password, required this.id});

  User.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
    id = json['id'];
  }
}
