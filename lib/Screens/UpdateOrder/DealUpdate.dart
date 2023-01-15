import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:yerper_admin/Screens/HomeScreen/HomeScreen.dart';
import 'package:yerper_admin/constants.dart';
import 'package:yerper_admin/modal/GetDeals.dart';
import 'package:yerper_admin/modal/GetDealsapi.dart';

import '../../api.dart';

class DealUpdate extends StatefulWidget {
  const DealUpdate({Key? key}) : super(key: key);

  @override
  State<DealUpdate> createState() => _DealUpdateState();
}

class _DealUpdateState extends State<DealUpdate> {
  static bool clicked = false;
  late List<GetDeals> _getdeals;
  bool _isloading = true;

  @override
  void initState() {
    super.initState();
    getDeals();
  }

  Future<void> getDeals() async {
    _getdeals = await Getdealsapi.getDeals();
    setState(() {
      _isloading = false;
    });
    print(_getdeals);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //  appBar: AppBar(title: const Text(''),),
        body: SingleChildScrollView(
      child: SafeArea(
        child: _isloading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(10.0),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.18,
                    decoration: BoxDecoration(
                        color: kprimarycolor,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(40.0),
                          child: Text(
                            "Update Deal Status",
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 18.0),
                    child: Container(
                      // padding: EdgeInsets.all(10.0),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(color: Colors.white),
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Select Deal",
                              style: TextStyle(fontSize: 18),
                            ),
                            Wrap(
                              children: [
                                for (var i in _getdeals)
                                  card(
                                    id: i.id,
                                    cardname: i.card,
                                    itemname: i.name,
                                    profit: i.earning.toDouble(),
                                    site: 'Flipkart',
                                    image: i.images,
                                    press: () {},
                                    actual: i.actual,
                                    desc: i.desc,
                                    offer: i.offer,
                                  ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
      ),
    ));
  }
}

class card extends StatefulWidget {
  const card(
      {Key? key,
      required this.itemname,
      required this.cardname,
      required this.profit,
      required this.site,
      required this.image,
      required this.press,
      required this.desc,
      required this.actual,
      required this.offer,
      required this.id})
      : super(key: key);
  final int id;
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
  State<card> createState() => _cardState();
}

class _cardState extends State<card> {
  static bool clicked = false;

  Future<void> markcomplete(int id) async {
    Map<String, String> headers = {"Content-type": "application/json"};
    var res = await http.put(
        Uri.parse(api + '/deals/complete/' + id.toString()),
        headers: headers);
    var result = jsonDecode(res.body);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AlertDialog(
          title: const Text('Success'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('The Product Has been Marked as Complete'),
                // Text('Would you like to approve of this message?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.push(context,MaterialPageRoute(builder: (context) => HomeScreen(),),);
              },
            ),
          ],
        ),
      ),
    );
    setState(() {
      
    });
  }

  Future<void> delete(int id) async {
    Map<String, String> headers = {"Content-type": "application/json"};
    var res = await http.delete(
        Uri.parse(api + '/deals/delete/' + id.toString()),
        headers: headers);
    var result = jsonDecode(res.body);
    print(result);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AlertDialog(
          title: const Text('Success'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('The Product Has been Deleted'),
                // Text('Would you like to approve of this message?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          clicked = true;
        });
      },
      child: Container(
        margin: EdgeInsets.only(
            left: kDefaultPadding,
            top: kDefaultPadding / 2,
            bottom: kDefaultPadding * 2.5),
        width: MediaQuery.of(context).size.width * 0.4,
        child: Column(
          children: <Widget>[
            Image.network(
              widget.image,
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height * 0.25,
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
                      Flexible(
                        child: RichText(
                            text: TextSpan(children: [
                          TextSpan(
                              text: "${widget.itemname}\n".toUpperCase(),
                              style: Theme.of(context).textTheme.button),
                          TextSpan(
                              text: "${widget.cardname}\n".toUpperCase(),
                              style: TextStyle(
                                color: kprimarycolor.withOpacity(0.9),
                              ))
                        ])),
                      )
                    ],
                  ),
                  GestureDetector(
                    onTap: (() {
                      markcomplete(widget.id);
                    }),
                    child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.05,
                        margin: EdgeInsets.only(top: 10),
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 129, 239, 131),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Center(
                            child: Text(
                          "Mark As Complete",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w500),
                        ))),
                  ),
                 
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
