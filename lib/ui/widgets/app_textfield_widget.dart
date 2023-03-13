import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  const AppTextField(
      {Key? key, required this.hintText, required this.controller, this.obscureText})
      : super(key: key);

  final String hintText;
  final TextEditingController controller;
  final bool? obscureText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText ?? false,
        decoration: InputDecoration(
            hintText: hintText,
            fillColor: Colors.white,
            filled: true,
            border: const OutlineInputBorder(borderSide: BorderSide.none)),
      ),
    );
  }
}
