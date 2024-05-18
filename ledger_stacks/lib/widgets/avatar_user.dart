import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ledger_stacks/constants/color.dart';

import '../auth/user_controller.dart';

class AvatarUser extends StatelessWidget {
  const AvatarUser(
      {super.key, required this.userController, required this.radius, required this.height, required this.width, this.assetheight, this.assetwidth});

  final UserController userController;
  final int? radius, height, width, assetheight, assetwidth;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius?.r,
      backgroundColor: kGray,
      child: Obx(
        () {
          // ignore: unnecessary_null_comparison
          if (userController.user == null) {
            return const CircularProgressIndicator();
          } else {
            final String? imageAvatar = userController.user.imageAvatar;
            return ClipOval(
              child: imageAvatar == null || imageAvatar.isEmpty
                  ? Image.asset(
                      'lib/assets/images/user2.png',
                      fit: BoxFit.cover,
                      height: assetheight?.r,
                      width: assetwidth?.r,
                      color: Colors.grey.shade400,
                    )
                  : Image.network(
                      imageAvatar,
                      fit: BoxFit.cover,
                      height: height?.r,
                      width: width?.r,
                    ),
            );
          }
        },
      ),
    );
  }
}
