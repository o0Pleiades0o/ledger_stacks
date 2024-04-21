import 'package:get/get.dart';

enum SingingCharacter { income, expense }

class RadioButtonController extends GetxController {
  var selectedCharacter = SingingCharacter.income.obs;

  void updateCharacter(SingingCharacter character) {
    selectedCharacter.value = character;
  }
}

class EditRadioButtonController extends GetxController {
  var selectedCharacter = SingingCharacter.income.obs;
}
