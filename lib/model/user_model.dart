class UserDTO {
  final int? id;
  final String? name;
  final String? email;
  final int? type;
  final String? token;
  final String? createdAt;
  final String? updatedAt;

  UserDTO({
    required this.id,
    required this.name,
    required this.email,
    required this.type,
    required this.token,
    required this.createdAt,
    required this.updatedAt,
  });

  factory UserDTO.fromJson(Map<String, dynamic> json) {
    return UserDTO(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      type: json['type'],
      token: json['token'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}
