import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  const AppTextField(
      {Key? key,
      required this.hintText,
      required this.controller,
      this.obscureText,
      this.maxLines,
      this.validator, this.readOnly})
      : super(key: key);

  final String hintText;
  final TextEditingController controller;
  final bool? obscureText;
  final int? maxLines;
  final Function(String?)? validator;
  final bool? readOnly;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: readOnly ?? false,
      maxLines: maxLines ?? 1,
      controller: controller,
      obscureText: obscureText ?? false,
      obscuringCharacter: '*',
      validator: (value) {
        if (validator != null) {
          return validator!(value);
        }
        return null;
      },
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.grey),
          fillColor: Colors.white,
          filled: true,
          border: const OutlineInputBorder(borderSide: BorderSide.none)),
    );
  }
}
