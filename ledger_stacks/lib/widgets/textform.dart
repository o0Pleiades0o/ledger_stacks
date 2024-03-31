import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFieldGeneral extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final IconData icon;

  const TextFieldGeneral({
    super.key,
    required this.controller,
    required this.labelText,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: controller,
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

class TextFieldPassword extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final IconData icon;

  const TextFieldPassword({
    super.key,
    required this.controller,
    required this.labelText,
    required this.icon,
  });

  @override
  State<TextFieldPassword> createState() => _TextFieldPasswordState();
}

class _TextFieldPasswordState extends State<TextFieldPassword> {
  bool isObscure = true;

  void togglePasswordVisibility() {
    setState(() {
      isObscure = !isObscure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: widget.controller,
          decoration: InputDecoration(
            labelText: widget.labelText,
            prefixIcon: Icon(widget.icon),
            suffixIcon: GestureDetector(
              onTap: togglePasswordVisibility,
              child: Icon(isObscure ? Icons.visibility : Icons.visibility_off),
            ),
          ),
          obscureText: isObscure,
        ),
        SizedBox(height: 15.h),
      ],
    );
  }
}
