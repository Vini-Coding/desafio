import 'package:flutter/material.dart';
import 'package:password_validator/app/shared/utils/password_validation.dart';

class AddEditController extends ChangeNotifier {
  TextEditingController passwordTextController = TextEditingController();
  String get text => passwordTextController.text;
  ValueNotifier<bool> isPasswordVisible = ValueNotifier<bool>(false);

  void changePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  bool get minimalSevenCaracters => validateSevenCaracters(text);
  bool get upperCaseCaracter => validateUpperCaseCaracter(text);
  bool get lowerCaseCaracter => validateLowerCaseCaracter(text);
  bool get minimalOneNumber => validateNumberCaracter(text);
  bool get minimalOneSpecialCaracter => validateSpecialCaracter(text);

  bool get isPasswordStrong {
    return minimalSevenCaracters &&
        upperCaseCaracter &&
        lowerCaseCaracter &&
        minimalOneNumber &&
        minimalOneSpecialCaracter;
  }
}
