import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:ledger_stacks/constants/color.dart';
import 'package:ledger_stacks/pages/myledger/ledger_page.dart';
import 'package:ledger_stacks/pages/mylist/mylist_page.dart';

Widget navigationBar() {
  return Container(
      height: 55.h,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withAlpha(20),
                blurRadius: 20,
                spreadRadius: 10)
          ]),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          //Icon go to Ledger
          IconAndText(
            onPressed: () {
              Get.off(() => const MyLedger());
            },
            text: 'My Ledger',
            icon: FontAwesomeIcons.solidAddressBook,
          ),
          Icon(
            FontAwesomeIcons.circle,
            size: 30.sp,
            color: Colors.white,
          ),
          //Icon go to MyList
          IconAndText(
            onPressed: () {
              Get.off(() => const Mylist());
            },
            text: 'My List',
            icon: FontAwesomeIcons.clipboardList,
          ),
        ],
      ));
}

class IconAndText extends StatelessWidget {
  const IconAndText({
    super.key,
    required this.onPressed,
    required this.text,
    required this.icon,
  });
  final VoidCallback onPressed;
  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: onPressed,
          child: Icon(
            icon,
            size: 25.sp,
            color: kViolet,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 2.h),
          child: Text(text,
              style: TextStyle(
                color: kViolet,
                fontSize: 10.sp,
                fontWeight: FontWeight.w700,
              )),
        ),
      ],
    );
  }
}
