import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ledger_stacks/widgets/dropdown/dropdown.dart';
import 'package:ledger_stacks/widgets/textform.dart';

import '../../constants/color.dart';
import '../../widgets/button.dart';
import '../../widgets/dropdown/dropdown_controller.dart';
import '../../widgets/radio_button/radio_button.dart';
import '../mylist/mylist_page.dart';
import 'add_my_list_controller.dart';

class AddMyList extends GetView {
  AddMyList({super.key});
  final AddMyListController addMyListController =
      Get.put(AddMyListController());
  final DropDownTypeController dropDownTypeController =
      Get.put(DropDownTypeController());

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
              Get.off(() => const Mylist());
            },
          ),
          title: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              "New List",
              style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.bold),
            ),
          )),
      body: Padding(
          padding: EdgeInsets.symmetric(vertical: 25.h, horizontal: 20.w),
          child: Column(
            children: [
              RadioButton(),
              TextFieldAddSQL(
                hintText: "Name",
                controller: addMyListController.listNameController,
                textInputAction: TextInputAction.next,
              ),
              TextFieldAddSQL(
                hintText: "Amount",
                controller: addMyListController.listAmountController,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.done,
              ),
              DropDownType(),
              Obx(() {
                if (dropDownTypeController.selectedValue.value == 'Auto') {
                  return Column(
                    children: [
                      const SizedBox(height: 20),
                      DropDownFrequency(),
                    ],
                  );
                } else {
                  return const SizedBox();
                }
              })
            ],
          )),
    );
  }
}
