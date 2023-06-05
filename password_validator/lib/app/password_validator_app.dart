import 'package:flutter/material.dart';
import 'package:password_validator/app/home/view/home_view.dart';
import 'package:password_validator/app/shared/theme/app_theme.dart';

class PasswordValidatorApp extends StatelessWidget {
  const PasswordValidatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      home: const HomeView(),
    );
  }
}
