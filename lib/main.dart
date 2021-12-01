import 'package:digital_dukan_minor_project/bloc/cart_bloc/cart_bloc.dart';
import 'package:digital_dukan_minor_project/bloc/fetch_orders/fetch_orders_bloc.dart';
import 'package:digital_dukan_minor_project/bloc/fetch_products/fetch_products_bloc.dart';
import 'package:digital_dukan_minor_project/bloc/list_of_shops/list_of_shops_bloc.dart';
import 'package:digital_dukan_minor_project/bloc/login_bloc/login_bloc.dart';
import 'package:digital_dukan_minor_project/bloc/product_details/product_details_bloc.dart';
import 'package:digital_dukan_minor_project/bloc/profile_bloc/profile_bloc.dart';
import 'package:digital_dukan_minor_project/bloc/register_bloc/register_bloc.dart';
import 'package:digital_dukan_minor_project/models/user_type.dart';
import 'package:digital_dukan_minor_project/repository/fetch_products_repo.dart';
import 'package:digital_dukan_minor_project/repository/fetch_shops.dart';
import 'package:digital_dukan_minor_project/repository/login_repo.dart';
import 'package:digital_dukan_minor_project/repository/order_repo.dart';
import 'package:digital_dukan_minor_project/repository/owner_register_repo.dart';
import 'package:digital_dukan_minor_project/repository/product_details_repo.dart';
import 'package:digital_dukan_minor_project/screens/add_product/add_product.dart';
import 'package:digital_dukan_minor_project/screens/customer_register/customer_register.dart';
import 'package:digital_dukan_minor_project/screens/home/customer_home_page.dart';
import 'package:digital_dukan_minor_project/screens/home/owner_home_page.dart';
import 'package:digital_dukan_minor_project/screens/login/customer_login.dart';
import 'package:digital_dukan_minor_project/screens/splash_screen.dart';
import 'package:digital_dukan_minor_project/screens/initial_screen/initial_screen.dart';
import 'package:digital_dukan_minor_project/screens/login/owner_login.dart';
import 'package:digital_dukan_minor_project/screens/owner_register/owner_register.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

final navigatorKey = GlobalKey<NavigatorState>();
GlobalKey<ScaffoldState> customerDrawerKey = new GlobalKey<ScaffoldState>();
GlobalKey<ScaffoldState> ownerDrawerKey = new GlobalKey<ScaffoldState>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await registerHive();

  runApp(MyApp());
}

late Box box;
Future registerHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter(UserTypeAdapter());
  box = await Hive.openBox('store');
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CartBloc>(
          create: (BuildContext context) => CartBloc(),
        ), 
        BlocProvider<ProfileBloc>(
          create: (BuildContext context) => ProfileBloc(),
        ),
        BlocProvider<FetchProductsBloc>(
          create: (BuildContext context) =>
              FetchProductsBloc(FetchProductRepo()),
        ),
        BlocProvider<RegisterBloc>(
          create: (BuildContext context) => RegisterBloc(RegisterRepo()),
        ),
        BlocProvider<LoginBloc>(
          create: (BuildContext context) => LoginBloc(LoginRepo()),
        ),
        BlocProvider<ProductDetailsBloc>(
          create: (BuildContext context) =>
              ProductDetailsBloc(ProductDetailsRepo()),
        ),
        BlocProvider<ListOfShopsBloc>(
          create: (BuildContext context) => ListOfShopsBloc(FetchShopsRepo()),
        ),
        BlocProvider<FetchOrdersBloc>(
          create: (BuildContext context) => FetchOrdersBloc(OrderRepo()),
        ),
      ],
      child: MaterialApp(
        navigatorKey: navigatorKey,
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
          '/home': (context) => CustomerHomePage(),
          '/ownerHome': (context) => OwnerHomePage(),
        },
      ),
    );
  }
}
