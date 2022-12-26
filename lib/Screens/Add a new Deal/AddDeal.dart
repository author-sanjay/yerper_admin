// ignore_for_file: file_names, prefer_const_constructors, duplicate_ignore, must_be_immutable

import 'package:flutter/material.dart';
import 'package:yerper_admin/Screens/Add%20a%20new%20Deal/Components/Body.dart';

class Details extends StatelessWidget {
  Details(
      {super.key,
      required this.actualprice,
      required this.card,
      required this.earning,
      required this.offer,
      required this.desc,
      required this.photo});
  int actualprice;
  String card;
  int earning;
  int offer;
  String desc;
  String photo;
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
        body: Body(
            actualprice: actualprice,
            card: card,
            desc: desc,
            earning: earning,
            offer: offer,
            photo: photo,
            key: key));
  }
}
