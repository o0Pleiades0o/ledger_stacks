import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ledger_stacks/constants/color.dart';
import 'package:ledger_stacks/models/my_list.dart';
import 'package:ledger_stacks/pages/mylist/edit_my_list/edit_my_list_controller.dart';
import 'package:ledger_stacks/util/util.dart';
import 'package:ledger_stacks/widgets/button.dart';
import 'package:ledger_stacks/widgets/textform.dart';

import '../mylist_controller.dart';
import '../mylist_page.dart';

class EditMyList extends GetView<EditMyListController> {
  final MyList selectedItem;
  const EditMyList({super.key, required this.selectedItem});

  @override
  Widget build(BuildContext context) {
    final editMyListController = Get.put(EditMyListController(
      selectedItem: selectedItem,
      myListController: Get.find<MyListController>(),
    ));

    return Scaffold(
      backgroundColor: kGray,
      appBar: AppBar(
        toolbarHeight: 75.h,
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: KBackButton(
          onPressed: () {
            Get.off(() => Mylist());
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
                  controller: editMyListController.listNameController,
                  validator: validateListNameField,
                  textInputAction: TextInputAction.next,
                ),
                TextFieldAddSQL(
                  hintText: "Amount",
                  keyboardType: TextInputType.number,
                  controller: editMyListController.listAmountController,
                  validator: validateListAmountField,
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
