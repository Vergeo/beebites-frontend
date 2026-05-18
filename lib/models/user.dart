enum UserRole { customer, admin }

class User {
  final int userId;
  final String name;
  final String email;
  final String password;
  final UserRole role;
  final DateTime createdAt;
  final DateTime updatedAt;

  const User({
    required this.userId,
    required this.name,
    required this.email,
    required this.password,
    required this.role,
    required this.createdAt,
    required this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'userId': int userId,
        'name': String name,
        'email': String email,
        'password': String password,
        'role': String role,
        'createdAt': String createdAt,
        'updatedAt': String updatedAt,
      } =>
        User(
          userId: userId,
          name: name,
          email: email,
          password: password,
          role: UserRole.values.firstWhere((e) => e.name == role),
          createdAt: DateTime.parse(createdAt),
          updatedAt: DateTime.parse(updatedAt),
        ),
      _ => throw const FormatException('Failed to load user.'),
    };
  }
}
