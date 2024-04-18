import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ledger_stacks/constants/color.dart';
import 'package:ledger_stacks/pages/myledger/edit_ledger/ledger_list_controller.dart';

class CardLedger extends StatelessWidget {
  const CardLedger({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //card
        Padding(
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
                  )
                ]),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 45.w, vertical: 20.h),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "${10 + Random().nextInt(8)}",
                        style: TextStyle(
                          fontSize: 40.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            "Feb.",
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            "2024",
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
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
        ),
        LedgerList()
      ],
    );
  }
}

class Listtile extends StatelessWidget {
  const Listtile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 15.w,
      ),
      child: ListTile(
        title: Text(
          "List ${1 + Random().nextInt(4)}",
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
        ),
        trailing: Text(
          "\$${1 + Random().nextInt(4) * 100}",
          style: TextStyle(fontSize: 16.sp),
        ),
      ),
    );
  }
}

class LedgerList extends StatelessWidget {
  LedgerList({super.key});

  final LedgerListControoler controller = Get.put(LedgerListControoler());

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.ledgerList.isEmpty
        ? Center(
            child: Text(
            "Not Found list data.",
            style: TextStyle(color: Colors.black.withAlpha(80)),
          ))
          :ListView.builder(
            itemCount: controller.ledgerList.length,
             itemBuilder: (BuildContext context, int index) {
              final ledgerlist = controller.ledgerList[index];
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
                            ledgerlist.name,
                          ),
                          const Spacer(),
                          ledgerlist.isIncome == 'income'
                              ? Text(
                                  "${ledgerlist.amount}",
                                  style: TextStyle(
                                      color: kGreen,
                                      fontWeight: FontWeight.bold),
                                )
                              : Text(
                                  "- ${ledgerlist.amount}",
                                  style: TextStyle(
                                      color: kRed, fontWeight: FontWeight.bold),
                                )
                        ],
                      ),
                    ),
                  ),
                );
             }
          )
        );
  }
}
