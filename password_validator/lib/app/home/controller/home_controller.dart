import 'package:flutter/material.dart';
import 'package:password_validator/app/home/model/password.dart';
import 'package:password_validator/app/home/service/password_service.dart';

class HomeController extends ChangeNotifier {
  List<Password>? passwords;
  ValueNotifier<bool> isLoaded = ValueNotifier<bool>(false);

  void fetchPasswords() async {
    passwords = await PasswordService().fetchData();
    if (passwords != null) {
      isLoaded.value = true;
    }
  }
}
