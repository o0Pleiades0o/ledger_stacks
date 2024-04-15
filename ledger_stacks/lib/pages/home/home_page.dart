import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ledger_stacks/auth/user_controller.dart';
import 'package:ledger_stacks/constants/color.dart';
//import 'package:ledger_stacks/pages/profile/edit_profile/edit_profile_page.dart';
import 'package:ledger_stacks/pages/profile/proflie_page.dart';

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
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80.h,
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
              radius: 25,
              height: 60,
              width: 60,
            ),
          ),
        ),
        title: Text('Hello! ${userController.user.username}',
            style: TextStyle(fontSize: 25.sp, fontWeight: FontWeight.bold)),
      ),
      body: Padding(
          padding: const EdgeInsets.all(20),
          child: Stack(children: [
            Column(
              children: <Widget>[
                //show Stat percent
                Container(
                  height: 135.h,
                  width: Get.width,
                  decoration: BoxDecoration(
                      color: kDarkgray,
                      borderRadius: BorderRadius.circular(18.r)),
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
                            height: 100.h,
                            width: 170.w,
                            decoration: BoxDecoration(
                                color: kDarkgray,
                                borderRadius: BorderRadius.circular(18.r)),
                          ),
                          //show Expenses
                          Padding(
                            padding: EdgeInsets.only(top: 10.h),
                            child: Container(
                              height: 100.h,
                              width: 170.w,
                              decoration: BoxDecoration(
                                  color: kDarkgray,
                                  borderRadius: BorderRadius.circular(18.r)),
                            ),
                          ),
                        ],
                      ),
                      //show percent left
                      Container(
                        height: 215.h,
                        width: 145.w,
                        decoration: BoxDecoration(
                            color: kDarkgray,
                            borderRadius: BorderRadius.circular(18.r)),
                      ),
                    ],
                  ),
                ),
                //show Graph
                Container(
                  height: 125.h,
                  width: Get.width,
                  decoration: BoxDecoration(
                      color: kDarkgray,
                      borderRadius: BorderRadius.circular(18.r)),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: navigationBar(),
            )
          ])),
      floatingActionButton: CustomFloatingActionButton(
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
