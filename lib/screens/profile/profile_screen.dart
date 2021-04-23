import 'package:final_project/config/theme_colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Text(
              //   "You Logged In with:" + auth.currentUser.displayName,
              // ),
              SizedBox(
                height: 25,
              ),
              Text("Your Email Is:" + auth.currentUser.email),
              SizedBox(
                height: 25,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: third,
                  onPrimary: white,
                  elevation: 5.0,
                ),
                child: Text(
                  'Logout',
                  style: TextStyle(fontSize: 16.0),
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
