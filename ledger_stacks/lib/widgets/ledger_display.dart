import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:collection/collection.dart';
import 'package:ledger_stacks/models/transaction.dart';
import 'package:ledger_stacks/pages/myledger/ledger_controller.dart';
import 'package:ledger_stacks/util/convert_amount.dart';

import '../constants/color.dart';
import '../pages/home/home_page_controller.dart';
import '../pages/myledger/edit_transaction.dart/edit_transaction_page.dart';
import '../util/database/database_service.dart';
import '../util/util.dart';

class LedgerDisplay extends GetView<LedgerController> {
  LedgerDisplay({super.key});

  final LedgerController ledgerController = Get.put(LedgerController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      var groupByDate = groupBy(ledgerController.myledger, (TransactionModel e) => e.date!.substring(0, 10));

      if (groupByDate.isEmpty) {
        return SizedBox(
          width: Get.width,
          height: Get.height * 0.7,
          child: Center(
            child: Text(
              "Not Found list data.",
              style: TextStyle(color: Colors.black.withAlpha(80)),
            ),
          ),
        );
      } else {
        // Sort the keys (dates) in DESC order
        var sortedDates = groupByDate.keys.toList()..sort((a, b) => b.compareTo(a));

        return Stack(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(30.r), topRight: Radius.circular(30.r)),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(30.r), topRight: Radius.circular(30.r)),
                child: ListView.builder(
                  itemCount: sortedDates.length + 1, // Add 1 for the SizedBox
                  itemBuilder: (context, index) {
                    if (index == sortedDates.length) {
                      return SizedBox(
                        height: 80.h, // Adjust the height as needed
                      );
                    } else {
                      var date = sortedDates[index];
                      var transactions = groupByDate[date];
                      TransactionModel headerTransaction = transactions!.first;
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Header
                          HeaderLedger(headerTransaction: headerTransaction),
                          // Items under header
                          ItemLedger(
                            transactions: transactions,
                            ledgerController: ledgerController,
                          ),
                        ],
                      );
                    }
                  },
                ),
              ),
            ),
          ],
        );
      }
    });
  }
}

class ItemLedger extends GetView {
  ItemLedger({
    super.key,
    required this.transactions,
    required this.ledgerController,
  });

  final List<TransactionModel>? transactions;
  final LedgerController ledgerController;
  final HomePageController homePageController = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: transactions!.map((ledger) {
        return Padding(
          padding: EdgeInsets.only(left: 10.w, right: 10.w, bottom: 10.h),
          child: SizedBox(
            height: 35.h,
            width: Get.width,
            child: Obx(() {
              final isMultiTrue = ledgerController.isMultiSelect.isTrue;
              return Padding(
                  padding: EdgeInsets.only(left: isMultiTrue ? 15 : 40.w, right: 10.w),
                  child: Row(
                    children: [
                      isMultiTrue
                          ? Checkbox(
                              value: ledgerController.selectedItems.contains(ledger),
                              onChanged: (value) {
                                ledgerController.toggleSelection(ledger);
                              },
                            )
                          : const SizedBox(),
                      Expanded(
                        flex: 3,
                        child: Text(
                          ledger.name,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 15.sp),
                        ),
                      ),
                      const Spacer(),
                      Text(
                        ledger.isIncome == 'income' ? "+ ${convertToAmount(ledger.amount)}" : "- ${convertToAmount(ledger.amount)}",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 15.sp,
                          color: ledger.isIncome == 'income' ? kGreen : kRed,
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
                            onTap: () {
                              Get.off(() => EditTransaction(
                                    selectedItem: ledger,
                                  ));
                            },
                            child: const Text("Edit"),
                          ),
                          PopupMenuItem(
                            onTap: () {
                              LedgetStackDB.instance.deleteTransaction(ledger.id!, ledgerController);
                              homePageController.fetchData();
                            },
                            child: const Text("Delete"),
                          ),
                        ],
                      )
                    ],
                  ));
            }),
          ),
        );
      }).toList(),
    );
  }
}

class HeaderLedger extends StatelessWidget {
  const HeaderLedger({
    super.key,
    required this.headerTransaction,
  });

  final TransactionModel headerTransaction;

  @override
  Widget build(BuildContext context) {
    final dateDay = DateTime.parse(headerTransaction.date!);
    final date = dateDay.toIso8601String().substring(0, 10);

    return Padding(
      padding: EdgeInsets.only(bottom: 10.h),
      child: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 50,
            spreadRadius: -10,
            offset: const Offset(
              0,
              4,
            ),
          ),
        ]),
        child: Card(
          //margin: EdgeInsets.zero,
          surfaceTintColor: Colors.white,
          color: Colors.white,
          elevation: 8,
          shadowColor: Colors.black54,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 45.w, vertical: 20.h),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "${DateTime.parse(headerTransaction.date!).day}",
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
                          getMonthName(headerTransaction.date!),
                          style: TextStyle(
                            overflow: TextOverflow.ellipsis,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          "${DateTime.parse(headerTransaction.date!).year}",
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                FutureBuilder(
                  future: dailyIncomeValue(date),
                  builder: (context, incomeSnapshot) {
                    if (incomeSnapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator(); // Or any loading indicator
                    } else if (incomeSnapshot.hasError) {
                      return Text("Error: ${incomeSnapshot.error}");
                    } else {
                      return FutureBuilder(
                        future: dailyExpenseValue(date),
                        builder: (context, expenseSnapshot) {
                          if (expenseSnapshot.connectionState == ConnectionState.waiting) {
                            return const CircularProgressIndicator(); // Or any loading indicator
                          } else if (expenseSnapshot.hasError) {
                            return Text("Error: ${expenseSnapshot.error}");
                          } else {
                            double income = incomeSnapshot.data ?? 0.0;
                            double expense = expenseSnapshot.data ?? 0.0;
                            double balance = income - expense;
                            return Row(
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
                                      convertToAmount(income),
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
                                      "Expense",
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w700,
                                        color: kRed,
                                      ),
                                    ),
                                    Text(
                                      convertToAmount(expense),
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
                                        color: kViolet,
                                      ),
                                    ),
                                    Text(
                                      convertToAmount(balance),
                                      style: TextStyle(
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.w700,
                                        color: kViolet,
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            );
                          }
                        },
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
