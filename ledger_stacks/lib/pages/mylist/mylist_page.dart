import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ledger_stacks/constants/color.dart';

import '../../widgets/button.dart';
import '../../widgets/floating_action_button.dart';
import '../home/home_page.dart';

class Mylist extends StatefulWidget {
  const Mylist({super.key});

  @override
  State<Mylist> createState() => _MylistPage();
}

class _MylistPage extends State<Mylist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //เนื้อหาต้องอยู่ในนี้
      backgroundColor: kGray,
      appBar: AppBar(
          toolbarHeight: 75.h,
          centerTitle: true,
          backgroundColor: Colors.white,
          leading: KBackButton(
            onPressed: () {
              Get.off(() => const HomePage());
            },
          ),
          title: Text(
            "My List",
            style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.bold),
          )),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 25.h, horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Daily List",
                style: TextStyle(
                    fontSize: 18.sp,
                    color: kDarkgray,
                    fontWeight: FontWeight.bold)),
            Text("Temporary List",
                style: TextStyle(
                    fontSize: 18.sp,
                    color: kDarkgray,
                    fontWeight: FontWeight.bold)),
            Text("Auto List",
                style: TextStyle(
                    fontSize: 18.sp,
                    color: kDarkgray,
                    fontWeight: FontWeight.bold))
          ],
        ),
      ), //cost เป็นสำหรับค่าคงที่ ที่ไม่มีการเปลี่ยนแปลง
      floatingActionButton: const CreateFAB(),
    ); //ทำให้หน้่าแอปเป็นสีขาว
  }
}
