import 'package:flutter/material.dart';

class TextFieldGeneral extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;

  const TextFieldGeneral({
    super.key,
    required this.controller,
    required this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: controller,
          decoration: InputDecoration(labelText: labelText),
        ),
        SizedBox(height: 12.0),
      ],
    );
  }
}

class TextFieldPassword extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final bool obscureText;

  const TextFieldPassword({
    super.key,
    required this.controller,
    required this.labelText,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: controller,
          decoration: InputDecoration(labelText: labelText),
          obscureText: true,
        ),
        SizedBox(height: 12.0),
      ],
    );
  }
}
