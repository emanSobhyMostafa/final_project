import 'package:final_project/widgets/my_app_bar.dart';
import 'package:final_project/widgets/my_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(height:120),
      drawer: MyDrawer(),
      body: Center(
      child: Text("test"),
      ),
    );
  }
}
