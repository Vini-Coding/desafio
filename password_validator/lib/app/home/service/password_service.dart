import 'package:password_validator/app/home/model/password.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class PasswordService {
  Future<List<Password>?> fetchData() async {
    var client = http.Client();

    Uri url = Uri.parse(
      'https://64790e0ba455e257fa62e151.mockapi.io/athleticGears/passwords',
    );
    Response response = await client.get(url);
    if (response.statusCode == 200) {
      var jsonData = response.body;
      return passwordFromJson(jsonData);
    } else {
      return null;
    }
  }
}
