class Credential {
  DateTime createdAt;
  String password;
  String? id;

  Credential({
    required this.createdAt,
    required this.password,
    this.id,
  });

  factory Credential.fromJson(Map<String, dynamic> json) => Credential(
        createdAt: DateTime.parse(json["createdAt"]),
        password: json["password"],
        id: json["id"],
      );

  factory Credential.fromPassword(String password) => Credential(
        createdAt: DateTime.now(),
        password: password,
      );

  Map<String, dynamic> toJson() => {
        "createdAt": createdAt.toIso8601String(),
        "password": password,
        "id": id,
      };

  Credential copyWith({
    DateTime? createdAt,
    String? password,
    String? id,
  }) {
    return Credential(
      createdAt: createdAt ?? this.createdAt,
      password: password ?? this.password,
      id: id ?? this.id,
    );
  }
}
