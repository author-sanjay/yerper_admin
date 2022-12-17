// ignore_for_file: non_constant_identifier_names
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_core/firebase_core.dart' as firebase_core;

class Storage {
  final firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;
  Future<void> uploadfile(String filepath, String filename) async {
    File file = File(filepath);
    try {
      await storage.ref('test/$filename').putFile(file);
    } on firebase_core.FirebaseException catch (e) {
      print(e);
    }
  }

  Future<String> URL(String filename) {
    return  firebase_storage.FirebaseStorage.instance
        .ref('/test')
        .child(filename)
        .getDownloadURL();
    // print(downloadURL);
    
  }
}
