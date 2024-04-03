import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ledger_stacks/pages/Forget_password/forget_pass_controller.dart';
import 'package:ledger_stacks/pages/login/login_page.dart';
import 'package:ledger_stacks/pages/register/register_page.dart';
import 'package:ledger_stacks/widgets/textform.dart';

import '../../auth/auth_controller.dart';
import '../../constants/color.dart';
import '../../util/util.dart';
import '../../widgets/button.dart';

class ForgetPassPage extends GetView<AuthController> {
  const ForgetPassPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ForgetPassController forgetPassController =
        Get.put(ForgetPassController());
    final AuthController authController = Get.put(AuthController());

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kViolet,
      appBar: AppBar(
        backgroundColor: kViolet,
        leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Get.off(() => const LoginPage());
            }),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: forgetPassController.formKey,
          child: Column(
            children: [
              SizedBox(
                height: 190.h,
              ),
              //Header for Password
              Padding(
                padding: const EdgeInsets.only(bottom: 25),
                child: Column(
                  children: [
                    Text(
                      "Recovery Password",
                      style: TextStyle(
                          fontSize: 30.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Text(
                      "Enter your email address",
                      style: TextStyle(fontSize: 15.sp, color: Colors.white),
                    ),
                  ],
                ),
              ),
              //Box for Textfield
              Container(
                width: MediaQuery.of(context).size.width,
                height: 400.h,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(45.r),
                      topRight: Radius.circular(45.r),
                    ),
                  ),
                ),
                //inside for Textfield
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 30.h, horizontal: 35.w),
                  child: Column(
                    children: [
                      TextFieldGeneral(
                        validator: validateEmailField,
                        controller: forgetPassController.emailController,
                        labelText: "Email",
                        icon: Icons.mail,
                      ),
                      //Button for Login
                      Padding(
                        padding: EdgeInsets.only(top: 30.h),
                        child: ButtonRaL(
                            buttonText: "Submit",
                            onPressed: () {
                              if (forgetPassController.formKey.currentState!
                                  .validate()) {
                                authController.restPassword(
                                    forgetPassController.emailController.text);
                              }
                            }),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 12.h),
                        child: GestureDetector(
                          onTap: () => Get.off(() => const RegisterPage()),
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Create account? ',
                                  style: TextStyle(
                                    color: kDarkgray,
                                    fontSize: 12.sp,
                                  ),
                                ),
                                TextSpan(
                                  text: 'Register now',
                                  style: TextStyle(
                                    color: kDarkgray,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
