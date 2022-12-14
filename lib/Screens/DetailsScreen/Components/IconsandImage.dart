// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, file_names

import 'package:flutter/material.dart';
import 'package:yerper_admin/Screens/DetailsScreen/Components/Image.dart';
import 'package:yerper_admin/Screens/DetailsScreen/Components/LeftIcons.dart';

class ImageAndIcons extends StatelessWidget {
  const ImageAndIcons({
    Key? key,
    required this.size,
    required this.actualprice,
    required this.offerPrice,
    required this.card,
    required this.earning,
  }) : super(key: key);

  final Size size;
  final String actualprice;
  final String offerPrice;
  final String card;
  final String earning;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: size.height * 0.8, child: Center(child: Images(size: size)));
  }
}
