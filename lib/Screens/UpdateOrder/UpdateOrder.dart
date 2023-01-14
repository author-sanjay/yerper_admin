// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:yerper_admin/Screens/UpdateOrder/DealUpdate.dart';
import 'package:yerper_admin/Screens/UpdateOrder/OrderUpdate.dart';
import 'package:yerper_admin/constants.dart';

class UpdateOrder extends StatefulWidget {
  const UpdateOrder({super.key});

  @override
  State<UpdateOrder> createState() => _UpdateOrderState();
}

class _UpdateOrderState extends State<UpdateOrder> {
  bool got = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: got == false
          ? Center(
              child: Container(
                padding: const EdgeInsets.all(10.0),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: const BoxDecoration(color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10.0),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.1,
                      decoration: const BoxDecoration(color: Colors.white),
                      child: const Center(
                          child: Text(
                        "Select One",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w300),
                      )),
                    ),
                    GestureDetector(
                      onTap: (() {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DealUpdate(),
                          ),
                        );
                      }),
                      child: Container(
                        padding: const EdgeInsets.all(10.0),
                        width: MediaQuery.of(context).size.width * 0.6,
                        height: 40,
                        // height: MediaQuery.of(context).size.height * 0.05,
                        decoration: const BoxDecoration(
                            color: kprimarycolor,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                topRight: Radius.circular(20))),
                        child: const Center(
                          child: Text(
                            "Update Deal Status",
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: (() {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OrderUpdate(),
                          ),
                        );
                      }),
                      child: Container(
                        padding: const EdgeInsets.all(10.0),
                        width: MediaQuery.of(context).size.width * 0.6,
                        height: 40,
                        // height: MediaQuery.of(context).size.height * 0.05,
                        decoration: const BoxDecoration(
                            color: kprimarycolor,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                topRight: Radius.circular(20))),
                        child: Center(
                          child: const Text(
                            "Update Perticular Order",
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          : Container(
              padding: const EdgeInsets.all(10.0),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(color: Colors.white),
              child: const Text("got"),
            ),
    ));
  }
}
