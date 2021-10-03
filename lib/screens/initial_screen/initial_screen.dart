import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InitialScreen extends StatelessWidget {
  InitialScreen({Key? key}) : super(key: key);
  final TextEditingController phoneNumberController =
      new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Digital Dukaan"),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Center(
            child: Container(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        "Welcome to Digital Dukaan",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 12.0, bottom: 12.0),
                      width: 300,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            shape: new RoundedRectangleBorder(
                                side: BorderSide(color: Colors.green),
                                borderRadius: new BorderRadius.circular(8.0))),
                        onPressed: () {
                          Navigator.pushNamed(context, '/ownerRegister');
                        },
                        child: new Text(
                          "Register as shop owner",
                          style: TextStyle(fontSize: 16, color: Colors.green),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 12.0, bottom: 12.0),
                      width: 300,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            shape: new RoundedRectangleBorder(
                                side: BorderSide(color: Colors.green),
                                borderRadius: new BorderRadius.circular(8.0))),
                        onPressed: () {
                          Navigator.pushNamed(context, '/customerRegister');
                        },
                        child: new Text(
                          "Register as customer",
                          style: TextStyle(fontSize: 16, color: Colors.green),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 12.0, bottom: 12.0),
                      width: 300,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            shape: new RoundedRectangleBorder(
                                side: BorderSide(color: Colors.green),
                                borderRadius: new BorderRadius.circular(8.0))),
                        onPressed: () {
                          Navigator.pushNamed(context, '/ownerLogin');
                        },
                        child: new Text(
                          "Login as shop owner",
                          style: TextStyle(fontSize: 16, color: Colors.green),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 12.0, bottom: 12.0),
                      width: 300,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            shape: new RoundedRectangleBorder(
                                side: BorderSide(color: Colors.green),
                                borderRadius: new BorderRadius.circular(8.0))),
                        onPressed: () {
                          Navigator.pushNamed(context, '/customerLogin');
                        },
                        child: new Text(
                          "Login as customer",
                          style: TextStyle(fontSize: 16, color: Colors.green),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
