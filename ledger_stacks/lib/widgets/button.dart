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
    return Padding(
      padding: EdgeInsets.only(top: 20.h, bottom: 20, left: 10),
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          decoration: BoxDecoration(
              color: kViolet, borderRadius: BorderRadius.circular(10.r)),
          child: const Icon(
            FontAwesomeIcons.angleLeft,
            color: Colors.white,
          ),
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

class EditButton extends StatelessWidget {
  final VoidCallback onPressed;
  const EditButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      width: 45,
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          decoration: BoxDecoration(color: kYellow, shape: BoxShape.circle),
          child: Icon(
            Icons.edit,
            color: Colors.white,
            size: 18.sp,
          ),
        ),
      ),
    );
  }
}

class CusNavigationBotton extends StatelessWidget {
  const CusNavigationBotton({
    super.key,
    required this.onPressed,
    required this.iconSuffix,
    required this.text,
    this.iconTrailing,
  });
  final VoidCallback onPressed;
  final String text;
  final IconData iconSuffix;
  final IconData? iconTrailing;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20.h),
      child: SizedBox(
        height: 45.h,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: kViolet,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.r),
                )),
            onPressed: onPressed,
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 20.w),
                  child: Icon(
                    iconSuffix,
                    color: Colors.white,
                  ),
                ),
                Text(
                  text,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const Spacer(),
                Icon(
                  iconTrailing,
                  color: Colors.white,
                ),
              ],
            )),
      ),
    );
  }
}
