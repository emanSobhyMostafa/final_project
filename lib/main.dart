import 'package:final_project/config/routes.dart';
import 'package:final_project/screens/home/home_screen.dart';
import 'package:final_project/screens/profile/login_screen.dart';
import 'package:final_project/screens/profile/register_screen.dart';
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
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.blue,
          accentColor: Colors.black,
          textTheme: GoogleFonts.latoTextTheme(
            Theme.of(context).textTheme,
          )),
      home: HomeScreen(),
      routes: routes,
    );
  }
}
