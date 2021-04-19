import 'package:flutter/material.dart';

class ThemeControllers {
  static var keyValidationForm = GlobalKey<FormState>();
}

TextEditingController textEditConPassword = TextEditingController();
TextEditingController textEditConEmail = TextEditingController();
TextEditingController textEditConName = TextEditingController();

TextEditingController textEditConConfirmPassword = TextEditingController();
bool isPasswordVisible = false;
bool isConfirmPasswordVisible = false;
final FocusNode passwordEmail = FocusNode();
final FocusNode passwordFocus = FocusNode();
final FocusNode passwordConfirmFocus = FocusNode();
