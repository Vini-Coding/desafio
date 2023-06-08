import 'package:flutter/material.dart';
import 'package:password_validator/app/shared/interfaces/handled_exception.dart';

class FailedRequestException implements HandledException {
  @override
  String parseString(BuildContext context) {
    return "Falha na Requisição";
  }
}