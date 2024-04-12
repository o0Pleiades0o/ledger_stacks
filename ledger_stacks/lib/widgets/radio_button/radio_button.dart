import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ledger_stacks/widgets/radio_button/radio_controller.dart';

class RadioButton extends StatelessWidget {
  final RadioButtonController controller = Get.put(RadioButtonController());

  RadioButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: ListTile(
            title: const Text('income'),
            leading: Obx(() => Radio<SingingCharacter>(
                  value: SingingCharacter.income,
                  groupValue: controller.selectedCharacter.value,
                  onChanged: (SingingCharacter? value) {
                    if (value != null) {
                      controller.updateCharacter(value);
                      debugPrint("Selected Character: $value");
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
                  groupValue: controller.selectedCharacter.value,
                  onChanged: (SingingCharacter? value) {
                    if (value != null) {
                      controller.updateCharacter(value);
                      debugPrint("Selected Character: $value");
                    }
                  },
                )),
          ),
        ),
      ],
    );
  }
}
