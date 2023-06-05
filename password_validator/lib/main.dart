import 'package:flutter/material.dart';
import 'package:injector/injector.dart';
import 'package:password_validator/app/home/controller/home_controller.dart';
import 'package:password_validator/app/password_validator_app.dart';

void main() {
  Injector.appInstance.registerSingleton<HomeController>(
    () => HomeController(),
  );
  runApp(const PasswordValidatorApp());
}
