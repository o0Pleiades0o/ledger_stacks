import 'package:get/get.dart';

//DropDownTypeController
class DropDownTypeController extends GetxController {
  final List<String> items = ['Daily List', 'Temporary', 'Auto'];
  late final Rx<String> selectedValue;

  DropDownTypeController() {
    selectedValue = Rx<String>(items.first);
  }

  void updateSelectedValue(String value) {
    selectedValue.value = value;
  }
}

//DropDownFrequencyController
class DropDownFrequencyController extends GetxController {
  final List<String> items = ['Daily', 'Weekly', 'Monthly'];
  late final Rx<String> selectedValue;

  DropDownFrequencyController() {
    selectedValue = Rx<String>(items.first);
  }

  void updateSelectedValue(String value) {
    selectedValue.value = value;
  }
}
