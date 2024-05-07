import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ledger_stacks/auth/user_controller.dart';
import 'package:ledger_stacks/constants/color.dart';
import 'package:ledger_stacks/pages/myledger/add_transaction.dart/transaction_page.dart';
//import 'package:ledger_stacks/pages/profile/edit_profile/edit_profile_page.dart';
import 'package:ledger_stacks/pages/profile/proflie_page.dart';
import 'package:ledger_stacks/util/convert_amount.dart';
import 'package:ledger_stacks/util/util.dart';
import 'package:ledger_stacks/widgets/percent_chart.dart';

import '../../widgets/avatar_user.dart';
import '../../widgets/floating_action_button.dart';
import '../../widgets/navigation_bar.dart';

//import 'package:ledger_stacks/widgets/button.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final userController = Get.find<UserController>();
    final dateDay = DateTime.now();

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70.h,
        backgroundColor: kGray,
        leadingWidth: 70.w,
        leading: Padding(
          padding: EdgeInsets.only(left: 10.h),
          child: GestureDetector(
            onTap: () {
              Get.off(() => const Proflie());
            },
            child: AvatarUser(
              userController: userController,
              radius: 40,
              height: 60,
              width: 60,
            ),
          ),
        ),
        title: Text('Hello! ${userController.user.username}', style: TextStyle(fontSize: 25.sp, fontWeight: FontWeight.bold)),
      ),
      body: Padding(
          padding: const EdgeInsets.all(20),
          child: Stack(children: [
            Column(
              children: [
                //show Stat percent
                Container(
                  height: 140.h,
                  width: Get.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25.r),
                  ),
                  child: PercentChart(),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          //show income
                          Container(
                              height: 70.h,
                              width: 170.w,
                              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(18.r)),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 15),
                                child: Column(
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(right: 60),
                                      child: Column(
                                        children: [
                                          Text(
                                            "Income",
                                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                                          ),
                                        ],
                                      ),
                                    ),
                                    FutureBuilder(
                                        future: monthlyIncomeValue(dateDay.toIso8601String()),
                                        builder: (context, incomeSnapshot) {
                                          if (incomeSnapshot.connectionState == ConnectionState.waiting) {
                                            return const CircularProgressIndicator(); // Or any loading indicator
                                          } else if (incomeSnapshot.hasError) {
                                            return Text("Error: ${incomeSnapshot.error}");
                                          } else {
                                            double income = incomeSnapshot.data ?? 0.0;
                                            return Text(
                                              convertToAmount(income), //แสดงค่าจาก calculateMonthlyAmount ตรงนี้
                                              style: TextStyle(color: kGreen, fontWeight: FontWeight.bold, fontSize: 28),
                                            );
                                          }
                                        })
                                  ],
                                ),
                              )),
                          //show Expenses
                          Padding(
                            padding: EdgeInsets.only(top: 10.h),
                            child: Container(
                                height: 70.h,
                                width: 170.w,
                                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(18.r)),
                                child: const Padding(
                                  padding: EdgeInsets.only(top: 15),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(right: 60),
                                        child: Column(
                                          children: [
                                            Text(
                                              "Expense",
                                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Text(
                                        "+324",
                                        style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 28),
                                      )
                                    ],
                                  ),
                                )),
                          ),
                        ],
                      ),
                      //show percent left
                      Container(
                          height: 145.h,
                          width: 145.w,
                          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(18.r)),
                          child: Padding(
                            padding: EdgeInsets.only(top: 15.h),
                            child: Padding(
                              padding: EdgeInsets.only(top: 30.h),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(right: 60.r),
                                    child: const Column(
                                      children: [
                                        Text(
                                          "Balance",
                                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Text(
                                    "50%",
                                    style: TextStyle(color: kViolet, fontWeight: FontWeight.bold, fontSize: 40),
                                  ),
                                  Text("355", style: TextStyle(color: kDarkgray, fontWeight: FontWeight.bold))
                                ],
                              ),
                            ),
                          )),
                    ],
                  ),
                ),
                //show Graph
                Container(
                  height: 170.h,
                  width: Get.width,
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(25.r)),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: navigationBar(),
            )
          ])),
      floatingActionButton: CustomFloatingActionButton(onPressed: () {
        Get.off(() => AddTransaction());
      }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
