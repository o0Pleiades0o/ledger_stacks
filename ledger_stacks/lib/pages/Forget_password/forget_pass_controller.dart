import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPassController extends GetxController {
  final formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  @override
  void onClose() {
    emailController.dispose();
    super.onClose();
  }
}
