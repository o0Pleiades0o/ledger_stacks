import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:ledger_stacks/models/user.dart';

class UserController extends GetxController {
  Rx<UserModel> userModel = UserModel().obs;

  UserModel get user => userModel.value;

  set user(UserModel value) => userModel.value = value;

  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  //Save the user data to Firestore
  Future<bool> createUser(UserModel user) async {
    try {
      await firestore.collection('users').doc(user.id).set({
        'id': user.id,
        'username': user.username,
        'email': user.email,
        'password': user.password,
        'imageAvatar': user.imageAvatar,
      });
      return true;
    } catch (e) {
      debugPrint('Error creating user: $e');
      return false;
    }
  }

  //Get user data from Firestore
  Future<UserModel?> getUser(String userId) async {
    try {
      DocumentSnapshot<Map<String, dynamic>> snapshot =
          await firestore.collection('users').doc(userId).get();

      if (snapshot.exists) {
        return UserModel.fromDocumentSnapshot(snapshot);
      } else {
        debugPrint('User document does not exist');
        return null;
      }
    } catch (e) {
      debugPrint('Error getting user data: $e');
      return null;
    }
  }

  void clear() {
    userModel.value = UserModel();
  }
}
