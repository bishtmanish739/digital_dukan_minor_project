import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';

class CustomerCart extends StatefulWidget {
  const CustomerCart({Key? key}) : super(key: key);

  @override
  _CustomerCartState createState() => _CustomerCartState();
}

class _CustomerCartState extends State<CustomerCart> {
  List _items = [];
  num total = 0;
  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('data/customer_cart.json');
    final data = await json.decode(response);
    List product = data["items"];
    for (int i = 0; i < product.length; i++) {
      total += (product[i]["price"] * product[i]["quantity"]);
    }
    setState(() {
      _items = data["items"];
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
    return _items.length > 0
        ? Expanded(
            child: ListView.builder(
              itemCount: _items.length + 1,
              itemBuilder: (context, index) {
                return (index == _items.length)
                    ? Column(
                        children: [
                          Container(
                            margin: EdgeInsets.all(5),
                            alignment: Alignment.centerRight,
                            child: Text(
                              'total Price = ' + total.toString() + " ₹ ",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text(
                                          'Your Order Placed successfully')));
                            },
                            child: Container(
                              margin: EdgeInsets.all(20),
                              height: 80,
                              width: 200,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Colors.blue[200],
                                  borderRadius: BorderRadius.circular(5)),
                              child: Text(
                                'Order Now $total  ₹ ',
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          )
                        ],
                      )
                    : Container(
                        height: 150,
                        decoration: BoxDecoration(
                            color: Colors.blue[200],
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
                                  _items[index]["image"],
                                ),
                              ),
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    _items[index]["name"],
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        "Price " +
                                            _items[index]["price"].toString() +
                                            " ₹ ",
                                        style: TextStyle(
                                            color: Colors.black87,
                                            fontSize: 14),
                                      ),
                                      Text(
                                        "Qty " +
                                            _items[index]["quantity"]
                                                .toString(),
                                        style: TextStyle(
                                            color: Colors.black87,
                                            fontSize: 12),
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
