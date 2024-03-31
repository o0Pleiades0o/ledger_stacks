import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ledger_stacks/constants/color.dart';
import 'package:ledger_stacks/pages/register_page.dart';
import 'package:ledger_stacks/widgets/button.dart';

import '../widgets/textform.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

String email = "", password = "", username = "";

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();
TextEditingController usernameController = TextEditingController();

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kViolet,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 200.h,
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
                padding: EdgeInsets.symmetric(vertical: 60.h, horizontal: 35.w),
                child: Column(
                  children: [
                    TextFieldGeneral(
                      controller: emailController,
                      labelText: "Email",
                      icon: Icons.mail,
                    ),
                    TextFieldPassword(
                      controller: passwordController,
                      labelText: "password",
                      icon: Icons.lock,
                    ),
                    Row(
                      children: [
                        const Spacer(),
                        GestureDetector(
                            onTap: () {
                              debugPrint("Pressed");
                            },
                            child: Text(
                              "Forgot Password?",
                              style: TextStyle(
                                color: kDarkgray,
                                fontSize: 12.sp,
                              ),
                            ))
                      ],
                    ),
                    //Button for Login
                    Padding(
                      padding: EdgeInsets.only(top: 30.h),
                      child: ButtonRaL(buttonText: "Login", onPressed: () {}),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 12.h),
                      child: GestureDetector(
                        onTap: () => Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const RegisterPage())),
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
    );
  }
}
