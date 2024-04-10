import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:ledger_stacks/pages/home/home_page.dart';
import 'package:ledger_stacks/pages/profile/edit_profile/edit_profile_page.dart';

import '../../auth/auth_controller.dart';
import '../../auth/user_controller.dart';
import '../../constants/color.dart';
import '../../widgets/avatar_user.dart';
import '../../widgets/button.dart';
import '../login/login_page.dart';

class Proflie extends StatelessWidget {
  const Proflie({super.key});

  @override
  Widget build(BuildContext context) {
    final userController = Get.find<UserController>();
    final authController = Get.find<AuthController>();
    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 75.h,
          backgroundColor: kGray,
          leading: KBackButton(onPressed: () {
            Get.offAll(() => const HomePage());
          })),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 35.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AvatarUser(
                userController: userController,
                radius: 100,
                height: 200,
                width: 200,
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                userController.user.username!,
                style: TextStyle(
                    fontSize: 25.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87),
              ),
              Text(userController.user.email!,
                  style: TextStyle(fontSize: 18.sp, color: kDarkgray)),
              CusNavigationBotton(
                onPressed: () {
                  Get.off(() => const EditProflie());
                },
                text: 'Edit Profile',
                iconSuffix: Icons.edit,
                iconTrailing: FontAwesomeIcons.angleRight,
              ),
              CusNavigationBotton(
                onPressed: () {
                  authController.signOut();
                  Get.offAll(() => const LoginPage());
                },
                text: 'Logout',
                iconSuffix: Icons.logout,
              )
            ],
          ),
        ),
      ),
    );
  }
}
