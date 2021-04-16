import 'package:flutter/material.dart';
import 'package:badges/badges.dart';

class MyAppBar extends StatelessWidget {
  // final double height;
  final bool isFromHome;
  final bool isFromCategory;
  final String title;

  MyAppBar({
    // this.height = kToolbarHeight,
    this.title,
    this.isFromHome=false,
    this.isFromCategory = false
    ,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: Text(title),
        actions: [
          if(!isFromHome)
          Padding(
            padding: const EdgeInsets.all(15),
            child: Badge(
      badgeContent: Text('3'),
      child: Icon(Icons.shopping_cart),
    ),
          )
    ],
        flexibleSpace: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            isFromHome?
              Padding(
                padding: const EdgeInsets.all(8),
                child: TextField(
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'Search',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(),
                      focusColor: Colors.white),
                ),
              ):
                Padding(
                padding: const EdgeInsets.all(8),
                child: TextField(
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'Search',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(),
                      focusColor: Colors.white),
                ),
              ),          ],
        ));
  }
}
