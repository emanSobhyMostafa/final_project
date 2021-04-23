import 'package:final_project/bloc/main_bloc.dart';
import 'package:final_project/bloc/main_event.dart';
import 'package:final_project/config/theme_colors.dart';
import 'package:final_project/screens/cart/cart_screen.dart';
import 'package:final_project/screens/home/widgets/home_main.dart';
import 'package:final_project/screens/home/widgets/main_categories.dart';
import 'package:final_project/screens/home/widgets/slider_widget.dart';
import 'package:final_project/screens/profile/login_screen.dart';
import 'package:final_project/screens/profile/register_screen.dart';
import 'package:final_project/widgets/my_app_bar.dart';
import 'package:final_project/widgets/my_drawer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:final_project/screens/profile/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  User user;

  int selectedPage = 0;

  List<dynamic> _pageOptions = [
    HomeMain(),
    RegisterScreen(),
    CardScreen(),
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (auth.currentUser != null) {
      _pageOptions = [
        HomeMain(),
        Profile(),
        CardScreen(),
      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(120),
        child: MyAppBar(isFromHome: true, title: 'مضمون-Madmoon'),
      ),
      drawer: MyDrawer(),
      body: _pageOptions[selectedPage],
      bottomNavigationBar: BottomNavigationBar(
        // currentIndex: 0, // this will be set when a new tab is tapped
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
          BottomNavigationBarItem(
            icon: Badge(
              badgeColor: third,
              badgeContent: Text(
                '3',
                style: TextStyle(color: white),
              ),
              child: Icon(Icons.shopping_cart),
            ),
            label: "Cart",
          ),
        ],
        selectedItemColor: Colors.white,
        elevation: 5.0,

        unselectedItemColor: Colors.grey[400].withOpacity(.8),
        currentIndex: selectedPage,
        backgroundColor: primary,
        onTap: (index) {
          setState(() {
            selectedPage = index;
          });
        },
      ),
    );
  }
}
