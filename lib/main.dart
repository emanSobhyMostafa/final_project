import 'package:final_project/config/routes.dart';
import 'package:final_project/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'config/theme_colors.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(_MyApp());
}

class _MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'مضمون-Madmoon',
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
