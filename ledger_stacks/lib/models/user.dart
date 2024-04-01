class User {
  String id;
  String username;
  String email;
  String password;

  User(
      {required this.id,
      required this.username,
      required this.email,
      required this.password});

  Map<String, dynamic> toJson() {
    return {
      'String': id,
      'username': username,
      'email': email,
      'password': password,
    };
  }
}
