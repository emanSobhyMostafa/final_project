import 'dart:io';

import 'package:final_project/bloc/cart_bloc/cart_bloc.dart';
import 'package:final_project/bloc/main_bloc.dart';
import 'package:final_project/bloc/main_event.dart';
import 'package:final_project/config/routes.dart';
import 'package:final_project/screens/home/home_screen.dart';
import 'package:final_project/screens/home/widgets/home_main.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import 'config/theme_colors.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  await Firebase.initializeApp();
  Directory appDocumentDir = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  await Hive.openBox("memory");

  runApp(_MyApp());
}

class _MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => MainBloc()..add(GetDataEvent())),
        BlocProvider(create: (_)=>CartBloc(),)
      ],
      child: MaterialApp(
        title: 'مضمون-Madmoon',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: primary,
            accentColor: third,
            textTheme: GoogleFonts.latoTextTheme(
              Theme.of(context).textTheme,
            )),
        home: HomeScreen(),
        routes: routes,
      ),
    );
  }
}
