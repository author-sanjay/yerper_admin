import 'dart:ffi';

class User {
  final String email;
  final String password;
  final int id;

  User({required this.email, required this.password, required this.id});

  User.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
    id = json['id'];
  }
}
