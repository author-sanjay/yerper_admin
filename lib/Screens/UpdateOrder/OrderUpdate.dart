import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:yerper_admin/constants.dart';

import '../../api.dart';

class OrderUpdate extends StatefulWidget {
  const OrderUpdate({super.key});

  @override
  State<OrderUpdate> createState() => _OrderUpdateState();
}

class _OrderUpdateState extends State<OrderUpdate> {
  Future<void> getdetails(int id) async {
    Map<String, String> headers = {"Content-type": "application/json"};
    var res = await http.get(
        Uri.parse(api + '/orders/getsingle' + id.toString()),
        headers: headers);
    var result = jsonDecode(res.body);
    print(result);
  }

  Future<void> updatecomplete(int uid, String status) async {
    Map<String, String> headers = {"Content-type": "application/json"};
    var res = await http.put(
        Uri.parse(api + '/orders/complete' + uid.toString()),
        headers: headers);
    var result = jsonDecode(res.body);
    print(result);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: SafeArea(
              child: Column(
        children: [
          Center(
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(10.0),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.2,
              decoration: BoxDecoration(
                  color: kprimarycolor,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20))),
              child: Center(
                  child: Text(
                "Update Order Status",
                style: TextStyle(fontSize: 25, color: Colors.white),
              )),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(color: Colors.white),
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 15),
                child: Text(
                  "Enter Order Id",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter CReward Order id',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 18.0),
                child: Center(
                    child: GestureDetector(
                        onTap: (() {}),
                        child: Container(
                          padding: EdgeInsets.all(10.0),
                          width: MediaQuery.of(context).size.width * 0.5,
                          decoration: BoxDecoration(
                              color: kprimarycolor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: Center(
                              child: Text(
                            "Find order",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          )),
                        ))),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 18.0),
                child: Container(
                  padding: EdgeInsets.all(10.0),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 195, 181, 252),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  child: Column(
                    children: [
                      Text(
                        "Order Details\n",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                      Row(
                        children: [
                          Text(
                            "Order Id:",
                            style: TextStyle(fontSize: 16),
                          ),
                          Spacer(),
                          Text("124", style: TextStyle(fontSize: 16)),
                          Spacer(),
                          Text("Order Status:", style: TextStyle(fontSize: 16)),
                          Spacer(),
                          Text("Placed", style: TextStyle(fontSize: 16))
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Date:",
                            style: TextStyle(fontSize: 16),
                          ),
                          Spacer(),
                          Text("124", style: TextStyle(fontSize: 16)),
                          Spacer(),
                          Text("Transaction ID",
                              style: TextStyle(fontSize: 16)),
                          Spacer(),
                          Text("Placed", style: TextStyle(fontSize: 16))
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 18.0),
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: (() {
                                updatecomplete(1, "Complete");
                              }),
                              child: Container(
                                padding: EdgeInsets.all(10.0),
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 95, 229, 102)),
                                child: Center(
                                    child: Text(
                                  "Mark Complete",
                                  style: TextStyle(fontSize: 20),
                                )),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: GestureDetector(
                                onTap: (() {
                                  updatecomplete(1, "ERROR");
                                }),
                                child: Container(
                                  padding: EdgeInsets.all(10.0),
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 229, 95, 95)),
                                  child: Center(
                                      child: Text(
                                    "Not Delivered",
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  )),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ]),
          )
        ],
      ))),
    );
  }
}
