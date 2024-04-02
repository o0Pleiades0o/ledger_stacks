class UserModel {
  late int id;
  late String username;
  late String email;
  late String password;
  late String imageAvatar;

  UserModel({
    required this.id,
    required this.username,
    required this.email,
    required this.password,
    required this.imageAvatar,
  });

  UserModel.fromDocumentSnapshot(String id, Map<String, dynamic> json) {
    this.id = int.parse(id);
    username = json["username"] ?? '';
    email = json["email"] ?? '';
    password = json["password"] ?? '';
    imageAvatar = json["imageAvatar"] ?? '';
  }
}
