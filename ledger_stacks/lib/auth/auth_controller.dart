import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:ledger_stacks/auth/user_controller.dart';
import 'package:ledger_stacks/models/user.dart';

import '../pages/home/home_page.dart';

class AuthController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Rx<User?> firebaseUser = Rx<User?>(null);

  late User _user;
  User get user => _user;
  String? get uid => _user.uid;

  @override
  void onInit() {
    super.onInit();
    firebaseUser.bindStream(auth.userChanges());
  }

  void register(String email, String password, String username) async {
    Get.put(UserController());

    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        //await user uid then sead uid to userCredential
        email: email,
        password: password,
      );
      //Hash password before uploading to firestore
      String hashedPassword = sha256.convert(utf8.encode(password)).toString();
      // Create a new instance of UserModel
      UserModel user = UserModel(
        id: userCredential.user?.uid,
        username: username,
        email: email,
        password: hashedPassword,
        imageAvatar: '',
      );
      // Call Function to Save the user data to Firestore
      if (await UserController().createUser(user)) {
        Get.find<UserController>().user = user;
        Get.offAll(() => const HomePage());
      }
    } catch (e) {
      debugPrint("Firebase error: $e");
      Get.snackbar(
        "Error creating account",
        e is FirebaseAuthException
            ? e.message ?? 'Unknown error'
            : e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void login(String email, String password) async {
    Get.put(UserController());
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      UserModel? user =
          await UserController().getUser(userCredential.user!.uid);
      if (user != null) {
        Get.find<UserController>().user = user;
        Get.offAll(() => const HomePage());
      } else {
        // Handle the case when user is null
        Get.snackbar(
          "Error",
          "User not found",
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      debugPrint("Firebase error: $e");
      Get.snackbar(
        "Error login account",
        e is FirebaseAuthException
            ? e.message ?? 'Unknown error'
            : e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void signOut() async {
    try {
      await auth.signOut();
      Get.find<UserController>().clear();
    } catch (e) {
      Get.snackbar(
        "Error signing out",
        e is FirebaseAuthException
            ? e.message ?? 'Unknown error'
            : e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void restPassword(String email) async {
    Get.put(UserController());
    debugPrint("Email : $email");
    try {
      await auth.sendPasswordResetEmail(email: email);
      Get.snackbar(
        "Success",
        "Password reset email has been sent",
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      debugPrint("Firebase error: $e");
      Get.snackbar(
        "Error",
        e is FirebaseAuthException
            ? e.message ?? 'Unknown error'
            : e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  //Sign IN with google function
  void signInWithGoogle() {}
}
