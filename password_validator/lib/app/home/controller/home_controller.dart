import 'package:flutter/material.dart';
import 'package:password_validator/app/home/enum/filter_list_by.dart';
import 'package:password_validator/app/home/model/password.dart';
import 'package:password_validator/app/home/service/password_service.dart';
import 'package:password_validator/app/shared/utils/password_validate.dart';

class HomeController extends ChangeNotifier {
  List<Password>? allPasswords;
  List<Password> weakPasswords = [];
  List<Password> strongPasswords = [];
  final List<bool> _isSelected = <bool>[true, false, false];
  ValueNotifier<bool> isLoaded = ValueNotifier<bool>(false);
  ValueNotifier<int?> listViewLength = ValueNotifier<int?>(null);
  FilterListBy filterListBy = FilterListBy.allPasswords;

  Future<void> fetchPasswords() async {
    allPasswords = await PasswordService().fetchData();
    if (allPasswords != null) {
      isLoaded.value = true;
      listViewLength.value = allPasswords!.length;
      generateFilteredLists();
    }
  }

  void generateFilteredLists() {
    for (final password in allPasswords!) {
      if (passwordValidate(password: password.password)) {
        strongPasswords.add(password);
      } else {
        weakPasswords.add(password);
      }
    }
  }

  List<bool> get isSelected {
    return _isSelected;
  }

  void filterList(FilterListBy filterValue) {
    filterListBy = filterValue;
    switch (filterListBy) {
      case FilterListBy.allPasswords:
        listViewLength.value = allPasswords?.length;
        break;
      case FilterListBy.weakPasswords:
        listViewLength.value = weakPasswords.length;
        break;
      case FilterListBy.strongPasswords:
        listViewLength.value = strongPasswords.length;
        break;
      default:
        listViewLength.value = allPasswords?.length;
        break;
    }
  }

  String getPassword(index) {
    switch (filterListBy) {
      case FilterListBy.allPasswords:
        return allPasswords![index].password;
      case FilterListBy.weakPasswords:
        return weakPasswords[index].password;
      case FilterListBy.strongPasswords:
        return strongPasswords[index].password;
      default:
        return allPasswords![index].password;
    }
  }
}
