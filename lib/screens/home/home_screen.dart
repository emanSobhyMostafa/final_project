import 'package:final_project/screens/card/card_screen.dart';
import 'package:final_project/screens/home/widgets/main_categories.dart';
import 'package:final_project/screens/home/widgets/slider_widget.dart';
import 'package:final_project/screens/profile/profile_screen.dart';
import 'package:final_project/widgets/my_app_bar.dart';
import 'package:final_project/widgets/my_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../widgets/navigation_button.dart';
import 'package:google_fonts/google_fonts.dart';

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
    ProfileScreen(),
    CardScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:  Size.fromHeight(120),
        child: MyAppBar( isFromHome: true),
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
            icon: Icon(Icons.shopping_cart),
            label: "Cart",
          ),
        ],
        selectedItemColor: Colors.blue,
        elevation: 5.0,
        unselectedItemColor: Colors.grey,
        currentIndex: selectedPage,
        backgroundColor: Colors.white,
        onTap: (index) {
          setState(() {
            selectedPage = index;
          });
        },
      ),
    );
  }
}
