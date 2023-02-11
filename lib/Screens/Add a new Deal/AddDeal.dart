// ignore_for_file: file_names, prefer_const_constructors, duplicate_ignore, must_be_immutable

import 'package:flutter/material.dart';
import 'package:yerper_admin/Screens/Add%20a%20new%20Deal/Components/Body.dart';
import 'package:http/http.dart' as http;
import 'package:yerper_admin/Screens/HomeScreen/HomeScreen.dart';
import 'package:yerper_admin/Screens/LoginScreen/Components/LoginFields.dart';
import 'package:yerper_admin/api.dart';

class Details extends StatefulWidget {
  Details(
      {super.key,
      required this.actualprice,
      required this.card,
      required this.earning,
      required this.offer,
      required this.desc,
      required this.photo,
      required this.id});
  int actualprice;
  String card;
  int earning;
  int offer;
  String desc;
  String photo;
  int id;
  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  Future<void> update(int id) async {
    Map<String, String> headers = {
      "Content-type": "application/json",
      "Authorization": "Bearer " + TextFields.token.toString(),
    };
    var res = await http.delete(
        Uri.parse(api + "/deals/delete/" + id.toString()),
        headers: headers);
    print(res.statusCode);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HomeScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
        bottomNavigationBar: GestureDetector(
          onTap: () {
            update(widget.id);
          },
          child: Container(
            color: Colors.red,
            width: MediaQuery.of(context).size.width,
            // padding: EdgeInsets.all(20),
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.3,
                vertical: 10),
            child: Text(
              "Delete Deal",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w400),
            ),
          ),
        ),
        body: Body(
          actualprice: widget.actualprice,
          card: widget.card,
          desc: widget.desc,
          earning: widget.earning,
          offer: widget.offer,
          photo: widget.photo,
        ));
  }
}
