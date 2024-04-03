import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ledger_stacks/pages/Forget_password/forget_pass_page.dart';
import 'package:ledger_stacks/pages/login/login_controller.dart';
import 'package:ledger_stacks/pages/register/register_page.dart';

import '../../auth/auth_controller.dart';
import '../../constants/color.dart';
import '../../util/util.dart';
import '../../widgets/button.dart';
import '../../widgets/textform.dart';

class LoginPage extends GetWidget<AuthController> {
  const LoginPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final LoginController loginController = Get.put(LoginController());
    final AuthController authController = Get.put(AuthController());

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kViolet,
      body: SingleChildScrollView(
        child: Form(
          key: loginController.formKey,
          child: Column(
            children: [
              SizedBox(
                height: 190.h,
              ),
              //Header for Login
              Padding(
                padding: const EdgeInsets.only(bottom: 25),
                child: Column(
                  children: [
                    Text(
                      "Login",
                      style: TextStyle(
                          fontSize: 30.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Text(
                      "Welcome to Ledger Stacks",
                      style: TextStyle(fontSize: 15.sp, color: Colors.white),
                    ),
                  ],
                ),
              ),
              //Box for Textfield
              Container(
                width: MediaQuery.of(context).size.width,
                height: 450.h,
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
                        controller: loginController.emailController,
                        labelText: "Email",
                        icon: Icons.mail,
                      ),
                      TextFieldPassword(
                        validator: validatePasswordField,
                        controller: loginController.passwordController,
                        labelText: "password",
                        icon: Icons.lock,
                      ),
                      Row(
                        children: [
                          const Spacer(),
                          GestureDetector(
                              onTap: () {
                                Get.off(() => const ForgetPassPage());
                              },
                              child: Text(
                                "Forgot Password?",
                                style: TextStyle(
                                  color: Colors.blueAccent,
                                  fontSize: 12.sp,
                                ),
                              ))
                        ],
                      ),
                      //Button for Login
                      Padding(
                        padding: EdgeInsets.only(top: 30.h),
                        child: ButtonRaL(
                            buttonText: "Login",
                            onPressed: () {
                              if (loginController.formKey.currentState!
                                  .validate()) {
                                authController.login(
                                  loginController.emailController.text,
                                  loginController.passwordController.text,
                                );
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
