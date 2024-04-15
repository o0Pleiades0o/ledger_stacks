import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ledger_stacks/pages/home/home_page.dart';
import 'package:ledger_stacks/widgets/dropdown.dart';
import 'package:ledger_stacks/widgets/textform.dart';

import '../../constants/color.dart';
import '../../widgets/button.dart';
import '../../widgets/radio_button/radio_button.dart';
import 'add_my_list_controller.dart';

class AddMyList extends StatelessWidget {
  AddMyList({super.key});
  final AddMyListController addMyListController = Get.put(AddMyListController());

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
              "New List",
              style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.bold),
            ),
          )),
      body: Padding(
          padding: EdgeInsets.symmetric(vertical: 25.h, horizontal: 20.w),
          child: Column(
            children: [
              RadioButton(),
              TextFieldGeneral(controller: addMyListController.listNameController, labelText: 'List Name'),
              TextFieldGeneral(controller: addMyListController.listNameController, labelText: 'List Amount'),
              const DropDown()
            ],
          )),
    );
  }
}
