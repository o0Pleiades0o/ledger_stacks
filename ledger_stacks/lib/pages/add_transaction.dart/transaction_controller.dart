import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddTransactionController extends GetxController {
  final formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final amountController = TextEditingController();

  @override
  void onClose() {
    nameController.dispose();
    amountController.dispose();
    super.onClose();
  }
}