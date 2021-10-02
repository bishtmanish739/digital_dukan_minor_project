import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);
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
            child: Container(
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Login",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: phoneNumberController,
                        decoration: new InputDecoration(
                          prefixIcon: Icon(Icons.phone),
                          border: new OutlineInputBorder(
                            borderSide:
                                new BorderSide(color: Colors.grey[300]!),
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(305.0),
                            ),
                          ),
                          hintText: "phone number",
                          labelText: "phone number",
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: phoneNumberController,
                        decoration: new InputDecoration(
                          prefixIcon: Icon(Icons.password),
                          border: new OutlineInputBorder(
                            borderSide:
                                new BorderSide(color: Colors.grey[300]!),
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(305.0),
                            ),
                          ),
                          hintText: "password",
                          labelText: "password",
                        ),
                      ),
                    ),
                    Container(
                      width: 140,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            shape: new RoundedRectangleBorder(
                                side: BorderSide(color: Colors.green),
                                borderRadius: new BorderRadius.circular(30.0))),
                        onPressed: () {
                          Navigator.pushNamed(context, '/home');
                        },
                        child: new Text(
                          "Login",
                          style: TextStyle(fontSize: 16, color: Colors.green),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
