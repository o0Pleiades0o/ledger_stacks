class user {
  String username;
  String email;
  String password;

  user({required this.username, required this.email, required this.password});

  Map<String, dynamic> toJson(){
    return {
      'username': username,
      'email': email,
      'password': password,
    };
  }
}
