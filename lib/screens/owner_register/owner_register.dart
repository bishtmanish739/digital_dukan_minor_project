import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OwnerRegister extends StatelessWidget {
  OwnerRegister({Key? key}) : super(key: key);
  final TextEditingController phoneNumberController =
      new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Digital Dukaan"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "Register as shop owner",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: phoneNumberController,
                  decoration: new InputDecoration(
                    prefixIcon: Icon(Icons.phone),
                    border: new OutlineInputBorder(
                      borderSide: new BorderSide(color: Colors.grey[300]!),
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
                      borderSide: new BorderSide(color: Colors.grey[300]!),
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(305.0),
                      ),
                    ),
                    hintText: "password",
                    labelText: "password",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: phoneNumberController,
                  decoration: new InputDecoration(
                    prefixIcon: Icon(Icons.shop),
                    border: new OutlineInputBorder(
                      borderSide: new BorderSide(color: Colors.grey[300]!),
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(305.0),
                      ),
                    ),
                    hintText: "shop name",
                    labelText: "shop name",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: phoneNumberController,
                  decoration: new InputDecoration(
                    prefixIcon: Icon(Icons.location_city),
                    border: new OutlineInputBorder(
                      borderSide: new BorderSide(color: Colors.grey[300]!),
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(305.0),
                      ),
                    ),
                    hintText: "city",
                    labelText: "city",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: phoneNumberController,
                  decoration: new InputDecoration(
                    prefixIcon: Icon(Icons.location_city),
                    border: new OutlineInputBorder(
                      borderSide: new BorderSide(color: Colors.grey[300]!),
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(305.0),
                      ),
                    ),
                    hintText: "state",
                    labelText: "state",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: phoneNumberController,
                  decoration: new InputDecoration(
                    prefixIcon: Icon(Icons.code),
                    border: new OutlineInputBorder(
                      borderSide: new BorderSide(color: Colors.grey[300]!),
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(305.0),
                      ),
                    ),
                    hintText: "zip",
                    labelText: "zip",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: phoneNumberController,
                  decoration: new InputDecoration(
                    prefixIcon: Icon(Icons.payment),
                    border: new OutlineInputBorder(
                      borderSide: new BorderSide(color: Colors.grey[300]!),
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(305.0),
                      ),
                    ),
                    hintText: "UPI",
                    labelText: "UPI",
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
                    "Register",
                    style: TextStyle(fontSize: 16, color: Colors.green),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
