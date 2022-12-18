// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, file_names

import 'package:flutter/material.dart';
import 'package:yerper_admin/Screens/Add%20a%20new%20Deal/Components/IconsandImage.dart';
import 'package:yerper_admin/Screens/Add%20a%20new%20Deal/Components/OfferDetails.dart';

class Body extends StatelessWidget {
  Body(
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
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          ImageAndIcons(
            size: size,
            actualprice: actualprice,
            card: card,
            earning: earning,
            offerPrice: offer,
            photo: photo,
          ),
          OfferDetails(Details: desc),
        ],
      ),
    );
  }
}
