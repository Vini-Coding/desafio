bool validateSevenCaracters(String password) {
  bool hasMinimalSevenCaracters = RegExp(
    r'^.{7,}$',
  ).hasMatch(
    password,
  );
  return hasMinimalSevenCaracters;
}

bool validateUpperCaseCaracter(String password) {
  bool hasAnUppercaseCaracter = RegExp(
    r'[A-Z]',
  ).hasMatch(
    password,
  );
  return hasAnUppercaseCaracter;
}

bool validateLowerCaseCaracter(String password) {
  bool hasALowercaseCaracter = RegExp(
    r'[a-z]',
  ).hasMatch(
    password,
  );
  return hasALowercaseCaracter;
}

bool validateNumberCaracter(String password) {
  bool hasANumber = RegExp(
    r'[0-9]',
  ).hasMatch(
    password,
  );
  return hasANumber;
}

bool validateSpecialCaracter(String password) {
  bool hasAnEspecialCaracter = RegExp(
    r'[!@#$%^&*(),._?":{}|<>]',
  ).hasMatch(
    password,
  );
  return hasAnEspecialCaracter;
}

bool validateAllCriteria(String password) {
  bool isPasswordStrong = RegExp(
    r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*(),.?_":{}|<>]).{7,}$',
  ).hasMatch(
    password,
  );
  return isPasswordStrong;
}
