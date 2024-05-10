import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:ledger_stacks/auth/user_controller.dart';
import 'package:ledger_stacks/models/user.dart';

import '../pages/home/home_page.dart';
import '../widgets/snackbar.dart';

class AuthController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Rx<User?> firebaseUser = Rx<User?>(null);
  var isLoading = false.obs;

  User? _user;
  User? get user => _user;
  String? get uid => _user?.uid;

  @override
  void onInit() {
    super.onInit();
    firebaseUser.bindStream(auth.userChanges());
    islogin();
  }

  Future register(String email, String password, String username) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        //await user uid then sead uid to userCredential
        email: email,
        password: password,
      );
      userCredential.user?.updateDisplayName("User");
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
      ErrorSnackbar.show(
        title: "Error creating account",
        message: e is FirebaseAuthException ? e.message ?? 'Unknown error' : e.toString(),
      );
    }
  }

  Future login(String email, String password) async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(email: email, password: password);
      UserModel? user = await UserController().getUser(userCredential.user!.uid);
      if (user != null) {
        Get.find<UserController>().user = user;
        Get.offAll(() => const HomePage());
      } else {
        ErrorSnackbar.show(
          title: "Error",
          message: "User not found",
        );
      }
    } catch (e) {
      debugPrint("Firebase error: $e");
      ErrorSnackbar.show(
        title: "Error login account",
        message: e is FirebaseAuthException ? e.message ?? 'Unknown error' : e.toString(),
      );
    }
  }

  void signOut() async {
    try {
      await auth.signOut();
      Get.find<UserController>().clear();
    } catch (e) {
      ErrorSnackbar.show(
        title: "Error signing out",
        message: e is FirebaseAuthException ? e.message ?? 'Unknown error' : e.toString(),
      );
    }
  }

  void restPassword(String email) async {
    debugPrint("Email : $email");
    try {
      await auth.sendPasswordResetEmail(email: email);
      SuccessSnackbar.show(
        title: "Success",
        message: "Password reset email has been sent",
      );
    } catch (e) {
      debugPrint("Firebase error: $e");
      ErrorSnackbar.show(
        title: "Error",
        message: e is FirebaseAuthException ? e.message ?? 'Unknown error' : e.toString(),
      );
    }
  }

  //Sign IN with google function
  void signInWithGoogle() {}
//Check user is login?
  Future<void> islogin() async {
    _user = auth.currentUser;
    if (_user != null) {
      UserModel? user = await UserController().getUser(_user!.uid);
      Get.find<UserController>().user = user!;
    } else {}
  }
}
