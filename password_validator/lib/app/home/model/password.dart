import 'dart:convert';

List<Password> passwordFromJson(String str) =>
    List<Password>.from(json.decode(str).map((x) => Password.fromJson(x)));

String passwordToJson(List<Password> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Password {
  DateTime createdAt;
  String password;
  String id;

  Password({
    required this.createdAt,
    required this.password,
    required this.id,
  });

  factory Password.fromJson(Map<String, dynamic> json) => Password(
        createdAt: DateTime.parse(json["createdAt"]),
        password: json["password"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "createdAt": createdAt.toIso8601String(),
        "password": password,
        "id": id,
      };
}
