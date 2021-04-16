import 'package:final_project/config/theme_colors.dart';
import 'package:flutter/material.dart';

class ResetPassword extends StatefulWidget {
  static const routeName = "reset";

  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  static var _keyValidationForm = GlobalKey<FormState>();
  TextEditingController _textEditConEmail = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final FocusNode _passwordEmail = FocusNode();
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: Card(
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                width: double.infinity,
                child: const Text(
                  'Forgot Your Password?',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.black,
                  ),
                ),
              ),
              Container(
                child: TextFormField(
                  controller: _textEditConEmail,
                  focusNode: _passwordEmail,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  validator: _validateEmail,
                  decoration: InputDecoration(
                      labelText: 'Email',
                      //prefixIcon: Icon(Icons.email),
                      icon: Icon(Icons.email)),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 32.0),
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: third,
                    onPrimary: Colors.white,
                    padding: EdgeInsets.only(top: 16.0, bottom: 16.0),
                    elevation: 5.0,
                  ),
                  child: Text(
                    'Send',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  onPressed: () {
                    if (_keyValidationForm.currentState.validate()) {
                      _onTappedButtonReset();
                    }
                  },
                ),
              ), //but
            ],
          )),
        ),
      ),
    );
  }

  String _validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Invalid Email';
    } else {
      return null;
    }
  }

  void _onTappedButtonReset() {}
}
