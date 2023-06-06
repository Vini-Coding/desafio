import 'package:flutter/material.dart';
import 'package:injector/injector.dart';
import 'package:password_validator/app/home/view/home_view.dart';
import 'package:password_validator/app/intro/view/intro_view.dart';
import 'package:password_validator/app/shared/theme/app_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PasswordValidatorApp extends StatelessWidget {
  const PasswordValidatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    SharedPreferences preferences = Injector.appInstance.get<SharedPreferences>();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      initialRoute: preferences.getBool("isFirstEntry") ?? true ? IntroView.routeName : HomeView.routeName,
      routes: {
        IntroView.routeName: (context) => const IntroView(),
        HomeView.routeName: (context) => const HomeView(),
      },
    );
  }
}
