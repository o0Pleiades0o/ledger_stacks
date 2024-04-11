import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:ledger_stacks/models/user.dart';

class UserController extends GetxController {
  // Rx<UserModel> userModel = UserModel().obs;
  // UserModel get user => userModel.value;
  // set user(UserModel value) => userModel.value = value;

  // final FirebaseFirestore firestore = FirebaseFirestore.instance;

  // //Save the user data to Firestore
  // Future<bool> createUser(UserModel user) async {
  //   try {
  //     await firestore.collection('users').doc(user.id).set({
  //       'id': user.id,
  //       'username': user.username,
  //       'email': user.email,
  //       'password': user.password,
  //       'imageAvatar': user.imageAvatar,
  //     });
  //     return true;
  //   } catch (e) {
  //     debugPrint('Error creating user: $e');
  //     return false;
  //   }
  // }

  // //Get user data from Firestore
  // Future<UserModel?> getUser(String userId) async {
  //   try {
  //     DocumentSnapshot<Map<String, dynamic>> snapshot =
  //         await firestore.collection('users').doc(userId).get();

  //     if (snapshot.exists) {
  //       return UserModel.fromDocumentSnapshot(snapshot);
  //     } else {
  //       debugPrint('User document does not exist');
  //       return null;
  //     }
  //   } catch (e) {
  //     debugPrint('Error getting user data: $e');
  //     return null;
  //   }
  // }

  // void clear() {
  //   userModel.value = UserModel();
  // }

  // Future<bool> updateUser(
  //   String email,
  //   String username,
  //   String? imageAvatar,
  //   String? selectImagePath,
  // ) async {
  //   try {
  //     String? imageUrl;

  //     if (selectImagePath != null) {
  //       // Create a reference to the file in Firebase Storage
  //       final fileName = DateTime.now().millisecondsSinceEpoch.toString();
  //       final path = 'user_images/$fileName';
  //       final ref = FirebaseStorage.instance.ref().child(path);

  //       // Upload the selected image to Firebase Storage
  //       await ref.putFile(File(selectImagePath));

  //       // Get the download URL of the uploaded image
  //       imageUrl = await ref.getDownloadURL();
  //     }

  //     await firestore.collection('users').doc(user.id).update({
  //       'username': username,
  //       'email': email,
  //       'imageAvatar': imageUrl ??
  //           imageAvatar, // Use the new image URL if available, otherwise use the existing one
  //     });

  //     Get.snackbar(
  //       "Success",
  //       "Update successfully",
  //       snackPosition: SnackPosition.BOTTOM,
  //     );
  //     return true;
  //   } catch (e) {
  //     debugPrint('Error updating user: $e');
  //     return false;
  //   }
  // }
  Rx<UserModel> userModel = UserModel().obs;
  UserModel get user => userModel.value;
  set user(UserModel value) => userModel.value = value;

  final _isImageLoading = false.obs;
  bool get isImageLoading => _isImageLoading.value;
  set isImageLoading(bool value) => _isImageLoading.value = value;

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

  Future<bool> updateUser(
    String email,
    String username,
    String? imageAvatar,
    String? selectImagePath,
  ) async {
    try {
      String? imageUrl;

      if (selectImagePath != null) {
        isImageLoading = true;

        final fileName = DateTime.now().millisecondsSinceEpoch.toString();
        final path = 'user_images/$fileName';
        final ref = FirebaseStorage.instance.ref().child(path);

        await ref.putFile(File(selectImagePath));
        imageUrl = await ref.getDownloadURL();

        isImageLoading = false;
      }

      await firestore.collection('users').doc(user.id).update({
        'username': username,
        'email': email,
        'imageAvatar': imageUrl ?? imageAvatar,
      });

      Get.snackbar(
        "Success",
        "Update successfully",
        snackPosition: SnackPosition.BOTTOM,
      );
      return true;
    } catch (e) {
      isImageLoading = false;
      debugPrint('Error updating user: $e');
      return false;
    }
  }
}
//}
