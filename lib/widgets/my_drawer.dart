import 'package:final_project/screens/category/category.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Container(
            height: 180,
            color: Colors.blue,
            child: DrawerHeader(
                child: Padding(
              padding: EdgeInsets.only(left: 8),
              child: (Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                      child: Icon(
                        IconData(61502, fontFamily: 'MaterialIcons'),
                        size: 80,
                        color: Colors.white,
                      ),
                      onTap: () {
                        // Navigator.of(context).push(MaterialPageRoute(builder: (context) => userAccount()));
                      }),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Welcome',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: GestureDetector(
                      child: Text(
                        'Log In / Sign Up',
                        style: TextStyle(color: Colors.white),
                      ),
                      onTap: () {
                        // Navigator.of(context).push(MaterialPageRoute(builder: (context) => Login()));
                      },
                    ),
                  )
                ],
              )),
            )),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Category()));
            },
            leading: Icon(Icons.local_offer),
            title: Text('Deals'),
          ),
          ListTile(
            // onTap:(){Navigator.of(context).push(MaterialPageRoute(builder: (context) => Categorie()))} ,
            leading: Icon(Icons.tv),
            title: Text('TVs'),
          ),
          ListTile(
            // onTap:(){Navigator.of(context).push(MaterialPageRoute(builder: (context) => Categorie()))} ,
            leading: Icon(Icons.watch),
            title: Text('Watches'),
          ),
          ListTile(
            // onTap:(){Navigator.of(context).push(MaterialPageRoute(builder: (context) => Categorie()))} ,
            leading: Icon(Icons.computer),
            title: Text('PC & Accessories'),
          ),
          ListTile(
            // onTap:(){Navigator.of(context).push(MaterialPageRoute(builder: (context) => Categorie()))} ,
            leading: Icon(Icons.phone_android),
            title: Text('Mobiles & Tablets'),
          ),
          ListTile(
            // onTap:(){Navigator.of(context).push(MaterialPageRoute(builder: (context) => Categorie()))} ,
            leading: Icon(Icons.electrical_services_outlined),
            title: Text('Electronics'),
          ),
          ListTile(
            // onTap:(){Navigator.of(context).push(MaterialPageRoute(builder: (context) => Categorie()))} ,
            leading: Icon(Icons.kitchen),
            title: Text('Kitchen'),
          ),
          ListTile(
            // onTap:(){Navigator.of(context).push(MaterialPageRoute(builder: (context) => Categorie()))} ,
            leading: Icon(Icons.beach_access_sharp),
            title: Text('Fashion'),
          ),
          ListTile(
            // onTap:(){Navigator.of(context).push(MaterialPageRoute(builder: (context) => Categorie()))} ,
            leading: Icon(Icons.sports_basketball),
            title: Text('Sports'),
          ),
          ListTile(
            // onTap:(){Navigator.of(context).push(MaterialPageRoute(builder: (context) => Categorie()))} ,
            leading: Icon(Icons.gamepad_outlined),
            title: Text('Games and Toys'),
          ),
        ],
      ),
    );
  }
}
