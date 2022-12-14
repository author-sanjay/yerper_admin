// ignore_for_file: prefer_const_constructors, file_names


import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yerper_admin/Screens/HomeScreen/Components/Body.dart';

import '../../constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
      drawer: Drawer(),
      bottomNavigationBar: BottomBar(),
    );
  }
}


class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height*0.07,
      child: Row(children: <Widget>[
        Container(
          
          width: MediaQuery.of(context).size.width*0.5,
          
            child: Row(
              
              children: <Widget>[
                
                IconButton(onPressed: (){}, icon: Icon(Icons.add)),
                Text("Add a new Deal",style: TextStyle(fontSize: 17),)
              ],
            ),
          
        ),
       Container(
          width: MediaQuery.of(context).size.width * 0.5,
          child: Row(
            children: <Widget>[
              IconButton(onPressed: () {}, icon: Icon(Icons.person)),
              Text(
                "Add new admin",
                style: TextStyle(fontSize: 17),
              )
            ],
          ),
        ),
      ]),
    );
  }
}