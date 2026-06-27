class User {
  final int userId;
  final String name;
  final String email;
  final String role;

  const User({
    required this.userId,
    required this.name,
    required this.email,
    required this.role,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'userId': int userId,
        'name': String name,
        'email': String email,
        'role': String role,
      } =>
        User(userId: userId, name: name, email: email, role: role),
      _ => throw const FormatException('Failed to load user.'),
    };
  }
}
