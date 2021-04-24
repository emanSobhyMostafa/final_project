import 'package:final_project/config/theme_colors.dart';
import 'package:final_project/services/auth_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  static const routeName = "profile";
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  User user;
  void inputData() {
    user = auth.currentUser;

    // here you write the codes to input the data into firestore
  }

  @override
  Widget build(BuildContext context) {
    inputData();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: third,
        title: Text("Profile"),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Text(
              //   "You Logged In with:" + auth.currentUser.displayName,
              // ),
              // SizedBox(
              //   height: 25,
              // ),
              Icon(
                IconData(61502, fontFamily: 'MaterialIcons'),
                size: 80,
                color: third,
              ),
              SizedBox(
                height: 45,
              ),
              Text(
                "You Loged in with:\n" + user.email,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
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
                onPressed: () {
                  signOut();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
