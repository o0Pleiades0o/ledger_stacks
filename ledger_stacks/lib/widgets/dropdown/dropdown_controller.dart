import 'package:get/get.dart';

//DropDownTypeController
class DropDownTypeController extends GetxController {
  final List<String> items = ['Daily', 'Auto'];
  late final Rx<String> selectedValue;

  DropDownTypeController() {
    selectedValue = Rx<String>(items.first);
  }

  void updateSelectedValue(String value) {
    selectedValue.value = value;
  }

  String get currentSelectedValue => selectedValue.value;
}

class DropDownFrequencyController extends GetxController {
  final List<String> items = ['Mon - Fri', 'Sat - Sun', '1st day', '15th'];
  late final Rx<String?> selectedValue;

  DropDownFrequencyController() {
    selectedValue = Rx<String?>(null);
  }

  void updateSelectedValue(String value) {
    selectedValue.value = value;
  }

  String? get currentSelectedValue => selectedValue.value;
}
