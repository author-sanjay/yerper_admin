import 'package:flutter/material.dart';
import 'package:yerper_admin/Screens/HomeScreen/HomeScreen.dart';
import 'package:yerper_admin/api.dart';
import 'package:yerper_admin/constants.dart';
import 'package:http/http.dart' as http;
import 'package:yerper_admin/modal/GetCards.dart';
import 'package:yerper_admin/modal/GetCardsApi.dart';

import '../LoginScreen/Components/LoginFields.dart';

class DeleteCard extends StatelessWidget {
  const DeleteCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DeleteBody(),
    );
  }
}

class DeleteBody extends StatefulWidget {
  const DeleteBody({
    super.key,
  });

  @override
  State<DeleteBody> createState() => _DeleteBodyState();
}

class _DeleteBodyState extends State<DeleteBody> {
  late List<GetCards> _getdeals;
  bool _isloading = true;

  @override
  void initState() {
    super.initState();
    getDeals();
  }

  Future<void> delete(int id) async {
    Map<String, String> headers = {
      "Content-type": "application/json",
      "Authorization": "Bearer " + TextFields.token.toString(),
    };
    var res = await http.delete(
        Uri.parse(api + "/cards/delete/" + id.toString()),
        headers: headers);

    print(res.statusCode);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HomeScreen(),
      ),
    );
  }

  Future<void> getDeals() async {
    _getdeals = await GetCardApi.getCards();
    setState(() {
      _isloading = false;
    });
    print(_getdeals);
  }

  @override
  Widget build(BuildContext context) {
    return _isloading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 30, bottom: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20)),
                        color: kprimarycolor),
                    child: Center(
                        child: Text(
                      "Delete Cards",
                      style: TextStyle(fontSize: 17, color: Colors.white),
                    )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Text(
                      "Tap On Card To Delete",
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w300),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        for (var i in _getdeals)
                          GestureDetector(
                            onTap: () {
                              delete(i.id);
                            },
                            child: Container(
                              margin: EdgeInsets.all(20),
                              child: Image(image: NetworkImage(i.images)),
                            ),
                          )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
  }
}
