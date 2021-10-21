import 'package:digital_dukan_minor_project/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class Drawer1 extends StatefulWidget {
  const Drawer1({Key? key}) : super(key: key);

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
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Divider(
                    thickness: 2,
                  )
                ],
              )),
          ListTile(
            title: Text(
              'Home',
            ),
            onTap: () {},
            leading: Icon(Icons.home,),
          ),
          ListTile(
            title: Text(
              'Nearby Shop',
            ),
            onTap: () {},
            leading: Icon(Icons.shop,),
          ),
          ListTile(
            title: Text(
              'My Cart',
            ),
            onTap: () {},
            leading: Icon(Icons.shopping_cart),
          ),
          ListTile(
            title: Text(
              'Setting ',
            ),
            onTap: () {},
            leading: Icon(Icons.settings,),
          ),
          ListTile(
            title: Text(
              'Share This App',
            ),
            onTap: () {},
            leading: Icon(Icons.share,),
          ),
          ListTile(
            title: Text(
              'Logout',
            ),
            leading: Icon(Icons.logout,),
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
}
