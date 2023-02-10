// ignore_for_file: file_names, unused_import, prefer_const_constructors, must_be_immutable, camel_case_types, non_constant_identifier_names

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:yerper_admin/Screens/LoginScreen/Components/LoginFields.dart';
import 'package:yerper_admin/constants.dart';
import 'package:http/http.dart' as http;
import 'package:yerper_admin/main.dart';

import '../../api.dart';

class Reports extends StatefulWidget {
  const Reports({super.key});

  @override
  State<Reports> createState() => _ReportsState();
}

class _ReportsState extends State<Reports> {
  bool loading = true;
  late int total;
  late int active;
  late int earning;
  late int deals;
  late int activedeals;
  late int balance;

  @override
  void initState() {
    super.initState();
    getreports();
  }

  Future<void> getreports() async {
    Map<String, String> headers = {
      "Content-type": "application/json",
      "Authorization": "Bearer " + user.token.toString(),
    };
    var res = await http.get(Uri.parse('$api/admin/total'), headers: headers);
    print(res.statusCode);
    print(res.body);
    var result = res.body;
    // print(result);
    var res2 = await http.get(Uri.parse('$api/admin/active'), headers: headers);
    var result2 = res2.body;
    print(result2);
    // print(result);
    var res3 =
        await http.get(Uri.parse('$api/admin/dealsactive'), headers: headers);
    var result3 = res3.body;
    print(result3);
    var res4 =
        await http.get(Uri.parse('$api/admin/dealscomplete'), headers: headers);
    var result4 = res4.body;
    print(result4);
    var res5 = await http.get(
        Uri.parse('$api/user/getwalletbalance/' + "sanjay"),
        headers: headers);
    var result5 = res5.body;
    print(result5);
    setState(() {
      loading = false;
      total = int.parse(result);
      active = int.parse(result2);
      activedeals = int.parse(result3);
      deals = int.parse(result4);
      balance = int.parse(result5);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          "Reports         ",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w300, color: Colors.black),
        )),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : bodyy(
              total: total,
              active: active,
              active_deals: activedeals,
              deals: deals,
              balance: balance,
            ),
    );
  }
}

class bodyy extends StatelessWidget {
  bodyy(
      {Key? key,
      required this.total,
      required this.active,
      required this.active_deals,
      required this.deals,
      required this.balance})
      : super(key: key);

  int total;
  int active;
  int deals;
  int active_deals;
  int balance;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      width: MediaQuery.of(context).size.width,
      color: Color.fromARGB(138, 247, 247, 248),
      child: Column(
        children: [
          Container(
              padding: EdgeInsets.all(20.0),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.15,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(50)),
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromARGB(255, 108, 106, 106),
                      offset: Offset(
                        -1.0,
                        1.0,
                      ),
                      blurRadius: 5.0,
                      spreadRadius: 0.05,
                    ),
                  ]),
              child: Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Total Users:",
                      style: TextStyle(fontSize: 15),
                    ),
                    Text(
                      "$total",
                      style: TextStyle(
                        fontSize: 40,
                      ),
                    )
                  ],
                ),
              )),
          Container(
            padding: EdgeInsets.all(10.0),
            width: MediaQuery.of(context).size.width,
            // height: MediaQuery.of(context).size.height,
            // decoration: BoxDecoration(color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Wrap(children: [
                Padding(
                  padding:
                      const EdgeInsets.only(left: 10, right: 10, bottom: 20),
                  child: Container(
                      padding: EdgeInsets.all(10.0),
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: MediaQuery.of(context).size.height * 0.2,
                      // height: MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: const [
                              Color(0xffb1e6fe),
                              Color(0xffd47fe3)
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10)),
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromARGB(255, 108, 106, 106),
                              offset: Offset(
                                -1.0,
                                1.0,
                              ),
                              blurRadius: 5.0,
                              spreadRadius: 1.0,
                            ),
                          ]),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Active Users ",
                            style: TextStyle(fontSize: 15, color: Colors.black),
                          ),
                          Text("$active",
                              style:
                                  TextStyle(fontSize: 40, color: Colors.black))
                        ],
                      )),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 10, right: 10, bottom: 20),
                  child: Container(
                      padding: EdgeInsets.all(10.0),
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: MediaQuery.of(context).size.height * 0.2,
                      // height: MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: const [
                              Color(0xfff1709c),
                              Color.fromARGB(255, 182, 128, 128)
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10)),
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromARGB(255, 108, 106, 106),
                              offset: Offset(
                                -1.0,
                                1.0,
                              ),
                              blurRadius: 5.0,
                              spreadRadius: 1.0,
                            ),
                          ]),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Earning",
                            style: TextStyle(fontSize: 15, color: Colors.black),
                          ),
                          Flexible(
                            child: Text("$balance",
                                style: TextStyle(
                                    fontSize: 30, color: Colors.black)),
                          )
                        ],
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Container(
                      padding: EdgeInsets.all(10.0),
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: MediaQuery.of(context).size.height * 0.2,
                      // height: MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: const [
                              Color.fromARGB(255, 162, 228, 234),
                              Color(0xff16b5fc)
                            ],
                            begin: Alignment.bottomRight,
                            end: Alignment.topLeft,
                          ),
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10)),
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromARGB(255, 108, 106, 106),
                              offset: Offset(
                                -1.0,
                                1.0,
                              ),
                              blurRadius: 5.0,
                              spreadRadius: 1.0,
                            ),
                          ]),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Active Deals",
                            style: TextStyle(fontSize: 15, color: Colors.black),
                          ),
                          Text("$active_deals",
                              style:
                                  TextStyle(fontSize: 45, color: Colors.black))
                        ],
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Container(
                      padding: EdgeInsets.all(10.0),
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: MediaQuery.of(context).size.height * 0.2,
                      // height: MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: const [
                              Color(0xffff8862),
                              Color(0xffb69184)
                            ],
                            begin: Alignment.bottomRight,
                            end: Alignment.topLeft,
                          ),
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10)),
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromARGB(255, 108, 106, 106),
                              offset: Offset(
                                -1.0,
                                1.0,
                              ),
                              blurRadius: 5.0,
                              spreadRadius: 1.0,
                            ),
                          ]),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Completed Deals",
                            style: TextStyle(fontSize: 15, color: Colors.black),
                          ),
                          Text("$deals",
                              style:
                                  TextStyle(fontSize: 45, color: Colors.black))
                        ],
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Center(
                      child: Column(
                    children: const [
                      Text(
                        "NOTE:",
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text("This Data Is Refreshed After every one hour"),
                    ],
                  )),
                ),
              ]),
            ),
          )
        ],
      ),
    ));
  }
}
