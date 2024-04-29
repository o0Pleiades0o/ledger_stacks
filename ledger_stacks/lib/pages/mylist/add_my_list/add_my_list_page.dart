import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ledger_stacks/pages/mylist/mylist_page.dart';
import 'package:ledger_stacks/widgets/dropdown/dropdown.dart';
import 'package:ledger_stacks/widgets/textform.dart';

import '../../../constants/color.dart';
import '../../../util/util.dart';
import '../../../widgets/button.dart';
import '../../../widgets/dropdown/dropdown_controller.dart';
import '../../../widgets/radio_button/radio_button.dart';
import '../../../widgets/radio_button/radio_controller.dart';
import '../../../widgets/snackbar.dart';
import 'add_my_list_controller.dart';

class AddMyList extends GetView {
  AddMyList({super.key});
  final RadioButtonController radioButtonController =
      Get.put(RadioButtonController());
  final AddMyListController addMyListController =
      Get.put(AddMyListController());
  final DropDownTypeController dropDownTypeController =
      Get.put(DropDownTypeController());
  final DropDownFrequencyController dropDownFrequencyController =
      Get.put(DropDownFrequencyController());

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
              Get.off(() => Mylist());
            },
          ),
          title: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              "New List",
              style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.bold),
            ),
          )),
      body: SingleChildScrollView(
        child: Form(
          key: addMyListController.formKey,
          child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20.w),
              child: Column(
                children: [
                  SizedBox(
                    height: 70.h,
                  ),
                  RadioButton(),
                  TextFieldAddSQL(
                    hintText: "Name",
                    validator: validateListNameField,
                    controller: addMyListController.listNameController,
                    textInputAction: TextInputAction.next,
                  ),
                  TextFieldAddSQL(
                    hintText: "Amount",
                    validator: validateListAmountField,
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
                  }),
                  const SizedBox(height: 20),
                  ButtonRaL(
                    buttonText: "Add",
                    onPressed: () async {
                      if (addMyListController.formKey.currentState!
                          .validate()) {
                        if (dropDownTypeController.selectedValue.value ==
                                'Daily' ||
                            (dropDownTypeController.selectedValue.value ==
                                    'Auto' &&
                                dropDownFrequencyController
                                        .selectedValue.value !=
                                    null)) {
                          await addMyListController.createMylist();
                        } else {
                          ErrorSnackbar.show(
                            title: 'Error',
                            message: 'Select Frequency before adding',
                          );
                        }
                      }
                    },
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
