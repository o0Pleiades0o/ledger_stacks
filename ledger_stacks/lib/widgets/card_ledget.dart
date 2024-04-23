import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ledger_stacks/constants/color.dart';
import 'package:ledger_stacks/models/transaction.dart';
import 'package:ledger_stacks/pages/myledger/edit_ledger/ledger_list_controller.dart';
import 'package:sticky_grouped_list/sticky_grouped_list.dart';

// class CardLedger extends StatelessWidget {
//   const CardLedger({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Padding(
//           padding: EdgeInsets.only(bottom: 10.h),
//           child: Container(
//             height: 150.h,
//             width: Get.width,
//             decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(36.r),
//                 boxShadow: [
//                   BoxShadow(
//                     color: const Color(0xFF4b4b4b).withOpacity(0.08),
//                     offset: const Offset(0, 8),
//                     blurRadius: 10,
//                     spreadRadius: 6,
//                   )
//                 ]),
//             child: Padding(
//               padding: EdgeInsets.symmetric(horizontal: 45.w, vertical: 20.h),
//               child: Column(
//                 children: [
//                   Row(
//                     children: [
//                       Text(
//                         "${10 + Random().nextInt(8)}",
//                         style: TextStyle(
//                           fontSize: 40.sp,
//                           fontWeight: FontWeight.w700,
//                         ),
//                       ),
//                       Column(
//                         children: [
//                           Text(
//                             "Feb.",
//                             style: TextStyle(
//                               fontSize: 12.sp,
//                               fontWeight: FontWeight.w700,
//                             ),
//                           ),
//                           Text(
//                             "2024",
//                             style: TextStyle(
//                               fontSize: 12.sp,
//                               fontWeight: FontWeight.w700,
//                             ),
//                           ),
//                         ],
//                       )
//                     ],
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Column(
//                         children: [
//                           Text(
//                             "Income",
//                             style: TextStyle(
//                               fontSize: 12.sp,
//                               fontWeight: FontWeight.w700,
//                               color: kGreen,
//                             ),
//                           ),
//                           Text(
//                             '600',
//                             style: TextStyle(
//                               fontSize: 20.sp,
//                               fontWeight: FontWeight.w700,
//                               color: kGreen,
//                             ),
//                           )
//                         ],
//                       ),
//                       Column(
//                         children: [
//                           Text(
//                             "Expenses",
//                             style: TextStyle(
//                               fontSize: 12.sp,
//                               fontWeight: FontWeight.w700,
//                               color: kRed,
//                             ),
//                           ),
//                           Text(
//                             '600',
//                             style: TextStyle(
//                               fontSize: 20.sp,
//                               fontWeight: FontWeight.w700,
//                               color: kRed,
//                             ),
//                           )
//                         ],
//                       ),
//                       Column(
//                         children: [
//                           Text(
//                             "Balance",
//                             style: TextStyle(
//                                 fontSize: 12.sp,
//                                 fontWeight: FontWeight.w700,
//                                 color: kDarkviolet),
//                           ),
//                           Text(
//                             '600',
//                             style: TextStyle(
//                                 fontSize: 20.sp,
//                                 fontWeight: FontWeight.w700,
//                                 color: kDarkviolet),
//                           )
//                         ],
//                       ),
//                     ],
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ),
//         //LedgerList()
//       ],
//     );
//   }
// }

// class DailyCard extends StatelessWidget {
//   DailyCard({super.key});

//   final LedgerListController _ledgerListController =
//       Get.put(LedgerListController());

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//         child: ListView.builder(
//             itemCount: _ledgerListController.ledgerList.length,
//             itemBuilder: (BuildContext context, int index) {
//               final ledgerList = _ledgerListController.ledgerList[index];
//               return Padding(
//                   padding: EdgeInsets.only(bottom: 10.h),
//                   child: Container(
//                     height: 150.h,
//                     width: Get.width,
//                     decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(36.r),
//                         boxShadow: [
//                           BoxShadow(
//                             color: const Color(0xFF4b4b4b).withOpacity(0.08),
//                             offset: const Offset(0, 8),
//                             blurRadius: 10,
//                             spreadRadius: 6,
//                           )
//                         ]),
//                         child: Padding(
//               padding: EdgeInsets.symmetric(horizontal: 45.w, vertical: 20.h),
//               child: Column(
//                 children: [
//                   Row(
//                     children: [
//                       Text(
//                         "${10 + Random().nextInt(8)}",
//                         style: TextStyle(
//                           fontSize: 40.sp,
//                           fontWeight: FontWeight.w700,
//                         ),
//                       ),
//                       Column(
//                         children: [
//                           Text(
//                             "Feb.",
//                             style: TextStyle(
//                               fontSize: 12.sp,
//                               fontWeight: FontWeight.w700,
//                             ),
//                           ),
//                           Text(
//                             "${ledgerList.date}",
//                             style: TextStyle(
//                               fontSize: 12.sp,
//                               fontWeight: FontWeight.w700,
//                             ),
//                           ),
//                         ],
//                       )
//                     ],
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Column(
//                         children: [
//                           Text(
//                             "Income",
//                             style: TextStyle(
//                               fontSize: 12.sp,
//                               fontWeight: FontWeight.w700,
//                               color: kGreen,
//                             ),
//                           ),
//                           Text(
//                             '600',
//                             style: TextStyle(
//                               fontSize: 20.sp,
//                               fontWeight: FontWeight.w700,
//                               color: kGreen,
//                             ),
//                           )
//                         ],
//                       ),
//                       Column(
//                         children: [
//                           Text(
//                             "Expenses",
//                             style: TextStyle(
//                               fontSize: 12.sp,
//                               fontWeight: FontWeight.w700,
//                               color: kRed,
//                             ),
//                           ),
//                           Text(
//                             '600',
//                             style: TextStyle(
//                               fontSize: 20.sp,
//                               fontWeight: FontWeight.w700,
//                               color: kRed,
//                             ),
//                           )
//                         ],
//                       ),
//                       Column(
//                         children: [
//                           Text(
//                             "Balance",
//                             style: TextStyle(
//                                 fontSize: 12.sp,
//                                 fontWeight: FontWeight.w700,
//                                 color: kDarkviolet),
//                           ),
//                           Text(
//                             '600',
//                             style: TextStyle(
//                                 fontSize: 20.sp,
//                                 fontWeight: FontWeight.w700,
//                                 color: kDarkviolet),
//                           )
//                         ],
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//                   ));
//             }));
//   }
// }

// class LedgerList extends StatelessWidget {
//   LedgerList({super.key, required this.filterDate});

//   final LedgerListController ledgerListController =
//       Get.put(LedgerListController());

//   final String filterDate;
//   final LedgerListController _ledgerListController =
//       Get.put(LedgerListController());

//   @override
//   Widget build(BuildContext context) {
//     return Obx(() {
//       final filteredLedger = _ledgerListController.ledgerList.where((listData) {
//         return listData.date == filterDate;
//       }).toList();

//       return filteredLedger.isEmpty
//           ? Center(
//               child: Text(
//                 "Not Found list data.",
//                 style: TextStyle(color: Colors.black.withAlpha(80)),
//               ),
//             )
//           : SizedBox(
//               height: filteredLedger.length * 53.0,
//               child: ListView.builder(
//                 itemCount: ledgerListController.ledgerList.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   final ledgerList = ledgerListController.ledgerList[index];
//                   return Padding(
//                     padding: EdgeInsets.only(bottom: 5.h),
//                     child: Container(
//                       height: 25.h,
//                       width: Get.width,
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(8.r),
//                       ),
//                       child: Padding(
//                         padding: EdgeInsets.symmetric(horizontal: 40.w),
//                         child: Row(
//                           children: [
//                             Text(ledgerList.name),
//                             const Spacer(),
//                             Text(
//                               ledgerList.isIncome == 'income'
//                                   ? "${ledgerList.amount}"
//                                   : "- ${ledgerList.amount}",
//                               style: TextStyle(
//                                 color: ledgerList.isIncome == 'income'
//                                     ? kGreen
//                                     : kRed,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             );
//     });
//   }
// }

class LedgerDisplay extends StatelessWidget {
  LedgerDisplay({super.key});
  final LedgerListController ledgerListController =
      Get.put(LedgerListController());

  @override
  Widget build(BuildContext context) {
    debugPrint('Item : ${ledgerListController.ledgerList}');
    return StickyGroupedListView(
      elements: ledgerListController.ledgerList,
      groupBy: (TransactionModel transaction) =>
          '${DateTime.parse(transaction.date!).day}-${DateTime.parse(transaction.date!).month}-${DateTime.parse(transaction.date!).year}',
      order: StickyGroupedListOrder.ASC,
      groupComparator: (String value1, String value2) =>
          DateTime.parse(value2).compareTo(DateTime.parse(value1)),
      itemComparator: (TransactionModel element1, TransactionModel element2) =>
          DateTime.parse(element1.date!)
              .compareTo(DateTime.parse(element2.date!)),
      floatingHeader: true,
      groupSeparatorBuilder: (TransactionModel transaction) =>
          getGroupSeparator(transaction),
      itemBuilder: (BuildContext context, TransactionModel transaction) =>
          _getItem(context, transaction),
    );
  }
}

Widget getGroupSeparator(TransactionModel transaction) {
  // Customize your group separator widget
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
    color: Colors.grey[300],
    child: Text(
      '${DateTime.parse(transaction.date!).day}-${DateTime.parse(transaction.date!).month}-${DateTime.parse(transaction.date!).year}', // Display the date as the group title
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
    ),
  );
}

Widget _getItem(BuildContext context, TransactionModel transaction) {
  // Customize your list item widget
  return ListTile(
    title: Text(transaction.name),
    subtitle: Text(transaction.amount.toString()),
    // Add more details from TransactionModel as needed
  );
}
