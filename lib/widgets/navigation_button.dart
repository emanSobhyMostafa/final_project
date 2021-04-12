import 'package:final_project/widgets/card_screen.dart';
import 'package:final_project/screens/home/home_screen.dart';
import 'package:final_project/screens/profile/profile_screen.dart';
import 'package:flutter/material.dart';

class NavigaionButton extends StatefulWidget {
  @override
  _NavigaionButtonState createState() => _NavigaionButtonState();
}

class _NavigaionButtonState extends State<NavigaionButton> {
  int selectedPage = 0;

  final _pageOptions = [
    HomeScreen(),
    ProfileScreen(),
    CardScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _pageOptions[selectedPage],
        bottomNavigationBar: BottomNavigationBar(
          // currentIndex: 0, // this will be set when a new tab is tapped
          items: [
            BottomNavigationBarItem(
              icon: new Icon(Icons.home),
              title: new Text('Home'),
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.person), title: Text('Profile')),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart), title: Text('Card')),
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
        ));
  }
}
