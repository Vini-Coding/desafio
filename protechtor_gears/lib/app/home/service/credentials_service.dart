import 'dart:convert';
import 'package:password_validator/app/home/model/credential.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:password_validator/app/shared/exceptions/failed_request_exception.dart';
import 'package:password_validator/app/shared/utils/credential_to_json.dart';

String baseUrl =
    'https://64790e0ba455e257fa62e151.mockapi.io/athleticGears/passwords';

class CredentialsService {
  var client = http.Client();

  Future<List<Credential>?> get() async {
    Uri url = Uri.parse(baseUrl);
    Response response = await client.get(url);
    if (response.statusCode == 200) {
      var jsonData = response.body;
      return credentialsFromJson(jsonData);
    } else {
      throw FailedRequestException();
    }
  }

  Future<Credential> post(Credential credential) async {
    Uri url = Uri.parse(baseUrl);
    var credentialParsed = credential.toJson();
    credentialParsed.remove("id");

    Response response = await client.post(url, body: credentialParsed);
    if (response.statusCode == 201) {
      var jsonData = jsonDecode(response.body);
      return Credential.fromJson(jsonData);
    } else {
      throw FailedRequestException();
    }
  }

  Future<Credential> put(Credential credential) async {
    Uri url = Uri.parse("$baseUrl/${credential.id}");
    var credentialParsed = credential.toJson();

    Response response = await client.put(url, body: credentialParsed);
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      return Credential.fromJson(jsonData);
    } else {
      throw FailedRequestException();
    }
  }

  Future<void> delete(String id) async {
    Uri url = Uri.parse("$baseUrl/$id");

    Response response = await client.delete(url);
    if (response.statusCode != 200) {
      throw FailedRequestException();
    }
  }
}
