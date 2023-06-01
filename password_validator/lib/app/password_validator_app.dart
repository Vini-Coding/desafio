import 'package:flutter/material.dart';
import 'package:password_validator/app/home/view/home_view.dart';

class PasswordValidatorApp extends StatelessWidget {
  const PasswordValidatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const HomeView(),
    );
  }
}
