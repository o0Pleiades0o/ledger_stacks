import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/color.dart';
import '../widgets/button.dart';
import '../widgets/textform.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

String email = "", password = "", username = "";

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();
TextEditingController usernameController = TextEditingController();

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kViolet,
        body: Column(
          children: [
            const Spacer(),
            //Header for Register
            Padding(
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
                padding: EdgeInsets.all(20.h),
                child: Column(
                  children: [
                    TextFieldGeneral(
                      controller: usernameController,
                      labelText: "Username",
                      icon: Icons.person,
                    ),
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
                    Padding(
                      padding: EdgeInsets.only(top: 30.h),
                      child:
                          ButtonRaL(buttonText: "Register", onPressed: () {}),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 15.h),
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Already have an account ? ',
                              style: TextStyle(
                                color: Color(0xFF595959),
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            TextSpan(
                              text: 'Login now',
                              style: TextStyle(
                                color: Color(0xFF595959),
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
