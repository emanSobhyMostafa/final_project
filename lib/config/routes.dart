import 'package:final_project/screens/profile/login_screen.dart';
import 'package:final_project/screens/profile/register_screen.dart';
import 'package:final_project/screens/profile/resetpassword_screen.dart';

final routes = {
  RegisterScreen.routeName: (context) => RegisterScreen(),
  LoginScreen.routeName: (context) => LoginScreen(),
  ResetPassword.routeName: (context) => ResetPassword(),
};
