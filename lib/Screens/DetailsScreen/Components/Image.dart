// ignore_for_file: prefer_const_constructors, file_names

import 'package:flutter/material.dart';

import '../../../constants.dart';


class Images extends StatelessWidget {
  const Images({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.8,
      width: size.width * 0.75,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(63), bottomLeft: Radius.circular(63)),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 10),
                blurRadius: 60,
                color: kprimarycolor.withOpacity(0.29)),
          ],
          image: DecorationImage(
              alignment: Alignment.centerLeft,
              fit: BoxFit.cover,
              image: AssetImage("assets/images/img.png"))),
    );
  }
}
