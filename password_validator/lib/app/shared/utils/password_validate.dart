bool passwordValidate({required String password}) {
  bool isPasswordStrong = RegExp(
    r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#\$&_*~]).{7,}$',
  ).hasMatch(
    password,
  );
  return isPasswordStrong;
}
