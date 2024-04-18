import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ledger_stacks/pages/mylist/mylist_controller.dart';

class EditMyListController extends GetxController {
  final MyListController controller = Get.find<MyListController>();
  final formKey = GlobalKey<FormState>();

  late TextEditingController listNameController;
  late TextEditingController listAmountController;
}
