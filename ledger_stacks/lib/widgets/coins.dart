import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Coins extends StatelessWidget {
  const Coins({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 2.w,
        ),
        Image.asset(
          'lib/assets/images/Coin.png',
          //fit: BoxFit.cover,
          height: 20,
          width: 20,
        ),
      ],
    );
  }
}
