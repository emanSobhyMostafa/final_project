

import 'package:final_project/config/theme_colors.dart';
import 'package:final_project/widgets/my_app_bar.dart';
import 'package:flutter/material.dart';

class OrderonfirmationScreen extends StatelessWidget {
  static const routeName = 'payment';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  MyAppBar(isFromHome: false, title:'confirmation', height: 120,),
      body: Center(
        child: Card(

          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
                  elevation: 10.0,

          child:

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Your order has been placed successfully!!',style: TextStyle(fontSize: 18,color: primary),),
        )
           
        ),
      ),
    );
  }
}

