import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ledger_stacks/constants/color.dart';
import 'package:ledger_stacks/util/database/database_service.dart';

import '../pages/mylist/edit_my_list/edit_my_list_page.dart';
import '../pages/mylist/mylist_controller.dart';
import '../util/convert_amount.dart';

class Listdata extends StatelessWidget {
  Listdata({super.key, required this.filterType});

  final String filterType;
  final MyListController myListController = Get.put(MyListController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final filteredLists = myListController.myLists.where((listData) {
        return listData.type == filterType;
      }).toList();

      return filteredLists.isEmpty
          ? Center(
              child: Text(
                "Not Found $filterType Data.",
                style: TextStyle(color: Colors.black.withAlpha(80)),
              ),
            )
          : SizedBox(
              height: filteredLists.length * 53.0,
              child: ListView.builder(
                itemCount: filteredLists.length,
                itemBuilder: (BuildContext context, int index) {
                  final myListItem = filteredLists[index];
                  return Padding(
                    padding: EdgeInsets.only(bottom: 10.h),
                    child: Container(
                      height: 35.h,
                      width: Get.width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 10.w, right: 5.w),
                        child: Obx(() {
                          return Row(
                            children: [
                              //Amount
                              myListController.isMultiSelect.isTrue
                                  ? Checkbox(
                                      value: myListController.selectedItems.contains(myListItem),
                                      onChanged: (value) {
                                        myListController.toggleSelection(myListItem);
                                      },
                                    )
                                  : const SizedBox(),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                myListItem.isIncome == 'income'
                                    ? "+ ${convertToAmount(myListItem.amount)}"
                                    : "- ${convertToAmount(myListItem.amount)}",
                                style: TextStyle(
                                  color: myListItem.isIncome == 'income' ? kGreen : kRed,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Expanded(
                                child: Text(
                                  myListItem.name,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Text(
                                myListItem.type == 'Auto' ? '${myListItem.frequency}' : '',
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              PopupMenuButton(
                                iconColor: Colors.grey,
                                itemBuilder: (context) => [
                                  PopupMenuItem(
                                    onTap: () {
                                      Get.off(() => EditMyList(selectedItem: myListItem));
                                    },
                                    child: const Text("Edit"),
                                  ),
                                  PopupMenuItem(
                                    onTap: () {
                                      LedgetStackDB.instance.deleteMyList(myListItem.id!, myListController);
                                    },
                                    child: const Text("Delete"),
                                  ),
                                ],
                              )
                            ],
                          );
                        }),
                      ),
                    ),
                  );
                },
              ),
            );
    });
  }
}
