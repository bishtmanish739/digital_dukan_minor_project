import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomerHome extends StatefulWidget {
  const CustomerHome({Key? key}) : super(key: key);

  @override
  _CustomerHomeState createState() => _CustomerHomeState();
}

class _CustomerHomeState extends State<CustomerHome> {
  List _shops = [];
  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('data/nearby_shop.json');
    final data = await json.decode(response);
    setState(() {
      _shops = data["shops"];
    });
  }

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    readJson();
  }

  @override
  Widget build(BuildContext context) {
    return _shops.length > 0
        ? Expanded(
            child: ListView.builder(
              itemCount: _shops.length,
              itemBuilder: (context, index) {
                return Container(
                  height: 150,
                  decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.circular(19)),
                  margin: EdgeInsets.all(5),
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(5, 5, 0, 0),
                        padding: EdgeInsets.fromLTRB(5, 5, 0, 0),
                        width: 100,
                        child: Container(
                          padding: EdgeInsets.all(5),
                          height: 100,
                          decoration: BoxDecoration(
                              color: Colors.black12,
                              borderRadius: BorderRadius.circular(5)),
                          child: Image.network(
                            _shops[index]["shopimage"],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              _shops[index]["name"],
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Icon(
                                  CupertinoIcons.location,
                                  color: Colors.black,
                                ),
                                Text(
                                  _shops[index]["address"],
                                  style: TextStyle(
                                      color: Colors.black54, fontSize: 12),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          )
        : Container();
  }
}
