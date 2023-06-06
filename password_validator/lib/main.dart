import 'package:flutter/material.dart';
import 'package:injector/injector.dart';
import 'package:password_validator/app/password_validator_app.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  Injector.appInstance.registerSingleton<SharedPreferences>(() => preferences);
  runApp(const PasswordValidatorApp());
}
