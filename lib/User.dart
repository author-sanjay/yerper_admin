// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';

class User extends ChangeNotifier {
  late final String email;
  late final String password;
  late final int id;

  void signin(String email, String password, int id) {
    email = email;
    password = password;
    id = id;
  }
}
