import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ledger_stacks/constants/color.dart';
import 'package:ledger_stacks/models/transaction.dart';
import 'package:ledger_stacks/pages/myledger/edit_ledger/edit_ledger_controller.dart';
import 'package:ledger_stacks/pages/myledger/show_ledger/ledger_list_controller.dart';
import 'package:ledger_stacks/pages/myledger/show_ledger/ledger_page.dart';
import 'package:ledger_stacks/util/util.dart';
import 'package:ledger_stacks/widgets/button.dart';
import 'package:ledger_stacks/widgets/textform.dart';

class EditLedger extends GetView<EditLedgerController> {
  final TransactionModel selectedItem;
  const EditLedger({super.key, required this.selectedItem});

  @override
  Widget build(BuildContext context) {
    final editLedgerController = Get.put(EditLedgerController(
      selectedItem: selectedItem,
      ledgerListController: Get.find<LedgerListController>(),
    ));

    return Scaffold(
      backgroundColor: kGray,
      appBar: AppBar(
        toolbarHeight: 75.h,
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: KBackButton(
          onPressed: () {
            Get.off(() => const MyLedger());
          },
        ),
        title: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Text(
            "Edit List",
            style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: controller.formKey,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20.w),
            child: Column(
              children: [
                TextFieldAddSQL(
                  hintText: "Name",
                  controller: editLedgerController.nameController,
                  validator: validateTransactionNameField,
                  textInputAction: TextInputAction.next,
                ),
                TextFieldAddSQL(
                  hintText: "Amount",
                  controller: editLedgerController.amountController,
                  validator: validateTransactionAmountField,
                  textInputAction: TextInputAction.done,
                ),
                ButtonRaL(
                    buttonText: "Save",
                    onPressed: () {
                      if (controller.formKey.currentState!.validate()) {
                        controller.updateMylist();
                      }
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}