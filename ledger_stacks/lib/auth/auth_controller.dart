import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:ledger_stacks/pages/home/home_page.dart';
import 'package:ledger_stacks/util/root.dart';

class AuthController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  Rx<User?> firebaseUser = Rx<User?>(null);

  String get user => firebaseUser.value?.email ?? '';

  @override
  void onInit() {
    super.onInit();
    firebaseUser.bindStream(auth.userChanges());
  }

  void register(String email, String password) async {
    try {
      await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      //Get.back();
      Get.offAll(() => const Root());
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
      await auth.signInWithEmailAndPassword(email: email, password: password);
      Get.offAll(() => const HomePage());
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
