// ignore_for_file: prefer_const_constructors, duplicate_ignore

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yerper_admin/Screens/HomeScreen/HomeScreen.dart';
import 'package:yerper_admin/Screens/LoginScreen/LoginScreen.dart';
import 'package:yerper_admin/User.dart';
import 'package:yerper_admin/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => User())],
      child: Consumer<User>(builder: ((context, provider, child) => MyApp()))));
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
