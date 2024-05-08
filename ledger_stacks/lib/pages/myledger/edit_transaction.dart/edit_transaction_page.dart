import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ledger_stacks/models/transaction.dart';
import 'package:ledger_stacks/pages/myledger/edit_transaction.dart/edit_transaction_controller.dart';
import 'package:ledger_stacks/pages/myledger/ledger_controller.dart';
import 'package:ledger_stacks/pages/myledger/ledger_page.dart';

import '../../../constants/color.dart';
import '../../../util/util.dart';
import '../../../widgets/button.dart';
import '../../../widgets/textform.dart';

class EditTransaction extends GetView<EditTransactionController> {
  final TransactionModel selectedItem;
  const EditTransaction({super.key, required this.selectedItem});

  @override
  Widget build(BuildContext context) {
    final editTransaction = Get.put(EditTransactionController(
      selectedItem: selectedItem,
      ledgerController: Get.find<LedgerController>(),
    ));

    return Scaffold(
      backgroundColor: kGray,
      appBar: AppBar(
        toolbarHeight: 75.h,
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: KBackButton(
          onPressed: () {
            Get.off(() => MyLedger());
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
                  controller: editTransaction.listNameController,
                  validator: validateListNameField,
                  textInputAction: TextInputAction.next,
                ),
                TextFieldAddSQL(
                  hintText: "Amount",
                  keyboardType: TextInputType.number,
                  controller: editTransaction.listAmountController,
                  validator: validateListAmountField,
                  textInputAction: TextInputAction.done,
                ),
                ButtonRaL(
                    buttonText: "Save",
                    onPressed: () {
                      if (controller.formKey.currentState!.validate()) {
                        controller.updateTransaction();
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
