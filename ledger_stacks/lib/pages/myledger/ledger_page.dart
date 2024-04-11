import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ledger_stacks/widgets/floating_action_button.dart';

import '../../constants/color.dart';
import '../../widgets/button.dart';
import '../../widgets/card_ledget.dart';
import '../home/home_page.dart';

class MyLedger extends StatelessWidget {
  const MyLedger({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: kViolet,
          leading: KBackButton(
            onPressed: () {
              Get.off(() => const HomePage());
            },
          )),
      body: Stack(
        children: [
          Container(
              height: 170.h,
              width: Get.width,
              decoration: BoxDecoration(
                  color: kViolet,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30.r),
                    bottomRight: Radius.circular(30.r),
                  )),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Ledger",
                    style: TextStyle(
                        fontSize: 40.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                ],
              )),
          //Content
          Padding(
            padding: EdgeInsets.only(top: 100.h, left: 20.w, right: 20.w),
            //card
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18.r), color: kGray),
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return const CardLedger();
                },
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: const Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          EditeFAB(),
          CreateFAB(),
        ],
      ),
    );
  }
}
