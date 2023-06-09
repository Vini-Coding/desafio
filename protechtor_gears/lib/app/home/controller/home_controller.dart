import 'package:flutter/material.dart';
import 'package:password_validator/app/home/enum/filter_list_by.dart';
import 'package:password_validator/app/home/model/credential.dart';
import 'package:password_validator/app/home/service/credentials_service.dart';
import 'package:password_validator/app/shared/utils/password_validation.dart';

class HomeController extends ChangeNotifier {
  List<Credential>? _allCredentials;
  final List<bool> _isSelected = <bool>[true, false, false];
  String? requestErrorAlert;

  FilterListBy filterListBy = FilterListBy.allPasswords;

  Future<void> fetchPasswords() async {
    try {
      _allCredentials = await CredentialsService().get();
      notifyListeners();
    } catch (_) {
      requestErrorAlert = "Falha em receber os dados. Verifique sua conexão.";
      notifyListeners();
    }
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
    try {
      Credential newCredential = await CredentialsService().post(credential);
      _allCredentials?.add(newCredential);
      notifyListeners();
    } catch (_) {
      requestErrorAlert =
          "Falha em adicionar nova senha. Verifique sua Conexão.";
      notifyListeners();
    }
  }

  Future<void> editCredential({
    required Credential oldCredential,
    required Credential newCredential,
  }) async {
    try {
      Credential editedCredential =
          await CredentialsService().put(newCredential);
      int credentialIndex = _allCredentials!.indexOf(oldCredential);
      _allCredentials![credentialIndex] = editedCredential;
      notifyListeners();
    } catch (_) {
      requestErrorAlert = "Falha em editar senha. Verifique sua conexão.";
      notifyListeners();
    }
  }

  Future<void> deleteCredential(Credential credential) async {
    try {
      await CredentialsService().delete(credential.id!);
      _allCredentials?.remove(credential);
      notifyListeners();
    } catch (_) {
      requestErrorAlert = "Falha em deletar senha. Verifique sua conexão.";
      notifyListeners();
    }
  }
}
