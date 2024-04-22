import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ledger_stacks/pages/add_transaction.dart/transaction_controller.dart';
import 'package:ledger_stacks/pages/home/home_page.dart';
import 'package:ledger_stacks/widgets/textform.dart';

import '../../constants/color.dart';
import '../../util/util.dart';
import '../../widgets/button.dart';
import '../../widgets/container_select_mylist.dart';
import '../../widgets/radio_button/radio_button.dart';

class AddTransaction extends StatelessWidget {
  AddTransaction({super.key});
  final AddTransactionController addTransactionController =
      Get.put(AddTransactionController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kGray,
      appBar: AppBar(
          toolbarHeight: 75.h,
          centerTitle: true,
          backgroundColor: Colors.white,
          leading: KBackButton(
            onPressed: () {
              Get.off(() => const HomePage());
            },
          ),
          title: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              "Add New",
              style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.bold),
            ),
          )),
<<<<<<< HEAD
      body: Form(
        key: addTransactionController.formKey,
        child: Column(
          children: [
            Padding(
                padding: EdgeInsets.symmetric(vertical: 25.h, horizontal: 20.w),
                child: Column(
                  children: [
                    SizedBox(
                      height: 70.h,
                    ),
                    RadioButton(),
                    TextFieldAddSQL(
                        validator: validateTransactionNameField,
                        controller: addTransactionController.nameController,
                        textInputAction: TextInputAction.next,
                        hintText: 'Name'),
                    TextFieldAddSQL(
                        validator: validateTransactionAmountField,
                        controller: addTransactionController.amountController,
                        textInputAction: TextInputAction.done,
                        hintText: 'Amount'),
                    ButtonRaL(
                      buttonText: "Add",
                      onPressed: () async {
                        if (addTransactionController.formKey.currentState!
                            .validate()) {
                          await addTransactionController.createTransaction();
                          debugPrint(
                              'All ${addTransactionController.nameController}');
                          debugPrint(
                              'All ${addTransactionController.amountController}');
                        }
                      },
                    ),
                  ],
                )),
            const Spacer(),
            //Selcect item form mylist
            ContainerSelectMylist(),
          ],
=======
      body: SingleChildScrollView(
        child: Form(
          key: addTransactionController.formKey,
          child: Padding(
              padding: EdgeInsets.symmetric(vertical: 25.h, horizontal: 20.w),
              child: Column(
                children: [
                  RadioButton(),
                  TextFieldAddSQL(
                      validator: validateTransactionNameField,
                      controller: addTransactionController.nameController,
                      textInputAction: TextInputAction.next,
                      hintText: 'Name'),
                  TextFieldAddSQL(
                      validator: validateTransactionAmountField,
                      controller: addTransactionController.amountController,
                      textInputAction: TextInputAction.done,
                      hintText: 'Amount'),
                  ButtonRaL(
                      buttonText: "Add",
                      onPressed: () {
                        if (addTransactionController.formKey.currentState!
                            .validate()) {
                          // TransactionModel transactionModel = TransactionModel(
                          //     name:
                          //         addTransactionController.nameController.text,
                          //     amount: double.parse(addTransactionController
                          //         .amountController.text));
                          // TransactionService()
                          //     .insertValueTransaction(transactionModel,
                          //         controller:
                          //             addTransactionController.nameController)
                          //     .then((value) {
                          //   debugPrint(value.toString());
                          // });
                        }
                      })
                ],
              )),
>>>>>>> parent of d13ff10 (Merge branch 'Branch-for-Kris-make-UI' into Arty)
        ),
      ),
    );
  }
}
