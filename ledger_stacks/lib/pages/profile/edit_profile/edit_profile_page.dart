import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ledger_stacks/widgets/button.dart';

import '../../../constants/color.dart';

class EditProflie extends StatelessWidget {
  const EditProflie({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: kDarkgray), onPressed: () {}),
      ),
      body: Column(
        children: [
          Center(
            child: Padding(
                padding: EdgeInsets.only(top: 50.h, bottom: 20.h),
                child: Stack(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 100.r,
                    ),
                    EditButton(onPressed: () {}),
                  ],
                )),
          )
        ],
      ),
    );
  }
}
