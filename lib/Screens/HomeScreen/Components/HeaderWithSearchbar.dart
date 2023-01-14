// ignore_for_file: prefer_const_constructors, file_names, avoid_print, sized_box_for_whitespace, unused_import

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../api.dart';
import '../../../constants.dart';
import 'package:http/http.dart' as http;

class HeaderWithSearchbar extends StatefulWidget {
  const HeaderWithSearchbar({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  State<HeaderWithSearchbar> createState() => _HeaderWithSearchbarState();
}

class _HeaderWithSearchbarState extends State<HeaderWithSearchbar> {
  late int users;

  Future<void> getuser() async {
    Map<String, String> headers = {"Content-type": "application/json"};
    var res2 =
        await http.get(Uri.parse(api + '/admin/active'), headers: headers);
    var result2 = jsonDecode(res2.body);
    setState(() {
      users = result2;
    });
  }

  @override
  void initState() {
    super.initState();
    getuser();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: kDefaultPadding * 2.5),
      height: widget.size.height * 0.2,
      child: Stack(
        children: <Widget>[
          Container(
            height: widget.size.height * 0.2,
            decoration: BoxDecoration(
                color: kprimarycolor,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(36),
                    bottomRight: Radius.circular(36))),
            child: GestureDetector(
              onTap: (() {
                print("Welcome Admin");
              }),
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 48.0),
                      child: Text(
                        "Total Users",
                        style: Theme.of(context).textTheme.headline5?.copyWith(
                            color: Colors.white, fontWeight: FontWeight.w300),
                      ),
                    ),
                    Text(
                      "$users",
                      style: Theme.of(context).textTheme.headline5?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 30),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
