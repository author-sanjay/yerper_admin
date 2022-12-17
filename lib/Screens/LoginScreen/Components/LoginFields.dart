// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, file_names, avoid_print, unnecessary_new

import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:yerper_admin/User.dart';

import '../../../constants.dart';

class TextFields extends StatefulWidget {
  const TextFields({
    Key? key,
  }) : super(key: key);

  @override
  State<TextFields> createState() => _TextFieldsState();
}

class _TextFieldsState extends State<TextFields> {
  late String email;
  late String password;

  Map<String, String> headers = {"Content-type": "application/json"};
  Future loginuser(String email1, String password1) async {
    final json = jsonEncode({"email": email1, "password": password1});
    var res = await http.post(Uri.parse("http://192.168.1.3:9090/admin/verify"),
        headers: headers,
        // body: JsonEncoder({})
        body: json);

    final result = jsonDecode(res.body);
    print(result);
    User user = User(
        email: result["email"], id: result["id"], password: result["password"]);

    print(user.email);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * 0.2,
          right: MediaQuery.of(context).size.width * 0.2),
      child: Column(
        children: <Widget>[
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Login",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 40,
                      fontWeight: FontWeight.w300),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 20),
            child: Center(child: Text("Login As An Admin")),
          ),
          TextField(
            onChanged: (value) {
              email = value;
            },
            decoration: new InputDecoration(labelText: "Email"),
          ),
          TextField(
            onChanged: (value) {
              password = value;
            },
            decoration: new InputDecoration(labelText: "Password"),
          ), // Only numbers can be entered

          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: GestureDetector(
              onTap: (() {
                loginuser(email, password);
              }),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: 43,
                decoration: BoxDecoration(
                    color: kprimarycolor,
                    borderRadius: BorderRadius.circular(20)),
                child: Center(
                    child: Text(
                  "Login",
                  style: TextStyle(color: Colors.white, fontSize: 17),
                )),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Center(
              child: GestureDetector(
                onTap: (() {}),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text:
                            "    By Signing in You agree to our \n            Terms & Conditions",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 10,
                            fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}