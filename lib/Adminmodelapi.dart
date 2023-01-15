import 'dart:convert';

import 'package:yerper_admin/Admin.dart';

import 'api.dart';
import 'package:http/http.dart' as http;

class Adminapi {
  static Future<List<Admin>> getDeals() async {
    Map<String, String> headers = {"Content-type": "application/json"};
    var res = await http.get(Uri.parse(api + "/admin/get"), headers: headers);
    List _temp = [];
    for (var i in jsonDecode(res.body)) {
      _temp.add(i);
    }
    return Admin.dealsfromapi(_temp);
  }
}
