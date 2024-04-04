import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProflieController extends GetxController {
  final formKey = GlobalKey<FormState>();

  final usernameController = TextEditingController();
  final emailController = TextEditingController();

  @override
  void onClose() {
    emailController.dispose();
    usernameController.dispose();
    super.onClose();
  }
}
