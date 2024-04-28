import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:ledger_stacks/pages/add_transaction.dart/transaction_controller.dart';
import 'package:ledger_stacks/pages/mylist/mylist_controller.dart';
import 'package:ledger_stacks/widgets/radio_button/radio_controller.dart';

import '../constants/color.dart';
import '../util/convert_amount.dart';

class ContainerSelectMylist extends GetView<MyListController> {
  ContainerSelectMylist({
    super.key,
    this.filterType,
  });

  final String? filterType;
  final MyListController myListController = Get.put(MyListController());
  final AddTransactionController addTransactionController =
      Get.put(AddTransactionController());
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.3,
      width: Get.width,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.r), topRight: Radius.circular(30.r))),
      child: Column(
        children: [
          const Header(),
          Expanded(
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Obx(
                () => myListController.myLists.isEmpty
                    ? SizedBox(
                        width: Get.width,
                        height: 150.h,
                        child: Center(
                          child: Text(
                            "Not Found list data.",
                            style: TextStyle(color: Colors.black.withAlpha(80)),
                          ),
                        ),
                      )
                    : Wrap(
                        direction: Axis.horizontal,
                        children: myListController.myLists
                            .map((mylistItem) => Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      addTransactionController.nameController
                                          .text = mylistItem.name;
                                      addTransactionController.amountController
                                          .text = mylistItem.amount.toString();
                                      addTransactionController
                                              .radioButtonController
                                              .selectedCharacter
                                              .value =
                                          mylistItem.isIncome.toString() ==
                                                  'income'
                                              ? SingingCharacter.income
                                              : SingingCharacter.expense;
                                    },
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.white),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          mylistItem.isIncome == 'income'
                                              ? "+ ${convertToAmount(mylistItem.amount)}"
                                              : "- ${convertToAmount(mylistItem.amount)}",
                                          style: TextStyle(
                                            color:
                                                mylistItem.isIncome == 'income'
                                                    ? kGreen
                                                    : kRed,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 5.w,
                                        ),
                                        Text(
                                          mylistItem.name,
                                          style: const TextStyle(
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ))
                            .toList(),
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
              onPressed: () {
                debugPrint("change to temporary list");
              },
              icon: const Icon(
                FontAwesomeIcons.angleLeft,
                color: Colors.grey,
              )),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Text(
              "Daily list",
              style: TextStyle(color: Colors.grey, fontSize: 20.sp),
            ),
          ),
          IconButton(
              onPressed: () {
                debugPrint("Pressed");
              },
              icon: const Icon(
                FontAwesomeIcons.angleRight,
                color: Colors.grey,
              )),
        ],
      ),
    );
  }
}
