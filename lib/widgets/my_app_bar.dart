import 'package:final_project/bloc/cart_bloc/cart_bloc.dart';
import 'package:final_project/bloc/cart_bloc/cart_state.dart';
import 'package:final_project/bloc/main_bloc.dart';
import 'package:final_project/bloc/main_state.dart';
import 'package:final_project/config/app_string.dart';
import 'package:final_project/config/theme_colors.dart';
import 'package:final_project/screens/cart/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';

class MyAppBar extends PreferredSize {
  final double height;
  final bool isFromHome;
  // final bool isFromCategory;
  final String title;

  MyAppBar({
    // this.height = kToolbarHeight,
    this.title,
    this.isFromHome = false,
    // this.isFromCategory = false,
    this.height = kToolbarHeight,
  });

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: !isFromHome
          ? Text(title)
          : Text(
              "مضمون",
              style: GoogleFonts.reemKufi(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
      // Image.asset(
      //     'assets/images/appbar_logo.png',
      //     height: MediaQuery.of(context).size.height*.2,
      //     width: MediaQuery.of(context).size.width*.3,
      //     // fit: BoxFit.cover,
      //   ),
      actions: [
        if (!isFromHome)
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                CardScreen.routeName,
                arguments: {"isFromHome": false},
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Badge(
                badgeColor: third,
                badgeContent: BlocBuilder<CartBloc, TotalInCartState>(
                  builder: (_, state) => Text(
                    "${Hive.box(AppString.LocalMemory).get("total") ?? "0"}",
                    style: TextStyle(color: white),
                  ),
                ),
                child: Icon(Icons.shopping_cart),
              ),
            ),
          )
      ],
      flexibleSpace: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextField(
              decoration: InputDecoration(
                fillColor: white,
                filled: true,
                hintText: 'Search',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
                focusColor: white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
