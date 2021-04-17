import 'package:final_project/config/routes.dart';
import 'package:final_project/screens/card/cart_payment.dart';
import 'package:final_project/screens/card/cart_screen.dart';
import 'package:final_project/screens/card/counter_cart.dart';
import 'package:final_project/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'config/theme_colors.dart';

void main() {
  runApp(_MyApp());
}

class _MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: primary,
          accentColor: secondary,
          textTheme: GoogleFonts.latoTextTheme(
            Theme.of(context).textTheme,
          )),
      home: HomeScreen(),
      routes: routes,
    );
  }
}
