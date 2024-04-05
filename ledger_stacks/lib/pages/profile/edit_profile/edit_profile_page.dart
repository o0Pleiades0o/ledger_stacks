import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ledger_stacks/auth/user_controller.dart';
import 'package:ledger_stacks/pages/profile/edit_profile/edit_profile_controller.dart';
import 'package:ledger_stacks/widgets/button.dart';

import '../../../util/util.dart';
import '../../../widgets/textform.dart';

class EditProflie extends StatelessWidget {
  const EditProflie({super.key});

  @override
  Widget build(BuildContext context) {
    final EditProflieController editProflieController =
        Get.put(EditProflieController());
    return Scaffold(
      appBar: AppBar(leading: KBackButton(
        onPressed: () {
          debugPrint('Back Pressed');
          Get.back();
        },
      )),
      body: Form(
        key: editProflieController.formKey,
        child: Column(
          children: [
            Center(
              child: Padding(
                  padding: EdgeInsets.only(top: 50.h, bottom: 20.h),
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: <Widget>[
                      CircleAvatar(
                        radius: 100.r,
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 20.w),
                        child: EditButton(onPressed: () {
                          debugPrint('edit Pressed');
                        }),
                      ),
                    ],
                  )),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 35.w),
              child: Column(
                children: [
                  TextFieldGeneral(
                    validator: validateEmailField,
                    controller: editProflieController.emailController,
                    labelText: 'Email',
                    icon: Icons.mail,
                  ),
                  TextFieldGeneral(
                    validator: validateUsernameField,
                    controller: editProflieController.usernameController,
                    labelText: 'Username',
                    icon: Icons.person,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 25.h),
                    child: ButtonRaL(
                        buttonText: 'Update',
                        onPressed: () {
                          if (editProflieController.formKey.currentState!
                              .validate()) {
                            UserController().updateUser();
                          }
                        }),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
