import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ledger_stacks/widgets/radio_button/radio_controller.dart';

class RadioButton extends StatelessWidget {
  final RadioButtonController radioButtonController = Get.put(RadioButtonController());
  RadioButton({super.key, controller});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: ListTile(
            title: Text(
              'income',
              style: TextStyle(fontSize: 14.sp),
            ),
            leading: Obx(() => Radio<SingingCharacter>(
                  value: SingingCharacter.income,
                  groupValue: radioButtonController.selectedCharacter.value,
                  onChanged: (SingingCharacter? value) {
                    if (value != null) {
                      radioButtonController.updateCharacter(value);
                    }
                  },
                )),
          ),
        ),
        Expanded(
          child: ListTile(
            title: Text(
              'expense',
              style: TextStyle(fontSize: 14.sp),
            ),
            leading: Obx(() => Radio<SingingCharacter>(
                  value: SingingCharacter.expense,
                  groupValue: radioButtonController.selectedCharacter.value,
                  onChanged: (SingingCharacter? value) {
                    if (value != null) {
                      radioButtonController.updateCharacter(value);
                    }
                  },
                )),
          ),
        ),
      ],
    );
  }
}
