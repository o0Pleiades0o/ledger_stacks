import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ledger_stacks/util/util.dart';

class TextFieldGeneral extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final IconData icon;

  const TextFieldGeneral({
    super.key,
    required this.controller,
    required this.labelText,
    required this.icon,
    this.validator,
    this.onSaved,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: controller,
          onSaved: onSaved,
          validator: validator,
          decoration: InputDecoration(
            labelText: labelText,
            prefixIcon: Icon(icon),
          ),
        ),
        SizedBox(height: 15.h),
      ],
    );
  }
}

class TextFieldPassword extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final IconData icon;

  const TextFieldPassword({
    super.key,
    required this.controller,
    required this.labelText,
    required this.icon,
    this.validator,
    this.onSaved,
  });

  @override
  Widget build(BuildContext context) {
    final IsObscureController passwordController =
        Get.put(IsObscureController());

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GetX<IsObscureController>(
          init: passwordController,
          builder: (isObscureController) {
            return TextFormField(
              controller: controller,
              onSaved: onSaved,
              validator: validator,
              decoration: InputDecoration(
                labelText: labelText,
                prefixIcon: Icon(icon),
                suffixIcon: GestureDetector(
                  onTap: isObscureController.togglePasswordVisibility,
                  child: Icon(
                    isObscureController.isObscure.value
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                ),
              ),
              obscureText: isObscureController.isObscure.value,
            );
          },
        ),
        SizedBox(height: 15.h),
      ],
    );
  }
}
