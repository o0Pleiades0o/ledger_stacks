import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ledger_stacks/widgets/radio_button/radio_controller.dart';

class RadioButton extends StatelessWidget {
  final RadioButtonController radioButtonController =
      Get.put(RadioButtonController());
  RadioButton({super.key, controller});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: ListTile(
            title: const Text('income'),
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
            title: const Text('expense'),
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
