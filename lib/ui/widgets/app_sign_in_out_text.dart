import 'package:flutter/material.dart';

class SignInUp extends StatelessWidget {
  const SignInUp({
    Key? key, required this.questionString, required this.signInOut, required this.onTap,
  }) : super(key: key);
  final String? questionString;
  final String signInOut;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          questionString!,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        TextButton(

            style: TextButton.styleFrom(
              minimumSize: Size.zero,
              padding: EdgeInsets.zero,
            ),

            onPressed: onTap,
            child: Text(
              signInOut,
              style: const TextStyle(
                color: Colors.green,
              ),
            ))
      ],
    );
  }
}