import 'package:digital_dukan_minor_project/main.dart';
import 'package:digital_dukan_minor_project/models/user_type.dart';
import 'package:digital_dukan_minor_project/screens/my_orders/completed_orders.dart';
import 'package:digital_dukan_minor_project/screens/my_orders/rejected_orders.dart';
import 'package:digital_dukan_minor_project/screens/profile_screen/customer_profile.dart';
import 'package:digital_dukan_minor_project/screens/profile_screen/owner_profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:share/share.dart';

class Drawer1 extends StatefulWidget {
  final UserType type;
  Drawer1(this.type);

  @override
  State<Drawer1> createState() => _Drawer1State();
}

class _Drawer1State extends State<Drawer1> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
              margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
              height: 180,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(
                    Icons.person_rounded,
                    size: 50,
                  ),
                  Center(
                    child: Text(
                      box.get('name'),
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Divider(
                    thickness: 2,
                  )
                ],
              )),
             
           ListTile(
            title: Text(
              'Completed Orders',
            ),
            onTap: () {
              Navigator.pop(context);
                     Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CompletedOrders(UserType.owner==widget.type)));
            },
            leading: Icon(
              Icons.shop,
            ),
          ),
           ListTile(
            title: Text(
              'Rejected Orders',
            ),
            onTap: () {
              Navigator.pop(context);
                     Navigator.push(context,
                    MaterialPageRoute(builder: (context) => RejectedOrders(UserType.owner==widget.type)));
            },
            leading: Icon(
              Icons.shop,
            ),
          ),
          ListTile(
            title: Text(
              'Profile ',
            ),
            onTap: () {
              Navigator.pop(context);
              if (widget.type == UserType.customer)
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CustomerProfile()));
              else
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => OwnerProfile()));
            },
            leading: Icon(Icons.person),
          ),
          ListTile(
            title: Text(
              'Share This App',
            ),
            onTap: () {
              Navigator.pop(context);
              shareApp();
            },
            leading: Icon(
              Icons.share,
            ),
          ),
          ListTile(
            title: Text(
              'Logout',
            ),
            leading: Icon(
              Icons.logout,
            ),
            onTap: () {
              box.delete('phone');
              box.delete('type');

              Navigator.of(context).pushNamedAndRemoveUntil(
                  '/initialScreen', (Route<dynamic> route) => false);
            },
          ),
        ],
      ),
    );
  }

  void shareApp() {
    Share.share("Try the Digital Store App," +
        " it is developed to help both shop owners & buyers, find you nearby shops & enjoy shopping" +
        "\n  APP_LINK ");
  }
}
