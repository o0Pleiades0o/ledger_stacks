import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../auth/user_controller.dart';

class AvatarUser extends StatelessWidget {
  const AvatarUser({
    super.key,
    required this.userController,
    required this.radius,
    required this.height,
    required this.width,
  });

  final UserController userController;
  final int radius, height, width;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
        radius: radius.r,
        child: Obx(() => ClipOval(
              child: Container(
              color: Colors.transparent,
              child: userController.user.imageAvatar == ""
                  ? Image.asset(
                      'lib/assets/images/user2.png',
                      fit: BoxFit.cover,
                    )
                  : Obx(
                      () => Image.network(
                        userController.user.imageAvatar ?? '',
                        fit: BoxFit.cover,
                        height: height.r,
                        width: width.r,
                      ),
                    ),
            ))));
  }
}
