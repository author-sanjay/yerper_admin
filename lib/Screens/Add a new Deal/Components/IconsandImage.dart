// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, file_names

import 'package:flutter/material.dart';
import 'package:yerper_admin/Screens/Add%20a%20new%20Deal/Components/Image.dart';
import 'package:yerper_admin/Screens/Add%20a%20new%20Deal/Components/LeftIcons.dart';

class ImageAndIcons extends StatelessWidget {
  const ImageAndIcons(
      {Key? key,
      required this.size,
      required this.actualprice,
      required this.offerPrice,
      required this.card,
      required this.earning,
      required this.photo})
      : super(key: key);

  final Size size;
  final int actualprice;
  final int offerPrice;
  final String card;
  final int earning;
  final String photo;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height * 0.8,
      child: Row(
        children: <Widget>[
          LeftIcons(
              actualprice: actualprice, offerPrice: offerPrice, card: card),
          Images(
            size: size,
            imagz: photo,
          )
        ],
      ),
    );
  }
}
