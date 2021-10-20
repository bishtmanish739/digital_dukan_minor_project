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
    return Container(
      decoration: BoxDecoration(
        color: Colors.green,
        border: Border.all(
            color: Colors.white12, width: 2, style: BorderStyle.solid),
        borderRadius: BorderRadius.circular(20),
      ),
      width: 250,
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
                    color: Colors.white,
                  ),
                  Center(
                    child: Text(
                      'Dukandaar singh',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Divider(
                    color: Colors.white,
                    thickness: 2,
                  )
                ],
              )),
          ListTile(
            title: Text(
              'Home',
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {},
            leading: Icon(Icons.home, color: Colors.white),
          ),
          ListTile(
            title: Text(
              'Nearby Shop',
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {},
            leading: Icon(Icons.shop, color: Colors.white),
          ),
          ListTile(
            title: Text(
              'My Cart',
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {},
            leading: Icon(Icons.shopping_cart, color: Colors.white),
          ),
          ListTile(
            title: Text(
              'Setting ',
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {},
            leading: Icon(Icons.settings, color: Colors.white),
          ),
          ListTile(
            title: Text(
              'Share This App',
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {},
            leading: Icon(Icons.share, color: Colors.white),
          ),
          ListTile(
            title: Text(
              'Logout',
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {
              box.delete('phone');
              box.delete('type');

              Navigator.of(context).pushNamedAndRemoveUntil(
                  '/initialScreen', (Route<dynamic> route) => false);
            },
            leading: Icon(Icons.share, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
