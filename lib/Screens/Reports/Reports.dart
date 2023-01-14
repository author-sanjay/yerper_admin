import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:yerper_admin/constants.dart';
import 'package:http/http.dart' as http;

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

  @override
  void initState() {
    super.initState();
    getreports();
  }

  Future<void> getreports() async {
    Map<String, String> headers = {"Content-type": "application/json"};
    var res = await http.get(Uri.parse(api + '/admin/total'), headers: headers);
    var result = jsonDecode(res.body);
    // print(result);
    var res2 =
        await http.get(Uri.parse(api + '/admin/active'), headers: headers);
    var result2 = jsonDecode(res2.body);
    // print(result);
    var res3 =
        await http.get(Uri.parse(api + '/admin/dealsactive'), headers: headers);
    var result3 = jsonDecode(res2.body);
    var res4 = await http.get(Uri.parse(api + '/admin/dealscomplete'),
        headers: headers);
    var result4 = jsonDecode(res2.body);
    setState(() {
      loading = false;
      total = result;
      active = result2;
      activedeals = result3;
      deals = result4;
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
      required this.deals})
      : super(key: key);

  int total;
  int active;
  int deals;
  int active_deals;
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
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 108, 106, 106),
                      offset: const Offset(
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
                            colors: [Color(0xffb1e6fe), Color(0xffd47fe3)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10)),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(255, 108, 106, 106),
                              offset: const Offset(
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
                            colors: [
                              Color(0xfff1709c),
                              Color.fromARGB(255, 182, 128, 128)
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10)),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(255, 108, 106, 106),
                              offset: const Offset(
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
                          Text("7656",
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
                            colors: [
                              Color.fromARGB(255, 162, 228, 234),
                              Color(0xff16b5fc)
                            ],
                            begin: Alignment.bottomRight,
                            end: Alignment.topLeft,
                          ),
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10)),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(255, 108, 106, 106),
                              offset: const Offset(
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
                            colors: [Color(0xffff8862), Color(0xffb69184)],
                            begin: Alignment.bottomRight,
                            end: Alignment.topLeft,
                          ),
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10)),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(255, 108, 106, 106),
                              offset: const Offset(
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
                    children: [
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
