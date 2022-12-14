// ignore_for_file: file_names, prefer_const_literals_to_create_immutables, prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';

import '../../../constants.dart';
class TitleWithButton extends StatelessWidget {
  const TitleWithButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Row(
        children: <Widget>[
          TextWithCustomUnderline(text: "Deals"),
          
        ],
      ),
    );
  }
}

class TextWithCustomUnderline extends StatelessWidget {
  const TextWithCustomUnderline({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: kDefaultPadding / 4),
            child: Text(
              text,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 5,
                margin: EdgeInsets.only(right: kDefaultPadding / 4),
                color: kprimarycolor.withOpacity(0.2),
              ))
        ],
      ),
    );
  }
}
