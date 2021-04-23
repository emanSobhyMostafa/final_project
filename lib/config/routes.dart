// import 'package:final_project/screens/card/checkout_payment.dart';
import 'package:final_project/screens/cart/cart_payment.dart';
import 'package:final_project/screens/cart/cart_payment_method_screen.dart';
import 'package:final_project/screens/home/widgets/home_main.dart';
import 'package:final_project/screens/product_details/product_details_screen.dart';
import 'package:final_project/screens/profile/login_screen.dart';
import 'package:final_project/screens/profile/profile_screen.dart';
import 'package:final_project/screens/profile/register_screen.dart';
import 'package:final_project/screens/profile/resetpassword_screen.dart';

final routes = {
  RegisterScreen.routeName: (context) => RegisterScreen(),
  LoginScreen.routeName: (context) => LoginScreen(),
  ResetPassword.routeName: (context) => ResetPassword(),
  Checkout.routeName: (context) => Checkout(),
  ProductDetailsScreen.routeName: (_) => ProductDetailsScreen(),
  CartPaymentMethodScreen.routeName:(context)=>CartPaymentMethodScreen(),
  Profile.routeName: (_) => Profile(),
  HomeMain.routeName: (_) => HomeMain(),
};
