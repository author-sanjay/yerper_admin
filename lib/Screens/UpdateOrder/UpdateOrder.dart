import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:yerper_admin/Screens/HomeScreen/HomeScreen.dart';
import 'package:yerper_admin/constants.dart';

class UpdateOrder extends StatelessWidget {
  const UpdateOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: boddy(),
    );
  }
}

class boddy extends StatefulWidget {
  const boddy({
    Key? key,
  }) : super(key: key);

  @override
  State<boddy> createState() => _boddyState();
}

class _boddyState extends State<boddy> {
  bool got = false;
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: got == false
          ? Center(
              child: Container(
                padding: EdgeInsets.all(10.0),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.all(10.0),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.1,
                      decoration: BoxDecoration(color: Colors.white),
                      child: Center(
                          child: Text(
                        "Select One",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w300),
                      )),
                    ),
                    GestureDetector(
                      onTap: (() {
                        // Navigator.push(context,MaterialPageRoute(builder: (context) => HomeScreen(),),);
                      }),
                      child: Container(
                        padding: EdgeInsets.all(10.0),
                        width: MediaQuery.of(context).size.width * 0.6,
                        height: 40,
                        // height: MediaQuery.of(context).size.height * 0.05,
                        decoration: BoxDecoration(
                            color: kprimarycolor,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                topRight: Radius.circular(20))),
                        child: Center(
                          child: Text(
                            "Update Deal Status",
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: (() {
                        // Navigator.push(context,MaterialPageRoute(builder: (context) => HomeScreen(),),);
                      }),
                      child: Container(
                        padding: EdgeInsets.all(10.0),
                        width: MediaQuery.of(context).size.width * 0.6,
                        height: 40,
                        // height: MediaQuery.of(context).size.height * 0.05,
                        decoration: BoxDecoration(color: kprimarycolor,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                topRight: Radius.circular(20))),
                        child: Text(
                          "Update Perticular Order",
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          : Container(
              padding: EdgeInsets.all(10.0),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(color: Colors.white),
              child: Text("got"),
            ),
    );
  }
}
