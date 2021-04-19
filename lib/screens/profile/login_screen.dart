import 'package:final_project/config/theme_colors.dart';
import 'package:final_project/config/variables_constants.dart';
import 'package:final_project/screens/profile/register_screen.dart';
import 'package:final_project/screens/profile/resetpassword_screen.dart';
import 'package:flutter/material.dart';
import 'package:auth_buttons/auth_buttons.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = "login";
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  AuthButtonStyle authButtonStyle = AuthButtonStyle.icon;

  @override
  void initState() {
    isPasswordVisible = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.only(top: 50.0),
              child: Column(
                children: <Widget>[
                  getWidgetLoginCard(),
                ],
              )),
        ),
      ),
    );
  }

  Widget getWidgetLoginCard() {
      var keyValidationForm = GlobalKey<FormState>();
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
            key: keyValidationForm,
            child: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.black,
                    ),
                  ),
                ), // title: login
                //text field : user name
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
                    margin: EdgeInsets.only(top: 16.0, bottom: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        InkWell(
                          splashColor: Colors.amberAccent.withOpacity(0.5),
                          onTap: () {
                            Navigator.pushNamed(
                                context, ResetPassword.routeName);
                          },
                          child: Text(
                            ' Forgot Password?',
                            style: TextStyle(
                                color: Colors.blueAccent,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    )),
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
                      'Login',
                      style: TextStyle(fontSize: 16.0),
                    ),
                    onPressed: () {
                      if (keyValidationForm.currentState
                          .validate()) {
                        _onTappedButtonLogin();
                      }
                    },
                  ),
                ), //button: login
                Container(
                  margin: EdgeInsets.only(top: 16.0, bottom: 16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('OR'),
                      Container(
                        margin: EdgeInsets.only(top: 25.0, bottom: 25.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 25),
                              child: GoogleAuthButton(
                                onPressed: () {},
                                style: AuthButtonStyle.icon,
                              ),
                            ),
                            Divider(),
                            FacebookAuthButton(
                              onPressed: () {},
                              style: AuthButtonStyle.icon,
                            ),
                            Divider(),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(top: 16.0, bottom: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Don`t Have Account? ',
                        ),
                        InkWell(
                          splashColor: Colors.amberAccent.withOpacity(0.5),
                          onTap: () {
                            Navigator.pop(context, RegisterScreen.routeName);
                          },
                          child: Text(
                            ' Sign Up',
                            style: TextStyle(
                                color: third, fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    )),
              ],
            ),
          ),
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

  String _validatePassword(String value) {
    return value.length < 5 ? 'Min 5 char required' : null;
  }
}

void _onTappedButtonLogin() {}
