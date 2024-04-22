import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:ledger_stacks/models/user.dart';

class UserController extends GetxController {
  Rx<UserModel> userModel = UserModel().obs;
  UserModel get user => userModel.value;
  set user(UserModel value) => userModel.value = value;

  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;

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

  Future<bool> updateUser(
    String email,
    String username,
    File? selectedImage,
  ) async {
    try {
      String? imageUrl;

      if (selectedImage != null) {
        // Create file in Firebase Storage
        final fileName = DateTime.now().millisecondsSinceEpoch.toString();
        final path = 'user_images/$fileName';
        final ref = FirebaseStorage.instance.ref().child(path);
        await ref.putFile(selectedImage);
        imageUrl = await ref.getDownloadURL();
      }

      await firestore.collection('users').doc(user.id).update({
        'username': username,
        'email': email,
        'imageAvatar': imageUrl ?? user.imageAvatar,
      });

      userModel.update((userModel) {
        userModel?.username = username;
        userModel?.email = email;
        userModel?.imageAvatar = imageUrl ?? userModel.imageAvatar;
      });

      Get.snackbar(
        "Success",
        "Update successfully",
        snackPosition: SnackPosition.BOTTOM,
      );
      return true;
    } catch (e) {
      debugPrint('Error updating user: $e');
      return false;
    }
  }
}
