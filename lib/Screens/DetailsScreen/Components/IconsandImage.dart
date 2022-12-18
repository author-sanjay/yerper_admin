// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, file_names, unused_import, must_be_immutable, prefer_typing_uninitialized_variables, unnecessary_this

import 'package:flutter/material.dart';
import 'package:yerper_admin/Screens/DetailsScreen/Components/Image.dart';
import 'package:yerper_admin/Screens/DetailsScreen/Components/LeftIcons.dart';

class ImageAndIcons extends StatelessWidget {
  var photourl;

  

  ImageAndIcons({Key? key, required this.size,required this.photourl})
      : super(key: key);

  Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: size.height * 0.6,
        child: Center(
            child: Images(
          size: size,
          photo: this.photourl,
        )));
  }
}
