// import 'package:final_project/screens/card/card_screen.dart';
// import 'package:final_project/screens/home/home_screen.dart';
// import 'package:final_project/screens/profile/profile_screen.dart';
// import 'package:flutter/material.dart';

// class NavigaionButton extends StatefulWidget {
//   final int selectedPage;

//   const NavigaionButton({Key key, this.selectedPage}) : super(key: key);
//   @override
//   _NavigaionButtonState createState() => _NavigaionButtonState();
// }

// class _NavigaionButtonState extends State<NavigaionButton> {
//   @override
//   Widget build(BuildContext context) {
//     return BottomNavigationBar(
//       // currentIndex: 0, // this will be set when a new tab is tapped
//       items: [
//         BottomNavigationBarItem(
//           icon: new Icon(Icons.home),
//           title: new Text('Home'),
//         ),
//         BottomNavigationBarItem(
//             icon: Icon(Icons.person), title: Text('Profile')),
//         BottomNavigationBarItem(
//             icon: Icon(Icons.shopping_cart), title: Text('Card')),
//       ],
//       selectedItemColor: Colors.blue,
//       elevation: 5.0,
//       unselectedItemColor: Colors.grey,
//       currentIndex: widget.selectedPage,
//       backgroundColor: Colors.white,
//       onTap: (index) {
//         setState(() {
//           this.widget.selectedPage = index;
//         });
//       },
//     );
//   }
// }
