// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, file_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:yerper_admin/Screens/DetailsScreen/Components/IconsandImage.dart';
import 'package:yerper_admin/constants.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String actualprice = "NA";
  String offer_price = "NA";
  String card = "NONE";
  String user_earning = "NA";
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          ImageAndIcons(
            size: size,
            actualprice: actualprice,
            card: card,
            earning: user_earning,
            offerPrice: offer_price,
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
                                onChanged: (value) {},
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
                                onChanged: (value) {
                                  setState(() {});
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
                                onChanged: (value) {},
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
                                onChanged: (value) {},
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
                                onChanged: (value) {},
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
                                onChanged: (value) {},
                                decoration:
                                    InputDecoration(labelText: "Description"),
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
                      onTap: () {},
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
