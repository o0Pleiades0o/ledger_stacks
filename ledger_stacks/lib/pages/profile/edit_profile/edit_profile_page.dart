import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ledger_stacks/auth/user_controller.dart';
import 'package:ledger_stacks/constants/color.dart';
import 'package:ledger_stacks/pages/profile/edit_profile/edit_profile_controller.dart';
import 'package:ledger_stacks/pages/profile/proflie_page.dart';
import 'package:ledger_stacks/widgets/button.dart';

import '../../../util/util.dart';
import '../../../widgets/textform.dart';

class EditProflie extends StatelessWidget {
  const EditProflie({super.key});

  @override
  Widget build(BuildContext context) {
    final EditProflieController editProflieController =
        Get.put(EditProflieController());
    final UserController userController = Get.put(UserController());
    return Scaffold(
      appBar: AppBar(
          backgroundColor: kGray,
          leading: KBackButton(
            onPressed: () {
              Get.off(() => const Proflie());
            },
          )),
      body: SingleChildScrollView(
        child: Form(
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
                            child: Obx(() => ClipOval(
                                  child: userController.user.imageAvatar == ""
                                      ? Image.asset(
                                          'lib/assets/images/user Icon.png',
                                          fit: BoxFit.cover)
                                      : Obx(() => editProflieController
                                              .selectImagePath.value.isNotEmpty
                                          ? Image.file(
                                              File(editProflieController
                                                  .selectImagePath.value),
                                              fit: BoxFit.cover,
                                              height: 200.r,
                                              width: 200.r,
                                            )
                                          : Image.network(
                                              userController.user.imageAvatar!,
                                              fit: BoxFit.cover,
                                              height: 200.r,
                                              width: 200.r,
                                            )),
                                ))),
                        Padding(
                          padding: EdgeInsets.only(right: 20.w),
                          child: EditButton(onPressed: () {
                            editProflieController.getImage(ImageSource.gallery);
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
                          onPressed: () async {
                            if (editProflieController.formKey.currentState!
                                .validate()) {
                              userController.updateUser(
                                editProflieController.emailController.text,
                                editProflieController.usernameController.text,
                                null,
                                editProflieController.selectImagePath.value,
                              );
                            }
                          }),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
