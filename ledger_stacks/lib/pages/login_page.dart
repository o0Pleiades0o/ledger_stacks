import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ledger_stacks/constants/color.dart';
import 'package:ledger_stacks/widgets/Textfield.dart';
import 'package:ledger_stacks/widgets/button.dart';

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
      body: Column(
          children: [
            const Spacer(),
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
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    TextFieldGeneral(
                        controller: emailController, labelText: "Email"),
                    TextFieldPassword(
                        controller: passwordController,
                        labelText: "Password",
                        obscureText: false),
                    Padding(
                      padding: EdgeInsets.only(top: 30.h),
                      child:
                          ButtonRaL(buttonText: "Login", onPressed: () {}),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 15.h),
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Create account? ',
                              style: TextStyle(
                                color: Color(0xFF595959),
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            TextSpan(
                              text: 'Register now',
                              style: TextStyle(
                                color: Color(0xFF595959),
                                fontSize: 10.sp,
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
        ),
    );
  }
}