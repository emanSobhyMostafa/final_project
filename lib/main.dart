import 'package:final_project/screens/home/home_screen.dart';
import 'package:final_project/screens/home/widgets/slider_widget.dart';
import 'package:final_project/widgets/navigation_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primaryColor: Colors.blue,
          accentColor: Colors.black,
          textTheme: GoogleFonts.latoTextTheme(
            Theme.of(context).textTheme,
          )),
      home: HomeScreen(),
    );
  }
}
