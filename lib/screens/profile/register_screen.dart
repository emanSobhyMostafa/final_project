import 'package:final_project/config/theme_colors.dart';
import 'package:final_project/config/variables_constants.dart';
import 'package:final_project/screens/profile/login_screen.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  static const routeName = "register";
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  void initState() {
    isPasswordVisible = false;
    isConfirmPasswordVisible = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.only(top: 25.0),
            child: Column(
              children: <Widget>[
                getWidgetRegistrationCard(),
              ],
            )),
      ),
    );
  }

  Widget getWidgetRegistrationCard() {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        elevation: 10.0,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: ThemeControllers.keyValidationForm,
            child: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  child: Text(
                    'Register',
                    style: TextStyle(fontSize: 18.0, color: Colors.black),
                  ),
                ), // title: login
                Container(
                  child: TextFormField(
                    controller: textEditConName,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    validator: _validateUserName,
                    onFieldSubmitted: (String value) {
                      FocusScope.of(context).requestFocus(passwordEmail);
                    },
                    decoration: InputDecoration(
                        labelText: 'Full name',
                        icon: Icon(Icons.perm_identity)),
                  ),
                ), //text field : user name
                Container(
                  child: TextFormField(
                    controller: textEditConEmail,
                    focusNode: passwordEmail,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    validator: _validateEmail,
                    onFieldSubmitted: (String value) {
                      FocusScope.of(context).requestFocus(passwordFocus);
                    },
                    decoration: InputDecoration(
                        labelText: 'Email',
                        //prefixIcon: Icon(Icons.email),
                        icon: Icon(Icons.email)),
                  ),
                ), //text field: email
                Container(
                  child: TextFormField(
                    controller: textEditConPassword,
                    focusNode: passwordFocus,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    validator: _validatePassword,
                    onFieldSubmitted: (String value) {
                      FocusScope.of(context).requestFocus(passwordConfirmFocus);
                    },
                    obscureText: !isPasswordVisible,
                    decoration: InputDecoration(
                        labelText: 'Password',
                        suffixIcon: IconButton(
                          icon: Icon(isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              isPasswordVisible = !isPasswordVisible;
                            });
                          },
                        ),
                        icon: Icon(Icons.vpn_key)),
                  ),
                ), //text field: password
                Container(
                  child: TextFormField(
                      controller: textEditConConfirmPassword,
                      focusNode: passwordConfirmFocus,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.done,
                      validator: _validateConfirmPassword,
                      obscureText: !isConfirmPasswordVisible,
                      decoration: InputDecoration(
                          labelText: 'Confirm Password',
                          suffixIcon: IconButton(
                            icon: Icon(isConfirmPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off),
                            onPressed: () {
                              setState(() {
                                isConfirmPasswordVisible =
                                    !isConfirmPasswordVisible;
                              });
                            },
                          ),
                          icon: Icon(Icons.vpn_key))),
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
                      // shape: const BeveledRectangleBorder(
                      //     borderRadius:
                      //         BorderRadius.all(Radius.circular(25.0))),
                    ),
                    child: Text(
                      'Register',
                      style: TextStyle(fontSize: 16.0),
                    ),
                    onPressed: () {
                      if (ThemeControllers.keyValidationForm.currentState
                          .validate()) {
                        _onTappedButtonRegister();
                      }
                    },
                  ),
                ), //button: login
                Container(
                    margin: EdgeInsets.only(top: 16.0, bottom: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Already Register? ',
                        ),
                        InkWell(
                          splashColor: Colors.amberAccent.withOpacity(0.5),
                          onTap: () {
                            Navigator.pushNamed(context, LoginScreen.routeName);
                          },
                          child: Text(
                            ' Login',
                            style: TextStyle(
                                color: third, fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _validateUserName(String value) {
    return value.trim().isEmpty ? "Name can't be empty" : null;
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

  String _validatePassword(String value) {
    return value.length < 5 ? 'Min 5 char required' : null;
  }

  String _validateConfirmPassword(String value) {
    return value.length < 5
        ? 'Min 5 char required'
        : (value != textEditConPassword.text ? 'password dont match' : null);
  }

  void _onTappedButtonRegister() {}

  void _onTappedTextlogin() {}
}
