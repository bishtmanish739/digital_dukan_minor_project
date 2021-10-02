import 'package:digital_dukan_minor_project/screens/customer_register/customer_register.dart';
import 'package:digital_dukan_minor_project/screens/home/home_page.dart';
import 'package:digital_dukan_minor_project/screens/splash_screen.dart';
import 'package:digital_dukan_minor_project/screens/initial_screen/initial_screen.dart';
import 'package:digital_dukan_minor_project/screens/login/login.dart';
import 'package:digital_dukan_minor_project/screens/owner_register/owner_register.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Digital Dukaan',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/initialScreen': (context) => InitialScreen(),
        '/login': (context) => Login(),
        '/ownerRegister': (contaxt) => OwnerRegister(),
        '/customerRegister': (context) => CustomerRegister(),
        '/home': (context) => HomePage(),
      },
    );
  }
}
