import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    required this.controller,
    this.isObscureText = false,
    this.keyboardType = TextInputType.text,
  });

  final TextEditingController controller;
  final bool isObscureText;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: isObscureText,
      controller: controller,
      cursorColor: Colors.white,
      keyboardType: keyboardType,
      style: const TextStyle(color: Colors.white, fontSize: 22),
    );
  }
}
