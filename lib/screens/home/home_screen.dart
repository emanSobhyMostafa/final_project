import 'package:final_project/config/theme_colors.dart';
import 'package:final_project/screens/card/cart_screen.dart';
import 'package:final_project/screens/home/widgets/main_categories.dart';
import 'package:final_project/screens/home/widgets/slider_widget.dart';
import 'package:final_project/screens/profile/register_screen.dart';
import 'package:final_project/widgets/my_app_bar.dart';
import 'package:final_project/widgets/my_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedPage = 0;

  final _pageOptions = [
    SingleChildScrollView(
      child: Column(
        children: [
          ImageSliderDemo(),
          MainCategories(),
        ],
      ),
    ),
    RegisterScreen(),
    CardScreen(),
  ];
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
              badgeContent: Text('3'),
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
