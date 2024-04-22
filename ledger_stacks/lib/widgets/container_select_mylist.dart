import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:ledger_stacks/pages/mylist/mylist_controller.dart';

import '../constants/color.dart';
import '../util/convert_amount.dart';

class ContainerSelectMylist extends StatelessWidget {
  ContainerSelectMylist({
    super.key,
    this.filterType,
  });

  final String? filterType;
  final MyListController myListController = Get.put(MyListController());

  @override
  Widget build(BuildContext context) {
    // final filteredLists = myListController.myLists.where((listData) {
    //   return listData.type == filterType;
    // }).toList();

    return Container(
      height: 220.h,
      width: Get.width,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.r), topRight: Radius.circular(30.r))),
      child: Column(
        children: [
          const Header(),
          myListController.myLists.isEmpty
              ? Center(
                  child: Text(
                    "Not Found list data.",
                    style: TextStyle(color: Colors.black.withAlpha(80)),
                  ),
                )
              : SizedBox(
                  height: myListController.myLists.length * 53.0,
                  child: ListView.builder(
                    itemCount: myListController.myLists.length,
                    itemBuilder: (BuildContext context, int index) {
                      final myListItem = myListController.myLists[index];
                      return Container(
                        height: 35.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                            border: Border.all(color: Colors.black87)),
                        child: Row(
                          children: [
                            Text(
                              myListItem.isIncome == 'income'
                                  ? "+ ${convertToAmount(myListItem.amount)}"
                                  : "- ${convertToAmount(myListItem.amount)}",
                              style: TextStyle(
                                color: myListItem.isIncome == 'income'
                                    ? kGreen
                                    : kRed,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Text(myListItem.name),
                          ],
                        ),
                      );
                    },
                  ),
                )
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
