import 'package:digital_dukan_minor_project/bloc/login_bloc/login_bloc.dart';
import 'package:digital_dukan_minor_project/bloc/register_bloc/register_bloc.dart';
import 'package:digital_dukan_minor_project/repository/login_repo.dart';
import 'package:digital_dukan_minor_project/repository/owner_register_repo.dart';
import 'package:digital_dukan_minor_project/screens/customer_register/customer_register.dart';
import 'package:digital_dukan_minor_project/screens/home/home_page.dart';
import 'package:digital_dukan_minor_project/screens/login/customer_login.dart';
import 'package:digital_dukan_minor_project/screens/splash_screen.dart';
import 'package:digital_dukan_minor_project/screens/initial_screen/initial_screen.dart';
import 'package:digital_dukan_minor_project/screens/login/owner_login.dart';
import 'package:digital_dukan_minor_project/screens/owner_register/owner_register.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RegisterBloc>(
          create: (BuildContext context) => RegisterBloc(RegisterRepo()),
        ),
        BlocProvider<LoginBloc>(
          create: (BuildContext context) => LoginBloc(LoginRepo()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Digital Dukaan',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => SplashScreen(),
          '/initialScreen': (context) => InitialScreen(),
          '/login': (context) => OwnerLogin(),
          '/ownerRegister': (contaxt) => OwnerRegister(),
          '/customerRegister': (context) => CustomerRegister(),
          '/ownerLogin': (contaxt) => OwnerLogin(),
          '/customerLogin': (context) => CustomerLogin(),
          '/home': (context) => HomePage(),
        },
      ),
    );
  }
}
