import 'package:digital_dukan_minor_project/customer_cart.dart';
import 'package:digital_dukan_minor_project/customer_home.dart';
import 'package:digital_dukan_minor_project/main.dart';
import 'package:digital_dukan_minor_project/screens/cart_screen/cart_screen.dart';
import 'package:digital_dukan_minor_project/screens/list_of_shops/list_of_shops.dart';
import 'package:digital_dukan_minor_project/screens/my_orders/my_orders.dart';
import 'package:digital_dukan_minor_project/widget/drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomerHomePage extends StatefulWidget {
  const CustomerHomePage({Key? key}) : super(key: key);

  @override
  _CustomerHomePageState createState() => _CustomerHomePageState();
}

class _CustomerHomePageState extends State<CustomerHomePage> {
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  double s = 60;
  double initial = 60;

  static List<Widget> _widgetOptions = <Widget>[
    ListOfShops(),
    Text(
      'Profile',
      style: optionStyle,
    ),
    CartScreen(),
    MyOrders(false),
  ];
  static int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: customerDrawerKey,
      drawer: Drawer1(),
      body: IndexedStack(
        index: _selectedIndex,
        children: <Widget>[
          ListOfShops(),
          Text(
            'Profile',
            style: optionStyle,
          ),
          CartScreen(),
          MyOrders(false),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_rounded),
            label: "Profile",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shop),
            label: "Orders",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.airport_shuttle_rounded),
            label: "Track Orders",
          ),
        ],
        currentIndex: _selectedIndex,
        fixedColor: Colors.green[800],
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
