import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ledger_stacks/widgets/dropdown/dropdown_controller.dart';

//DropDownType
class DropDownType extends StatelessWidget {
  final DropDownTypeController dropDownTypeController = Get.put(DropDownTypeController());

  DropDownType({super.key});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: Obx(() => DropdownButton2<String>(
            isExpanded: true,
            value: dropDownTypeController.selectedValue.value,
            items: dropDownTypeController.items
                .map((String item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ))
                .toList(),
            onChanged: (String? value) {
              if (value != null) {
                dropDownTypeController.updateSelectedValue(value);
              }
            },
            buttonStyleData: ButtonStyleData(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              height: 50.h,
              width: Get.width,
            ),
            dropdownStyleData: DropdownStyleData(
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15), boxShadow: [
              BoxShadow(
                color: const Color(0xFF4b4b4b).withOpacity(0.08),
                offset: const Offset(0, 8),
                blurRadius: 10,
                spreadRadius: 6,
              )
            ])),
            menuItemStyleData: const MenuItemStyleData(
              height: 40,
            ),
          )),
    );
  }
}

//DropDownFrequency
class DropDownFrequency extends StatelessWidget {
  DropDownFrequency({super.key});

  final DropDownFrequencyController dropDownFrequencyController = Get.put(DropDownFrequencyController());
  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: Obx(
        () => DropdownButton2<String>(
          isExpanded: true,
          hint: Text(
            'Select Frequency',
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.grey,
            ),
          ),
          value: dropDownFrequencyController.selectedValue.value,
          items: [
            for (String item in dropDownFrequencyController.items)
              DropdownMenuItem<String>(
                value: item,
                child: Text(
                  item,
                  style: TextStyle(
                    fontSize: 14.sp,
                  ),
                ),
              ),
          ],
          onChanged: (String? value) {
            if (value != null) {
              dropDownFrequencyController.updateSelectedValue(value);
            }
          },
          buttonStyleData: ButtonStyleData(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            height: 50.h,
            width: Get.width,
          ),
          dropdownStyleData: DropdownStyleData(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF4b4b4b).withOpacity(0.08),
                  offset: const Offset(0, 8),
                  blurRadius: 10,
                  spreadRadius: 6,
                ),
              ],
            ),
          ),
          menuItemStyleData: const MenuItemStyleData(
            height: 40,
          ),
        ),
      ),
    );
  }
}
