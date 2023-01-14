// ignore_for_file: file_names, prefer_interpolation_to_compose_strings, unused_local_variable, prefer_const_constructors, use_build_context_synchronously, avoid_returning_null_for_void, avoid_print, sort_child_properties_last, duplicate_ignore

import 'dart:convert';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import 'package:yerper_admin/constants.dart';
import 'package:http/http.dart' as http;
import '../../api.dart';
import '../HomeScreen/HomeScreen.dart';
import '../LoginScreen/LoginScreen.dart';
import '../service/storageservice.dart';

class CardBody extends StatefulWidget {
  const CardBody({super.key});

  @override
  State<CardBody> createState() => _CardBodyState();
}

class _CardBodyState extends State<CardBody> {
  late String? photo;
  late String name = "";
  Map<String, String> headers = {"Content-type": "application/json"};
  Future<void> uploadcard(String name, String photo) async {
    final json = jsonEncode({
      "name": name,
      "photo": photo,
    });
    var res = await http.post(Uri.parse(api + "/cards/add"),
        headers: headers, body: json);

    try {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ),
      );
    } catch (_) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LoginScreen(),
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    photo = null;
  }

  @override
  Widget build(BuildContext context) {
    final Storage storage = Storage();
    return SingleChildScrollView(
      child: SafeArea(
        child: Container(
          color: kprimarycolor,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
              ),
              Text(
                "Add Card",
                style: TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                    fontWeight: FontWeight.w300),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.06,
              ),
              Container(
                  child: photo == null
                      ? GestureDetector(
                          onTap: () async {
                            final results = await FilePicker.platform.pickFiles(
                              allowMultiple: false,
                              type: FileType.image,
                            );
                            if (results == null) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text("File not selected"),
                              ));
                              return null;
                            } else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text("File selected"),
                              ));
                            }
                            final path = results.files.single.path;
                            final filename = results.files.single.name;
                            // ignore: avoid_print
                            storage.uploadfile(path!, filename).then(((result) {
                              // deals("", "", "", "", "", "", 0, widget.photourl!);

                              setState(() {
                                photo = result;
                                // widget.photo = result;
                                print(photo);
                              });
                            }));
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: Container(
                              // color: Colors.black,
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 191, 214, 235),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              width: MediaQuery.of(context).size.width * 0.9,
                              height: MediaQuery.of(context).size.height * 0.2,
                              child: Center(
                                  child: Text(
                                "Upload Image",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w300),
                              )),
                            ),
                          ))
                      : SizedBox(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: MediaQuery.of(context).size.height * 0.3,
                          child: Image.network(
                            photo!,
                          ))),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.06,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Container(
                  margin: EdgeInsets.only(top: 10),
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Row(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius:
                                BorderRadius.all(Radius.circular(18))),
                        child: Icon(
                          Icons.label,
                          color: Colors.lightBlue[900],
                        ),
                        padding: EdgeInsets.all(12),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            TextField(
                              onChanged: (value) {
                                name = value;
                              },
                              decoration:
                                  InputDecoration(labelText: "Name Of Card"),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.06,
              ),
              ElevatedButton(
                onPressed: () {
                  // print(name);
                  uploadcard(name, photo.toString());
                },
                child: Text("Upload Card"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
