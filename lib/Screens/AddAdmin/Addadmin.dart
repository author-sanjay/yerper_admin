import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:yerper_admin/Screens/AddAdmin/ListofAdmins.dart';
import 'package:yerper_admin/Screens/HomeScreen/HomeScreen.dart';
import 'package:yerper_admin/Screens/LoginScreen/Components/LoginFields.dart';
import 'package:yerper_admin/constants.dart';
import 'package:http/http.dart' as http;

import '../../api.dart';

class Addadmin extends StatefulWidget {
  const Addadmin({Key? key}) : super(key: key);

  @override
  State<Addadmin> createState() => _AddadminState();
}

class _AddadminState extends State<Addadmin> {
  late String? email = null;
  late String? password = null;
  late String? name = null;

  Future<void> addadmin(String email, String password, String name) async {
    final json = jsonEncode(
        {"email": email, "password": password, "name": name, "id": email});
    print(json);
    Map<String, String> headers = {
      "Content-type": "application/json",
      "Authorization": "Bearer " + TextFields.token.toString(),
    };
    var res = await http.post(Uri.parse(api + "/admin/add"),
        headers: headers, body: json);
    print(res.statusCode);
    if (jsonDecode(res.body)) {
      // ignore: use_build_context_synchronously
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AlertDialog(
            title: const Text('Success'),
            content: SingleChildScrollView(
              child: ListBody(
                children: const <Widget>[
                  Text('New Added Admin'),
                  // Text('Would you like to approve of this message?'),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      );
    } else {
      print(jsonDecode(res.body));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  appBar: AppBar(title: const Text(''),),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.all(10.0),
            width: MediaQuery.of(context).size.width,
            // height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.all(28.0),
              child: Column(children: [
                Text(
                  "Hello Admin",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w300),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 18.0),
                  child: Text(
                    "On this page You can add New Admins/Manager for the app",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 18.0),
                  child: Text(
                    "Add Admin",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w300),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 18.0),
                  child: Text(
                    "Enter Email for New Admin Account",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Email',
                  ),
                  onChanged: ((value) {
                    email = value;
                  }),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 18.0),
                  child: Text(
                    "Enter Password for New Admin Account",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
                  ),
                ),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Password',
                  ),
                  onChanged: ((value) {
                    password = value;
                  }),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 18.0),
                  child: Text(
                    "Enter Name",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Name',
                  ),
                  onChanged: ((value) {
                    name = value;
                  }),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Center(
                    child: GestureDetector(
                      onTap: (() {
                        if (email != null && password != null && name != null) {
                          addadmin(email.toString(), password.toString(),
                              name.toString());
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomeScreen(),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text("Please Fill All Details"),
                          ));
                        }
                      }),
                      child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(10.0),
                        width: MediaQuery.of(context).size.width * 0.5,
                        decoration: BoxDecoration(
                            color: kprimarycolor,
                            borderRadius: BorderRadius.circular(20)),
                        child: Center(
                            child: Text(
                          "Save Admin",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w300,
                              color: Colors.white),
                        )),
                      ),
                    ),
                  ),
                ),
                // const Divider(
                //   color: Colors.black,
                //   height: 25,
                //   thickness: 1,
                //   indent: 5,
                //   endIndent: 5,
                // ),
                // Padding(
                //   padding: const EdgeInsets.only(top: 18.0),
                //   child: Text(
                //     "OR",
                //     style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
                //   ),
                // ),
                // GestureDetector(
                //   onTap: (() {
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //         builder: (context) => ListofAdmins(),
                //       ),
                //     );
                //   }),
                //   child: Padding(
                //     padding: const EdgeInsets.only(top: 18.0),
                //     child: Text(
                //       "Delete Admin",
                //       style:
                //           TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
                //     ),
                //   ),
                // ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
