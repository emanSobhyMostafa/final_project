import 'package:flutter/material.dart';

class MyAppBar extends PreferredSize {
  final double height;
  final bool isFromHome;

  MyAppBar({
    this.height = kToolbarHeight,
    this.isFromHome,
  });

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: Text('LOGO'),
        flexibleSpace: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            if (isFromHome)
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
              ),
          ],
        ));
  }
}
