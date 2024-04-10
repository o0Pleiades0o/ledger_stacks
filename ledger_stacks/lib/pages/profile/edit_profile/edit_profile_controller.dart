import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ledger_stacks/auth/user_controller.dart';

class EditProflieController extends GetxController {
  final UserController userData = Get.find<UserController>();
  final formKey = GlobalKey<FormState>();

  late TextEditingController emailController;
  late TextEditingController usernameController;

  Rx<File?> selectedImage = Rx<File?>(null);

  @override
  void onInit() {
    emailController =
        TextEditingController(text: userData.user.email ?? 'Not found email');
    usernameController = TextEditingController(
        text: userData.user.username ?? 'Not found username');
    super.onInit();
  }

  @override
  void onClose() {
    emailController.dispose();
    usernameController.dispose();
    super.onClose();
  }

  void getImage(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().pickImage(source: imageSource);
    if (pickedFile != null) {
      selectedImage.value = File(pickedFile.path); // Update the Rx<File?> value
    } else {
      Get.snackbar('Error', 'No image selected',
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}
