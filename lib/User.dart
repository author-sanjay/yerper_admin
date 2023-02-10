// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';

class User extends ChangeNotifier {
  late String? email;
  late String? password;
  late String? id;
  late String? token;

  void signin(String email, String password, String id, String token) {
    email = email;
    password = password;
    id = id;
    token = token;
    notifyListeners();
  }
}
