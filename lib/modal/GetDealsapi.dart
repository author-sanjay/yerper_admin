// ignore_for_file: unused_local_variable

import 'dart:convert';

import 'package:yerper_admin/api.dart';
import 'package:yerper_admin/modal/GetDeals.dart';
import 'package:http/http.dart' as http;

class Getdealsapi {
  static Future<List<GetDeals>> getDeals() async {
    Map<String, String> headers = {"Content-type": "application/json"};
    var res = await http.get(Uri.parse(api + "/deals/getall"));

    List _temp = [];
    // print(jsonDecode(res.body));
    for (var i in jsonDecode(res.body)) {
      _temp.add(i);
      // print(i);
    }

    return GetDeals.dealsfromapi(_temp);
  }
}
