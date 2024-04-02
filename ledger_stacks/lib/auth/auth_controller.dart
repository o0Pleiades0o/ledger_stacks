import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:ledger_stacks/auth/user_controller.dart';
import 'package:ledger_stacks/models/user.dart';
import 'package:ledger_stacks/pages/login/login_page.dart';

class AuthController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Rx<User?> firebaseUser = Rx<User?>(null);

  String get user => firebaseUser.value?.email ?? '';

  @override
  void onInit() {
    super.onInit();
    firebaseUser.bindStream(auth.userChanges());
  }

  void register(String email, String password) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        //await user uid then sead uid to userCredential
        email: email,
        password: password,
      );
      // Create a new instance of UserModel
      UserModel user = UserModel(
        id: userCredential.user!.uid,
        username: username,
        email: email,
        password: password,
        imageAvatar: '',
      );
      // Call Function to Save the user data to Firestore
      if (await UserController().createUser(user)) {
        Get.find<UserController>().user = user;
        Get.back();
      }
    } catch (e) {
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
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      Get.find<UserController>().user =
          (await UserController().getUser(userCredential.user!.uid))!;
    } catch (e) {
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
}
