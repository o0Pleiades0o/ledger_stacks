import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ledger_stacks/constants/color.dart';
import 'package:ledger_stacks/pages/mylist/edite_my_list/edit_my_list_controller.dart';
import 'package:ledger_stacks/widgets/button.dart';
import 'package:ledger_stacks/widgets/textform.dart';

import '../mylist_page.dart';

class EditMyList extends GetView {
  EditMyList({super.key});

  final EditMyListController editMyListController =
      Get.put(EditMyListController());

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
            "Edit List",
            style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: editMyListController.formKey,
          child: Padding(
              padding: EdgeInsets.symmetric(vertical: 150, horizontal: 20.w),
              child: Column(
                children: [
                  TextFieldAddSQL(controller: controller, hintText: "test1")
                ],
              )),
        ),
      ),
    );
  }
}
