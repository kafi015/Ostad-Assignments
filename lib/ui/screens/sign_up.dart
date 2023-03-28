import 'package:flutter/material.dart';
import 'package:task_manager/ui/utils/text_styles.dart';
import 'package:task_manager/ui/widgets/app_sign_in_out_text.dart';
import 'package:task_manager/ui/widgets/app_textfield_widget.dart';
import 'package:task_manager/ui/widgets/elevated_button.dart';
import 'package:task_manager/ui/widgets/screen_background.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 44,
                  ),
                  Text(
                    "Join With Us",
                    style: ScreenTitleTextStyle,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  AppTextField(
                      hintText: "Email", controller: TextEditingController()),
                  const SizedBox(
                    height: 16,
                  ),
                  AppTextField(
                      hintText: "First Name",
                      controller: TextEditingController()),
                  const SizedBox(
                    height: 16,
                  ),
                  AppTextField(
                      hintText: "Last Name",
                      controller: TextEditingController()),
                  const SizedBox(
                    height: 16,
                  ),
                  AppTextField(
                      hintText: "Mobile", controller: TextEditingController()),
                  const SizedBox(
                    height: 16,
                  ),
                  AppTextField(
                    hintText: "Password",
                    controller: TextEditingController(),
                    obscureText: true,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  AppElevatedButton(
                      child: const Icon(Icons.arrow_circle_right_outlined),
                      onTap: () {}),
                  const SizedBox(
                    height: 24,
                  ),
                  SignInUp(
                    questionString: "Have account? ",
                    onTap: () {
                      Navigator.pop(context);
                    },
                    signInOut: "Sign In",
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
