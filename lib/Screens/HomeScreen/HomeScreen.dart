// ignore_for_file: prefer_const_constructors, file_names, unused_import, sized_box_for_whitespace, avoid_unnecessary_containers


import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yerper_admin/Screens/Add%20a%20new%20Deal/AddDeal.dart';
import 'package:yerper_admin/Screens/DetailsScreen/DetailsSceen.dart';
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
      child: 

          Container(
                child: Row(
                  
                  children: <Widget>[
                    Spacer(),
                    IconButton(onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailsScreen(),
                    ),
                  );
                }, icon: Icon(Icons.add)),
                    GestureDetector(onTap: () {
                      Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailsScreen(),
                    ),
                  );
                    },child: Text("Add a new Deal",style: TextStyle(fontSize: 17),))
                    ,Spacer()
                  ],
                ),
              
            
          
        ),

      
    );
  }
}