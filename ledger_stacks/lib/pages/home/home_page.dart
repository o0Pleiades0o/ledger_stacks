import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ledger_stacks/auth/user_controller.dart';
import 'package:ledger_stacks/constants/color.dart';
import 'package:ledger_stacks/pages/home/Home_pages_content/main_content.dart';
import 'package:ledger_stacks/pages/myledger/add_transaction.dart/transaction_page.dart';
import 'package:ledger_stacks/pages/profile/proflie_page.dart';
import 'package:ledger_stacks/util/convert_amount.dart';
//import 'package:ledger_stacks/util/util.dart';
import 'package:ledger_stacks/widgets/coins.dart';
import 'package:ledger_stacks/widgets/percent_chart.dart';

import '../../widgets/avatar_user.dart';
import '../../widgets/column_charts.dart';
import '../../widgets/floating_action_button.dart';
import '../../widgets/navigation_bar.dart';

class HomePage extends GetView {
  const HomePage({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final userController = Get.find<UserController>();
    final homeController = Get.put(HomePageController());
    //final dateDay = DateTime.now();

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
              height: 40,
              width: 40,
            ),
          ),
        ),
        title: Text('Hello! ${userController.user.username}', style: TextStyle(fontSize: 25.sp, fontWeight: FontWeight.bold)),
      ),
      body: Padding(
          padding: const EdgeInsets.only(right: 20, left: 20, bottom: 20),
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
                  child: const PercentChart(),
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
                                    Obx(() {
                                      return Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(convertToAmount(homeController.monthlyIncome.value),
                                              style: TextStyle(color: kGreen, fontWeight: FontWeight.bold, fontSize: 28)),
                                          const Coins()
                                        ],
                                      );
                                    })

                                    // FutureBuilder(
                                    //     future: monthlyIncomeValue(dateDay.toIso8601String()),
                                    //     builder: (context, incomeSnapshot) {
                                    //       if (incomeSnapshot.connectionState == ConnectionState.waiting) {
                                    //         return const CircularProgressIndicator(); // Or any loading indicator
                                    //       } else if (incomeSnapshot.hasError) {
                                    //         return Text("Error: ${incomeSnapshot.error}");
                                    //       } else {
                                    //         double income = incomeSnapshot.data ?? 0.0;
                                    //         return Row(
                                    //           mainAxisAlignment: MainAxisAlignment.center,
                                    //           children: [
                                    //             Text(
                                    //               convertToAmount(income),
                                    //               style: TextStyle(color: kGreen, fontWeight: FontWeight.bold, fontSize: 28),
                                    //             ),
                                    //             const Coins()
                                    //           ],
                                    //         );
                                    //       }
                                    //     })
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
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 15),
                                  child: Column(
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.only(right: 60),
                                        child: Column(
                                          children: [
                                            Text(
                                              "Expense",
                                              style: TextStyle( fontWeight: FontWeight.bold, fontSize: 12),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Obx(() {
                                        return Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text(convertToAmount(homeController.monthlyExpense.value),
                                                style: TextStyle(color: kRed, fontWeight: FontWeight.bold, fontSize: 28)),
                                            const Coins()
                                          ],
                                        );
                                      })
                                      // FutureBuilder(
                                      //     future: monthlyExpenseValue(dateDay.toIso8601String()),
                                      //     builder: (context, expenseSnapshot) {
                                      //       if (expenseSnapshot.connectionState == ConnectionState.waiting) {
                                      //         return const CircularProgressIndicator(); // Or any loading indicator
                                      //       } else if (expenseSnapshot.hasError) {
                                      //         return Text("Error: ${expenseSnapshot.error}");
                                      //       } else {
                                      //         double expense = expenseSnapshot.data ?? 0.0;
                                      //         return Row(
                                      //           mainAxisAlignment: MainAxisAlignment.center,
                                      //           children: [
                                      //             Text(
                                      //               convertToAmount(expense),
                                      //               style: TextStyle(color: kRed, fontWeight: FontWeight.bold, fontSize: 28),
                                      //             ),
                                      //             const Center(child: Coins())
                                      //           ],
                                      //         );
                                      //       }
                                      //     })
                                    ],
                                  ),
                                )),
                          ),
                        ],
                      ),
                      //show Balance percent
                      Container(
                          height: 145.h,
                          width: 145.w,
                          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(18.r)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
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
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Obx(() {
                                    return Text(
                                      '${convertToPercent(homeController.monthlybalancePercent.value)}%',
                                      style: TextStyle(color: kViolet, fontWeight: FontWeight.bold, fontSize: 40),
                                    );
                                  }),
                                  Obx(() {
                                    return Text(convertToAmount(homeController.monthlyBalance.value),
                                        style: TextStyle(color: kDarkgray, fontWeight: FontWeight.bold));
                                  })
                                  // FutureBuilder(
                                  //     future: calculateMonthlyBalancePercent(dateDay.toIso8601String()),
                                  //     builder: (context, balancePercentSnapshot) {
                                  //       if (balancePercentSnapshot.connectionState == ConnectionState.waiting) {
                                  //         return const CircularProgressIndicator(); // Or any loading indicator
                                  //       } else if (balancePercentSnapshot.hasError) {
                                  //         return Text("Error: ${balancePercentSnapshot.error}");
                                  //       } else {
                                  //         double balancePercent = balancePercentSnapshot.data ?? 0.0;
                                  //         return Text(
                                  //           '${convertToPercent(balancePercent)}%',
                                  //           style: TextStyle(color: kViolet, fontWeight: FontWeight.bold, fontSize: 40),
                                  //         );
                                  //       }
                                  //     }),

                                  // FutureBuilder(
                                  //     future: calculateMonthlyBalance(dateDay.toIso8601String()),
                                  //     builder: (context, balanceSnapshot) {
                                  //       if (balanceSnapshot.connectionState == ConnectionState.waiting) {
                                  //         return const CircularProgressIndicator(); // Or any loading indicator
                                  //       } else if (balanceSnapshot.hasError) {
                                  //         return Text("Error: ${balanceSnapshot.error}");
                                  //       } else {
                                  //         double balance = balanceSnapshot.data ?? 0.0;
                                  //         return Text(convertToAmount(balance), style: TextStyle(color: kDarkgray, fontWeight: FontWeight.bold));
                                  //       }
                                  //     }),
                                ],
                              ),
                            ],
                          )),
                    ],
                  ),
                ),
                //show Graph
                Container(
                  height: 170.h,
                  width: Get.width,
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(25.r)),
                  child: const ColumnChart2(),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: navigationBar(),
            )
          ])),
      floatingActionButton: CustomFloatingActionButton(onPressed: () {
        Get.to(() => AddTransaction());
      }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
