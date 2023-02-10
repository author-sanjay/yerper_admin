import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:yerper_admin/Admin.dart';
import 'package:yerper_admin/Adminmodelapi.dart';
import 'package:yerper_admin/Screens/HomeScreen/HomeScreen.dart';
import 'package:yerper_admin/Screens/LoginScreen/Components/LoginFields.dart';

import '../../api.dart';

class ListofAdmins extends StatefulWidget {
  const ListofAdmins({Key? key}) : super(key: key);

  @override
  State<ListofAdmins> createState() => _ListofAdminsState();
}

class _ListofAdminsState extends State<ListofAdmins> {
  late List<Admin> _getdeals;
  bool _isloading = true;

  Future<void> delete(int id) async {
    Map<String, String> headers = {
      "Content-type": "application/json",
      "Authorization": "Bearer " + TextFields.token.toString(),
    };
    var res = await http.delete(
        Uri.parse(api + '/admin/delete/' + id.toString()),
        headers: headers);
    var result = jsonDecode(res.body);
    print(result);
    setState(() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ),
      );
    });
  }

  @override
  void initState() {
    super.initState();
    getDeals();
  }

  Future<void> getDeals() async {
    _getdeals = await Adminapi.getDeals();
    setState(() {
      _isloading = false;
    });
    if (kDebugMode) {
      print(_getdeals);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text(''),
      // ),
      body: SingleChildScrollView(
          child: SafeArea(
        child: _isloading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Padding(
                padding: const EdgeInsets.all(28.0),
                child: Container(
                  child: Column(
                    children: [
                      Center(
                        child: Text(
                          "Admins",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w300),
                        ),
                      ),
                      const Divider(
                        color: Colors.black,
                        height: 25,
                        thickness: 1,
                        indent: 5,
                        endIndent: 5,
                      ),
                      Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Column(
                            children: [
                              for (var i in _getdeals)
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Text(
                                        i.name,
                                        style: TextStyle(fontSize: 20),
                                      ),
                                      Spacer(),
                                      GestureDetector(
                                        onTap: (() {
                                          delete(i.id);
                                        }),
                                        child: Container(
                                          width: 40,
                                          height: 40,
                                          decoration: BoxDecoration(
                                              color: Colors.red,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20))),
                                          child: Center(
                                              child: Icon(
                                            Icons.delete,
                                            color: Colors.white,
                                          )),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                            ],
                          ))
                    ],
                  ),
                ),
              ),
      )),
    );
  }
}
