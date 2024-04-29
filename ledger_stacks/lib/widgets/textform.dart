import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ledger_stacks/util/util.dart';

class TextFieldGeneral extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final IconData? icon;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;

  const TextFieldGeneral(
      {super.key,
      required this.controller,
      required this.labelText,
      this.icon,
      this.validator,
      this.onSaved,
      this.keyboardType,
      this.textInputAction});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: controller,
          onSaved: onSaved,
          validator: validator,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
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
  final TextInputAction? textInputAction;

  const TextFieldPassword({
    super.key,
    required this.controller,
    required this.labelText,
    required this.icon,
    this.validator,
    this.onSaved,
    this.textInputAction,
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
              textInputAction: textInputAction,
              decoration: InputDecoration(
                labelText: labelText,
                prefixIcon: Icon(icon),
                suffixIcon: GestureDetector(
                  onTap: isObscureController.togglePasswordVisibility,
                  child: Icon(
                    isObscureController.isObscure.value
                        ? Icons.visibility_off
                        : Icons.visibility,
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

class TextFieldAddSQL extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;

  const TextFieldAddSQL(
      {super.key,
      required this.controller,
      required this.hintText,
      this.validator,
      this.onSaved,
      this.keyboardType,
      this.textInputAction});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: controller,
          onSaved: onSaved,
          validator: validator,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.r),
                borderSide: BorderSide.none),
            hintText: hintText,
            hintStyle: const TextStyle(color: Colors.grey),
          ),
        ),
        SizedBox(height: 15.h),
      ],
    );
  }
}
