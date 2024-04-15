import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddMyListController extends GetxController {
  final formKey = GlobalKey<FormState>();

  final listNameController = TextEditingController();
  final listAmountController = TextEditingController();

  @override
  void onClose() {
    listNameController.dispose();
    listAmountController.dispose();
    super.onClose();
  }
}