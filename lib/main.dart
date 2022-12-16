import 'package:flutter/material.dart';
import 'package:yerper_admin/Screens/HomeScreen/HomeScreen.dart';
import 'package:yerper_admin/Screens/LoginScreen/LoginScreen.dart';
import 'package:yerper_admin/constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Yeper Client",
        theme: ThemeData(
          scaffoldBackgroundColor: kbackgroundColor,
          primaryColor: kprimarycolor,
          textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        // ignore: prefer_const_constructors
        home: LoginScreen());
  }
}
