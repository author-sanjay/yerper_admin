import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:yerper_admin/Screens/LoginScreen/Components/LoginFields.dart';
import 'package:yerper_admin/constants.dart';

import '../../api.dart';

class OrderUpdate extends StatefulWidget {
  const OrderUpdate({super.key});

  @override
  State<OrderUpdate> createState() => _OrderUpdateState();
}

class _OrderUpdateState extends State<OrderUpdate> {
  bool hidden = true;
  late String gotorderid;
  late String status;
  late String date;
  late String txnid;

  late String? orderid;
  Future<void> getdetails(int id) async {
    Map<String, String> headers = {
      "Content-type": "application/json",
      "Authorization": "Bearer " + TextFields.token.toString(),
    };
    var res = await http.get(Uri.parse('$api/orders/getsingleorder/$id'),
        headers: headers);
    if (res.statusCode == 404) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AlertDialog(
            title: const Text('Success'),
            content: SingleChildScrollView(
              child: ListBody(
                children: const <Widget>[
                  Text('No Order Found With This id'),
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
      var result = jsonDecode(res.body);
      print(result);
      setState(() {
        hidden = false;
        // gotorderid = result["id"];
        status = result["order_status"];
        date = result["date"];
        txnid = result["platformtxnid"];
      });
    }
  }

  Future<void> updatecomplete(int uid, String status) async {
    Map<String, String> headers = {
      "Content-type": "application/json",
      "Authorization": "Bearer " + TextFields.token.toString(),
    };
    final json = jsonEncode({"id": uid});
    var res =
        await http.put(Uri.parse('$api/orders/update/$uid'), headers: headers);
    var result = jsonDecode(res.body);
    print(result);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AlertDialog(
          title: const Text('Success'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Order Has Been Marked Delivered'),
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
  }

  Future<void> notdelivered(int uid, String status) async {
    Map<String, String> headers = {
      "Content-type": "application/json",
      "Authorization": "Bearer " + TextFields.token.toString(),
    };
    final json = jsonEncode({"order_status": status, "platformtxnid": txnid});
    var res = await http.post(Uri.parse('$api/orders/updatesingle/$uid'),
        headers: headers, body: json);

    print(res);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AlertDialog(
          title: const Text('Success'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Order Has Been Marked Not Delivered'),
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
                onChanged: ((value) {
                  orderid = value;
                }),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 18.0),
                child: Center(
                    child: GestureDetector(
                        onTap: (() {
                          getdetails(int.parse(orderid!));
                        }),
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
              hidden
                  ? Container(
                      padding: EdgeInsets.only(top: 20),
                      child: Text("Please Search Your Order"),
                    )
                  : Padding(
                      padding: const EdgeInsets.only(top: 18.0),
                      child: Container(
                        padding: EdgeInsets.all(10.0),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 195, 223, 207),
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
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 18.0, right: 18),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Order ID    ",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Spacer(),
                                      Text(
                                        "$orderid",
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 18.0, right: 18, top: 10),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Order Status    ",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Spacer(),
                                      Text(
                                        "$status",
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 18.0, right: 18, top: 10),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Date ",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Spacer(),
                                      Text(
                                        "$date",
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 18.0, right: 18, top: 10),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Transaction ID  ",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Spacer(),
                                      Text(
                                        "$txnid",
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 18.0),
                              child: Column(
                                children: [
                                  GestureDetector(
                                    onTap: (() {
                                      updatecomplete(
                                          int.parse(orderid!), "Complete");
                                    }),
                                    child: Container(
                                      padding: EdgeInsets.all(10.0),
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                          color: Color.fromARGB(
                                              255, 95, 229, 102)),
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
                                        notdelivered(
                                            int.parse(orderid!), "ERROR");
                                      }),
                                      child: Container(
                                        padding: EdgeInsets.all(10.0),
                                        width:
                                            MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                            color: Color.fromARGB(
                                                255, 229, 95, 95)),
                                        child: Center(
                                            child: Text(
                                          "Not Delivered",
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.white),
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
