import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ledger_stacks/util/database/database_service.dart';
import 'package:ledger_stacks/widgets/dropdown/dropdown_controller.dart';
import 'package:ledger_stacks/widgets/radio_button/radio_controller.dart';

import '../../../models/my_list.dart';

class AddMyListController extends GetxController {
  final formKey = GlobalKey<FormState>();

  final listNameController = TextEditingController();
  final listAmountController = TextEditingController();

  final RadioButtonController radioButtonController = Get.find();
  late final DropDownTypeController dropDownTypeController;
  late final DropDownFrequencyController dropDownFrequencyController;

  @override
  void onInit() {
    dropDownTypeController = Get.put(DropDownTypeController());
    dropDownFrequencyController = Get.put(DropDownFrequencyController());
    super.onInit();
  }

  @override
  void onClose() {
    listNameController.dispose();
    listAmountController.dispose();
    super.onClose();
  }

  Future<void> createMylist() async {
    final name = listNameController.text;
    final amount = double.parse(listAmountController.text);
    final isIncome =
        radioButtonController.selectedCharacter.value == SingingCharacter.income
            ? 'income'
            : 'expense';
    final type = dropDownTypeController.currentSelectedValue;
    final frequency = dropDownFrequencyController.currentSelectedValue;

    final myList = MyList(
      name: name,
      amount: amount,
      isIncome: isIncome,
      type: type,
      frequency: frequency,
    );

    await LedgetStackDB.instance.createMylist(myList);
  }
}
