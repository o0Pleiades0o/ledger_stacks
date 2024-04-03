import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ledger_stacks/auth/auth_controller.dart';
import 'package:ledger_stacks/pages/login/login_page.dart';
import 'package:ledger_stacks/pages/register/register_controller.dart';

import '../../constants/color.dart';
import '../../util/util.dart';
import '../../widgets/button.dart';
import '../../widgets/textform.dart';

class RegisterPage extends GetWidget<AuthController> {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final RegisterController registerController = Get.put(RegisterController());
    final AuthController authController = Get.put(AuthController());

    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: kViolet,
        body: SingleChildScrollView(
            child: Form(
          key: registerController.formKey,
          child: Column(
            children: [
              SizedBox(
                height: 190.h,
              ),
              Padding(
                //Header for Register
                padding: EdgeInsets.only(bottom: 25.h),
                child: Column(
                  children: [
                    Text(
                      "Register",
                      style: TextStyle(
                          fontSize: 30.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Text(
                      "Register before login",
                      style: TextStyle(fontSize: 15.sp, color: Colors.white),
                    ),
                  ],
                ),
              ), //Box for Textfield
              Container(
                width: MediaQuery.of(context).size.width,
                height: Get.height * 0.8,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(45.r),
                      topRight: Radius.circular(45.r),
                    ),
                  ),
                ), //inside for Textfield
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 30.h, horizontal: 35.w),
                  child: Column(
                    children: [
                      TextFieldGeneral(
                        validator: validateUsernameField,
                        controller: registerController.usernameController,
                        labelText: "Username",
                        icon: Icons.person,
                      ),
                      TextFieldGeneral(
                        validator: validateEmailField,
                        controller: registerController.emailController,
                        labelText: "Email",
                        icon: Icons.mail,
                      ),
                      TextFieldPassword(
                        validator: validatePasswordField,
                        controller: registerController.passwordController,
                        labelText: "password",
                        icon: Icons.lock,
                      ),
                      TextFieldPassword(
                        validator: (value) => validateConfirmPasswordField(
                            value, registerController.passwordController.text),
                        controller:
                            registerController.confirmPasswordController,
                        labelText: "Confirm password",
                        icon: Icons.lock,
                      ), //end inside for Textfield
                      Padding(
                        padding: EdgeInsets.only(top: 30.h),
                        child: ButtonRaL(
                            buttonText: "Register",
                            onPressed: () {
                              if (registerController.formKey.currentState!
                                  .validate()) {
                                authController.register(
                                    registerController.emailController.text,
                                    registerController.passwordController.text,
                                    registerController.usernameController.text);
                              }
                            }),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 15.h),
                        child: GestureDetector(
                          onTap: () => Get.off(() => const LoginPage()),
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Already have an account ? ',
                                  style: TextStyle(
                                    color: kDarkgray,
                                    fontSize: 12.sp,
                                  ),
                                ),
                                TextSpan(
                                  text: 'Login now',
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
        )));
  }
}
