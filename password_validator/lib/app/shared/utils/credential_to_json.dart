import 'dart:convert';
import 'package:password_validator/app/home/model/credential.dart';

List<Credential> credentialsFromJson(String str) =>
    List<Credential>.from(json.decode(str).map((x) => Credential.fromJson(x)));
