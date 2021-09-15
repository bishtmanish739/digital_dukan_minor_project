import 'package:digital_dukan_minor_project/HomePage.dart';
import 'package:digital_dukan_minor_project/LoginPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterUser extends StatefulWidget {
  const RegisterUser({Key? key}) : super(key: key);

  @override
  _RegisterUserState createState() => _RegisterUserState();
}

class _RegisterUserState extends State<RegisterUser> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Digital Dukaan',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(color: Color(0xFF92A5F5)),
          child: Container(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.all(5),
                    padding: EdgeInsets.all(10),
                    height: 60,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.black,
                          width: 2,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Email',
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        icon: Icon(
                          Icons.email,
                          color: Colors.white,
                        ),
                      ),
                      style: TextStyle(
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
                  Container(
                    height: 60,
                    margin: EdgeInsets.all(5),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.black,
                          width: 2,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      obscureText: true,
                      obscuringCharacter: "*",
                      decoration: InputDecoration(
                        hintText: "Enter password",
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        icon: Icon(
                          Icons.lock,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 60,
                    margin: EdgeInsets.all(5),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.black,
                          width: 2,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      obscureText: true,
                      obscuringCharacter: "*",
                      decoration: InputDecoration(
                        hintText: "Confirm password",
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        icon: Icon(
                          Icons.lock,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 60,
                    width: 220,
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      border: Border.all(
                          color: Colors.black,
                          width: 2,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                        child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (_) => HomePage()));
                      },
                      child: Text(
                        'RAGISTER',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    )),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Text(
                          'Already Registered ? ',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.of(context).push(
                                MaterialPageRoute(builder: (_) => LoginPage()));
                          },
                          child: Text(
                            'Click Here to Login',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
