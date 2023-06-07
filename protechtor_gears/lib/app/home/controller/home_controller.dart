import 'package:flutter/material.dart';
import 'package:password_validator/app/home/enum/filter_list_by.dart';
import 'package:password_validator/app/home/model/credential.dart';
import 'package:password_validator/app/home/service/credentials_service.dart';
import 'package:password_validator/app/shared/utils/password_validation.dart';

class HomeController extends ChangeNotifier {
  List<Credential>? _allCredentials;
  final List<bool> _isSelected = <bool>[true, false, false];

  FilterListBy filterListBy = FilterListBy.allPasswords;

  Future<void> fetchPasswords() async {
    _allCredentials = await CredentialsService().get();
    notifyListeners();
  }

  List<Credential>? get filteredCredentials {
    if (_allCredentials == null) return null;

    List<Credential> credentials = [];

    for (final credential in _allCredentials!) {
      switch (filterListBy) {
        case FilterListBy.allPasswords:
          credentials.add(credential);
          break;
        case FilterListBy.weakPasswords:
          if (!validateAllCriteria(credential.password)) {
            credentials.add(credential);
          }
          break;
        case FilterListBy.strongPasswords:
          if (validateAllCriteria(credential.password)) {
            credentials.add(credential);
          }
          break;
      }
    }
    return credentials;
  }

  List<bool> get isSelected {
    return _isSelected;
  }

  void filterList(FilterListBy filterValue) {
    filterListBy = filterValue;
    notifyListeners();
  }

  Future<void> addCredential(Credential credential) async {
    Credential newCredential = await CredentialsService().post(credential);
    _allCredentials?.add(newCredential);
    notifyListeners();
  }

  Future<void> editCredential({
    required Credential oldCredential,
    required Credential newCredential,
  }) async {
    Credential editedCredential = await CredentialsService().put(newCredential);
    int credentialIndex = _allCredentials!.indexOf(oldCredential);
    _allCredentials![credentialIndex] = editedCredential;
    notifyListeners();
  }

  Future<void> deleteCredential(Credential credential) async {
    await CredentialsService().delete(credential.id!);
    _allCredentials?.remove(credential);
    notifyListeners();
  }
}
