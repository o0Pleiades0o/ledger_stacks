import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ledger_stacks/constants/color.dart';

import '../pages/mylist/mylist_controller.dart';

class Listdata extends StatelessWidget {
  Listdata({super.key});

  final MyListController controller = Get.put(MyListController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.myLists.isEmpty
        ? Center(
            child: Text(
            "Not Found list data.",
            style: TextStyle(color: Colors.black.withAlpha(80)),
          ))
        : ListView.builder(
            itemCount: controller.myLists.length,
            itemBuilder: (BuildContext context, int index) {
              final myList = controller.myLists[index];
              return Padding(
                padding: EdgeInsets.only(bottom: 5.h),
                child: Container(
                  height: 35.h,
                  width: Get.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.r)),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40.w),
                    child: Row(
                      children: [
                        Text(
                          myList.name,
                        ),
                        const Spacer(),
                        myList.isIncome == 'income'
                            ? Text(
                                "${myList.amount}",
                                style: TextStyle(
                                    color: kGreen, fontWeight: FontWeight.bold),
                              )
                            : Text(
                                "- ${myList.amount}",
                                style: TextStyle(
                                    color: kRed, fontWeight: FontWeight.bold),
                              )
                      ],
                    ),
                  ),
                ),
              );
            },
          ));
  }
}
