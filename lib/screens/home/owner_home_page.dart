import 'package:digital_dukan_minor_project/main.dart';
import 'package:digital_dukan_minor_project/models/user_type.dart';
import 'package:digital_dukan_minor_project/screens/my_orders/my_orders.dart';
import 'package:digital_dukan_minor_project/screens/owner_products/owner_products.dart';
import 'package:digital_dukan_minor_project/widget/drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OwnerHomePage extends StatefulWidget {
  const OwnerHomePage({Key? key}) : super(key: key);

  @override
  _OwnerHomePageState createState() => _OwnerHomePageState();
}

class _OwnerHomePageState extends State<OwnerHomePage> {
 static int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: ownerDrawerKey,
      drawer: Drawer1(UserType.owner),
      body: IndexedStack(
        index: _selectedIndex,
        children: <Widget>[
          OwnerProducts(),
          OwnerProducts(),
          MyOrders(true),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Products",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_rounded),
            label: "Profile",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: "Orders",
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
