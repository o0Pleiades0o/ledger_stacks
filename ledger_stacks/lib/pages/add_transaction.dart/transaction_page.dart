import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ledger_stacks/pages/add_transaction.dart/transaction_controller.dart';
import 'package:ledger_stacks/pages/home/home_page.dart';
import 'package:ledger_stacks/widgets/dropdown.dart';
import 'package:ledger_stacks/widgets/textform.dart';

import '../../constants/color.dart';
import '../../widgets/button.dart';
import '../../widgets/radio_button/radio_button.dart';

class AddTransaction extends StatelessWidget {
  AddTransaction({super.key});
  final AddTransactionController addTransactionController = Get.put(AddTransactionController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Padding(
          padding: EdgeInsets.symmetric(vertical: 25.h, horizontal: 20.w),
          child: Column(
            children: [
              RadioButton(),
              TextFieldGeneral(controller: addTransactionController.nameController, labelText: 'Item Name'),
              TextFieldGeneral(controller: addTransactionController.amountController, labelText: 'Item Amount'),
              AddBotton(onPressed: () {
                
              } )
            ],
          )),
    );
  }
}
