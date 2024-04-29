import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:ledger_stacks/models/transaction.dart';
import 'package:ledger_stacks/pages/myledger/ledger_controller.dart';
import 'package:ledger_stacks/util/convert_amount.dart';

import '../constants/color.dart';
import '../pages/myledger/edit_transaction.dart/edit_transaction_page.dart';
import '../util/database/database_service.dart';
import '../util/util.dart';

class LedgerDisplay extends GetView<LedgerController> {
  LedgerDisplay({super.key});

  final LedgerController ledgerController = Get.put(LedgerController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => ledgerController.myledger.isEmpty
        ? SizedBox(
            width: Get.width,
            height: Get.height * 0.7,
            child: Center(
              child: Text(
                "Not Found list data.",
                style: TextStyle(color: Colors.black.withAlpha(80)),
              ),
            ),
          )
        : GroupedListView(
            elements: ledgerController.myledger,
            groupBy: (TransactionModel transaction) {
              final dateDay = DateTime.parse(transaction.date!);
              return DateTime(dateDay.year, dateDay.month, dateDay.day);
            },
            groupComparator: (DateTime value1, DateTime value2) =>
                value2.compareTo(value1),
            itemComparator:
                (TransactionModel element1, TransactionModel element2) =>
                    DateTime.parse(element1.date!)
                        .compareTo(DateTime.parse(element2.date!)),
            order: GroupedListOrder.DESC,
            groupHeaderBuilder: (TransactionModel transaction) =>
                getGroupSeparator(transaction),
            itemBuilder: (BuildContext context, TransactionModel transaction) =>
                getitem(transaction),
          ));
  }
}

Widget getGroupSeparator(TransactionModel transaction) {
  return Padding(
    padding: EdgeInsets.only(bottom: 10.h),
    child: Container(
      height: 150.h,
      width: Get.width,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(36.r),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF4b4b4b).withOpacity(0.08),
              offset: const Offset(0, 8),
              blurRadius: 10,
              spreadRadius: 6,
            ),
          ]),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 45.w, vertical: 20.h),
        child: Column(
          children: [
            Row(children: [
              Text(
                "${DateTime.parse(transaction.date!).day}",
                style: TextStyle(
                  fontSize: 40.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                width: 5.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    getMonthName(transaction.date!),
                    style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    "${DateTime.parse(transaction.date!).year}",
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              )
            ]),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      "Income",
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w700,
                        color: kGreen,
                      ),
                    ),
                    Text(
                      '600',
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w700,
                        color: kGreen,
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "Expenses",
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w700,
                        color: kRed,
                      ),
                    ),
                    Text(
                      '600',
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w700,
                        color: kRed,
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "Balance",
                      style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w700,
                          color: kDarkviolet),
                    ),
                    Text(
                      '600',
                      style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w700,
                          color: kDarkviolet),
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    ),
  );
}

Widget getitem(TransactionModel transaction) {
  final LedgerController ledgerController = Get.put(LedgerController());
  return Padding(
    padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 10.h),
    child: Container(
      height: 35.h,
      width: Get.width,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.r),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF4b4b4b).withOpacity(0.08),
              offset: const Offset(0, 8),
              blurRadius: 10,
              spreadRadius: 6,
            ),
          ]),
      child: Padding(
        padding: EdgeInsets.only(left: 40.w, right: 10.w),
        child: Row(
          children: [
            Text(transaction.name),
            const Spacer(),
            Text(
              transaction.isIncome == 'income'
                  ? "+ ${convertToAmount(transaction.amount)}"
                  : "- ${convertToAmount(transaction.amount)}",
              style: TextStyle(
                color: transaction.isIncome == 'income' ? kGreen : kRed,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              width: 10.w,
            ),
            PopupMenuButton(
              iconColor: Colors.grey,
              itemBuilder: (context) => [
                PopupMenuItem(
                  child: GestureDetector(
                    onTap: () {
                      //This code Function Update have problem5
                      Get.off(() => EditTransaction(
                            selectedItem: transaction,
                          ));
                    },
                    child: const Text("Edit"),
                  ),
                ),
                PopupMenuItem(
                  child: GestureDetector(
                    onTap: () {
                      LedgetStackDB.instance
                          .deleteTransaction(transaction.id!, ledgerController);
                      Navigator.pop(context);
                    },
                    child: const Text("Delete"),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    ),
  );
}
