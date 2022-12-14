// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, file_names

import 'package:flutter/material.dart';
import 'package:yerper_admin/Screens/DetailsScreen/Components/IconsandImage.dart';
import 'package:yerper_admin/Screens/DetailsScreen/Components/OfferDetails.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          ImageAndIcons(
            size: size,
            actualprice: '25000',
            card: 'VISA',
            earning: '250',
            offerPrice: '20000',
          ),
          OfferDetails(Details: "This is the Description"),
        ],
      ),
    );
  }
}
