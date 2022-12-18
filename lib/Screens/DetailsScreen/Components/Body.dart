// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, file_names, non_constant_identifier_names, prefer_interpolation_to_compose_strings, unused_local_variable, use_build_context_synchronously, avoid_init_to_null, unused_element, sort_child_properties_last, avoid_unnecessary_containers

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:yerper_admin/Screens/DetailsScreen/Components/IconsandImage.dart';
import 'package:yerper_admin/Screens/DetailsScreen/Components/Image.dart';
import 'package:yerper_admin/api.dart';
import 'package:yerper_admin/constants.dart';
import 'package:http/http.dart' as http;

import '../../HomeScreen/HomeScreen.dart';
import '../../LoginScreen/LoginScreen.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  Map<String, String> headers = {"Content-type": "application/json"};
  Future<void> post(String name, int actual, int offer, String card,
      int earning, String photo, int count, String description) async {
    final json = jsonEncode({
      "product_name": name,
      "description": description,
      "actual_price": actual,
      "offer_price": offer,
      "card": card,
      "user_earning": earning,
      "photourl": photo,
      "countleft": count,
      "active": true
    });

    var res = await http.post(Uri.parse(api + "/deals/add"),
        headers: headers, body: json);
    try {
      final result = jsonDecode(res.body);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ),
      );
    } catch (_) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LoginScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    int actualprice = 0;
    int offer_price = 0;
    String card = "NONE";
    int user_earning = 0;
    String description = "";
    String? photourl = null;
    String name = "";
    int count = 0;

    void change(String url) {
      setState(() {
        photourl = url;
      });
    }

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          ImageAndIcons(
            size: size,
            photourl: photourl,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width - 30,
            child: Padding(
              padding: const EdgeInsets.only(top: 25.0, left: 5.0, right: 5.0),
              child: Column(
                children: <Widget>[
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Add Details",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Row(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.grey[100],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(18))),
                          child: Icon(
                            Icons.label,
                            color: Colors.lightBlue[900],
                          ),
                          padding: EdgeInsets.all(12),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              TextField(
                                onChanged: (value) {
                                  name = value;
                                },
                                decoration: InputDecoration(
                                    labelText: "Name Of Product"),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Row(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.grey[100],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(18))),
                          child: Icon(
                            Icons.price_change,
                            color: Colors.lightBlue[900],
                          ),
                          padding: EdgeInsets.all(12),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              TextField(
                                keyboardType: TextInputType.number,
                                onChanged: (value) {
                                  actualprice = int.parse(value);
                                },
                                decoration:
                                    InputDecoration(labelText: "Actual Price"),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Row(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.grey[100],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(18))),
                          child: Icon(
                            Icons.attach_money,
                            color: Colors.lightBlue[900],
                          ),
                          padding: EdgeInsets.all(12),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              TextField(
                                keyboardType: TextInputType.number,
                                onChanged: (value) {
                                  offer_price = int.parse(value);
                                },
                                decoration:
                                    InputDecoration(labelText: "Offer Price"),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Row(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.grey[100],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(18))),
                          child: Icon(
                            Icons.credit_card,
                            color: Colors.lightBlue[900],
                          ),
                          padding: EdgeInsets.all(12),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              TextField(
                                onChanged: (value) {
                                  card = value;
                                },
                                decoration: InputDecoration(labelText: "Card"),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Row(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.grey[100],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(18))),
                          child: Icon(
                            Icons.wallet,
                            color: Colors.lightBlue[900],
                          ),
                          padding: EdgeInsets.all(12),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              TextField(
                                keyboardType: TextInputType.number,
                                onChanged: (value) {
                                  user_earning = int.parse(value);
                                },
                                decoration:
                                    InputDecoration(labelText: "User Earning"),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Row(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.grey[100],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(18))),
                          child: Icon(
                            Icons.description,
                            color: Colors.lightBlue[900],
                          ),
                          padding: EdgeInsets.all(12),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              TextField(
                                onChanged: (value) {
                                  description = value;
                                },
                                decoration:
                                    InputDecoration(labelText: "Description"),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Row(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.grey[100],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(18))),
                          child: Icon(
                            Icons.description,
                            color: Colors.lightBlue[900],
                          ),
                          padding: EdgeInsets.all(12),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              TextField(
                                onChanged: (value) {
                                  count = int.parse(value);
                                },
                                decoration:
                                    InputDecoration(labelText: "Deal Limit"),
                                keyboardType: TextInputType.number,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.07,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: kprimarycolor,
            ),
            margin: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.1),
            child: Container(
              child: Row(
                children: <Widget>[
                  Spacer(),
                  GestureDetector(
                      onTap: () {
                        // print(deal.photo);
                        post(name, actualprice, offer_price, card, user_earning,
                            deal.photo, count, description);
                      },
                      child: Text(
                        "Post Deal",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      )),
                  Spacer()
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
