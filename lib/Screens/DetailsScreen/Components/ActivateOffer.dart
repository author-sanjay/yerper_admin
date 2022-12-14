// ignore_for_file: prefer_const_constructors, file_names

import 'package:flutter/material.dart';

import '../../../constants.dart';


class ActivateOffer extends StatelessWidget {
  const ActivateOffer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 3),
      child: Container(
        decoration: BoxDecoration(
            color: kprimarycolor,
            boxShadow: [
              BoxShadow(
                  offset: Offset(-10, -10),
                  blurRadius: 55,
                  color: kprimarycolor.withOpacity(0.23)),
            ],
            borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))),
        width: MediaQuery.of(context).size.width,
        height: 55,
        child: Align(
          alignment: Alignment.center,
          child: RichText(
              text: TextSpan(
                  text: "Activate Offer",
                  style: Theme.of(context).textTheme.headline4?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ))),
        ),
      ),
    );
  }
}
