import 'package:flutter/material.dart';
import 'package:password_validator/app/shared/theme/color%20scheme/color_scheme.dart';

ThemeData appTheme = ThemeData(
  useMaterial3: true,
  colorScheme: colorScheme,
  scaffoldBackgroundColor: colorScheme.background,
  appBarTheme: AppBarTheme(
    color: colorScheme.primary,
    foregroundColor: colorScheme.onPrimary,
    toolbarHeight: 70,
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: const Color.fromARGB(255, 119, 2, 105),
    foregroundColor: colorScheme.tertiary,
    focusColor: colorScheme.secondary,
    splashColor: colorScheme.secondary,
    hoverColor: const Color.fromARGB(255, 138, 0, 122),
    elevation: 5,
  ),
  textTheme: TextTheme(
    displayMedium: const TextStyle(
      fontFamily: "Staatliches",
      fontSize: 40,
    ),
    displaySmall: const TextStyle(
      fontFamily: "Staatliches",
      fontSize: 30,
    ),
    bodyMedium: TextStyle(
      fontFamily: "Rubik",
      fontSize: 16,
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
      color: colorScheme.onBackground,
    ),
  ),
);
