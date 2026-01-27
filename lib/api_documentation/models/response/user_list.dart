class CreateUserResponse {
  final int? id;
  final String? email;
  final String? password;
  final String? name;
  final String? role;
  final String? avatar;
  final DateTime? creationAt;
  final DateTime? updatedAt;

  CreateUserResponse({
    required this.id,
    required this.email,
    required this.password,
    required this.name,
    required this.role,
    required this.avatar,
    required this.creationAt,
    required this.updatedAt,
  });

  factory CreateUserResponse.fromJson(Map<String, dynamic> json) {
    return CreateUserResponse(
      id: json["id"],
      email: json["email"],
      password: json["password"],
      name: json["name"],
      role: json["role"],
      avatar: json["avatar"],
      creationAt: DateTime.tryParse(json["creationAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
    );
  }
}
