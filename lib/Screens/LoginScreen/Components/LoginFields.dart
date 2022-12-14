// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, file_names, avoid_print, unnecessary_new

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yerper_admin/Screens/OtpScreen/OtpScreen.dart';


import '../../../constants.dart';


class TextFields extends StatelessWidget {
  const TextFields({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * 0.2,
          right: MediaQuery.of(context).size.width * 0.2),
      child: Column(
        children: <Widget>[
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Login",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 40,
                      fontWeight: FontWeight.w300),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 20),
            child: Center(
                child: Text(
                    "Login and Start Earning with \n         Your Credit Card")),
          ),
          TextField(
            onChanged: (value) {
              print(value);
            },
            decoration: new InputDecoration(labelText: "Phone Number"),
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly,
            ],
          ), // Only numbers can be entered

          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: GestureDetector(
              onTap: (() {
                
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OtpScreen(),
                  ),
                );
              }),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: 43,
                decoration: BoxDecoration(
                    color: kprimarycolor,
                    borderRadius: BorderRadius.circular(20)),
                child: Center(
                    child: Text(
                  "Send Code",
                  style: TextStyle(color: Colors.white, fontSize: 17),
                )),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Center(
              child: GestureDetector(
                onTap: (() {
                }),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text:
                            "    By Signing in You agree to our \n            Terms & Conditions",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 10,
                            fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
