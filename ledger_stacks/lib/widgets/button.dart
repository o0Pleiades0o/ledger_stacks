import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants/color.dart';

//button for Register and Login
class ButtonRaL extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;

  const ButtonRaL({
    required this.buttonText,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300.w,
      height: 40.h,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: kYellow,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.r),
          ),
        ),
        child: Text(
          buttonText,
          style: TextStyle(
            color: Colors.white,
            fontSize: 15.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}

//button for back
class KBackButton extends StatelessWidget {
  final VoidCallback onPressed;

  const KBackButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: kYellow,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: const Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
      ),
    );
  }
}

//button SignInWithGoogle
class SignInWithGoogleBT extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;

  const SignInWithGoogleBT({
    super.key,
    required this.onPressed,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300.w,
      height: 40.h,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.r),
            ),
            shadowColor: Colors.black12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Icon(
              FontAwesomeIcons.google,
            ),
            Text(
              buttonText,
              style: TextStyle(
                color: kViolet,
                fontSize: 15.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
