import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TestTime extends StatelessWidget {
  const TestTime({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now(); // ดึงวันที่และเวลาปัจจุบัน
    DateFormat('yyyy-MM-dd').format(now);

    //print('วันที่ปัจจุบัน: $formattedDate');
    return Container();
  }
}
