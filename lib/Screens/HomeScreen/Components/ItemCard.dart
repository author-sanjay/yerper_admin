// ignore_for_file: file_names, prefer_const_constructors, unnecessary_string_interpolations, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:yerper_admin/Screens/Add%20a%20new%20Deal/AddDeal.dart';

import '../../../constants.dart';

class ItemCard extends StatelessWidget {
  const ItemCard(
      {Key? key,
      required this.itemname,
      required this.cardname,
      required this.profit,
      required this.site,
      required this.image,
      required this.press,
      required this.desc,
      required this.actual,
      required this.offer})
      : super(key: key);

  final String itemname;
  final String cardname;
  final double profit;
  final String site;
  final String image;
  final Function press;
  final int actual;
  final int offer;
  final String desc;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Details(
                actualprice: actual,
                card: cardname,
                earning: profit.toInt(),
                offer: offer,
                desc: desc,
                photo: image),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(
            left: kDefaultPadding,
            top: kDefaultPadding / 2,
            bottom: kDefaultPadding * 2.5),
        width: size.width * 0.4,
        child: Column(
          children: <Widget>[
            Image.network(
              image,
              fit: BoxFit.cover,
              height: size.height * 0.25,
            ),
            Container(
              padding: EdgeInsets.all(kDefaultPadding / 2),
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 10),
                        blurRadius: 50,
                        color: kprimarycolor.withOpacity(0.23)),
                  ],
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10))),
              child: Column(
                children: [
                  Row(
                    children: <Widget>[
                      RichText(
                          text: TextSpan(children: [
                        TextSpan(
                            text: "$itemname\n".toUpperCase(),
                            style: Theme.of(context).textTheme.button),
                        TextSpan(
                            text: "$cardname\n".toUpperCase(),
                            style: TextStyle(
                              color: kprimarycolor.withOpacity(0.9),
                            ))
                      ]))
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Row(
                      children: <Widget>[
                        Container(
                          alignment: Alignment.center,
                          child: Column(
                            children: <Widget>[
                              Text(
                                "Offer Left",
                                style: TextStyle(color: Colors.green),
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        Container(
                          alignment: Alignment.center,
                          child: Column(
                            children: <Widget>[
                              Text("10"),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
