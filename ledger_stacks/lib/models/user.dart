import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  late String? id;
  late String? username;
  late String? email;
  late String? password;
  late String? imageAvatar;

  UserModel({
    this.id,
    this.username,
    this.email,
    this.password,
    this.imageAvatar,
  });

  factory UserModel.fromDocumentSnapshot(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    Map<String, dynamic> data = snapshot.data()!;
    return UserModel(
      id: snapshot.id,
      username: data['username'] ?? '',
      email: data['email'] ?? '',
      password: data['password'] ?? '',
      imageAvatar: data['imageAvatar'] ?? '',
    );
  }
}