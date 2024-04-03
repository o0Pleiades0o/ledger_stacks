import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/color.dart';

class ForgetPassPage extends StatelessWidget {
  const ForgetPassPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: kViolet,
        body: SingleChildScrollView(
          child: Column(children: [
            SizedBox(
              height: 190.h,
            )
          ]),
        ));
  }
}
