// ignore_for_file: prefer_const_constructors, file_names

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:yerper_admin/Screens/service/storageservice.dart';

import '../../../constants.dart';

class Images extends StatefulWidget {
  const Images({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  State<Images> createState() => _ImagesState();
}

class _ImagesState extends State<Images> {
  String? imgurl = null;
  @override
  Widget build(BuildContext context) {
    final Storage storage = Storage();
    return Container(
        height: widget.size.height * 0.8,
        width: widget.size.width * 0.75,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(63), bottomLeft: Radius.circular(63)),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 10),
                blurRadius: 60,
                color: kprimarycolor.withOpacity(0.29)),
          ],
        ),
        child: (imgurl == null)
            ? ElevatedButton(
                onPressed: () async {
                  final results = await FilePicker.platform.pickFiles(
                    allowMultiple: false,
                    type: FileType.image,
                  );
                  if (results == null) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("File not selected"),
                    ));
                    return null;
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("File selected"),
                    ));
                  }
                  final path = results.files.single.path;
                  final filename = results.files.single.name;
                  // ignore: avoid_print
                  storage.uploadfile(path!, filename).then(((result) {
                    imgurl = result;

                    setState(() {});
                  }));
                },
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(kbackgroundColor)),
                child: Text(
                  "Upload\nImage",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 32,
                      fontWeight: FontWeight.w300),
                ),
              )
            : Image.network(imgurl!));
  }
}
