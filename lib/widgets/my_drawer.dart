import 'package:final_project/bloc/main_bloc.dart';
import 'package:final_project/config/theme_colors.dart';
import 'package:final_project/screens/category/category.dart';
import 'package:final_project/screens/orders/orders_screen.dart';
import 'package:final_project/screens/profile/profile_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyDrawer extends StatelessWidget {
  final FirebaseAuth auth = FirebaseAuth.instance;
  User user;
  void inputData() {
    user = auth.currentUser;

    // here you write the codes to input the data into firestore
  }

  @override
  Widget build(BuildContext context) {
    inputData();
    final allCategories =
        BlocProvider.of<MainBloc>(context).state.allCategoriesNames;
    return Drawer(
      child: ListView(
        children: [
          Container(
            height: 180,
            color: primary,
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
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => Profile()));
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
                        user != null ? user.email : 'Log In / Sign Up',
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
            // leading: Icon(Icons.local_offer),
            title: Text('Deals'),
          ),
          ...allCategories
              .map(
                (e) => ListTile(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Category(
                              categoryName: e,
                            )));
                  },
                  // leading: Icon(Icons.tv),
                  title: Text(e.split('-')[0]),
                ),
              )
              .toList(),
          ListTile(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => MyOrders()));
            },
            // leading: Icon(Icons.article_outlined),
            title: Text('My Orders'),
          ),
        ],
      ),
    );
  }
}
