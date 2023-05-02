import 'package:flutter/material.dart';
import 'package:task_manager/ui/screens/main_bottom_navbar.dart';
import 'package:task_manager/ui/screens/sign_up.dart';
import 'package:task_manager/ui/screens/verify_with_email.dart';
import 'package:task_manager/ui/widgets/app_sign_in_out_text.dart';
import 'package:task_manager/ui/widgets/elevated_button.dart';
import 'package:task_manager/ui/widgets/screen_background.dart';

import '../utils/text_styles.dart';
import '../widgets/app_textfield_widget.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Get Started With",
                style: ScreenTitleTextStyle,
              ),
              const SizedBox(
                height: 24,
              ),
              AppTextField(
                  hintText: 'Email', controller: TextEditingController()),
              const SizedBox(
                height: 16,
              ),
              AppTextField(
                hintText: 'Pasword',
                controller: TextEditingController(),
                obscureText: true,
              ),
              const SizedBox(
                height: 16,
              ),
              AppElevatedButton(
                  child: const Icon(Icons.arrow_circle_right_outlined),
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MainBottonNavbar()),
                        (route) => false);
                  }),
              const SizedBox(
                height: 36,
              ),
              Center(
                  child: TextButton(
                      style: TextButton.styleFrom(
                          padding: EdgeInsets.zero, minimumSize: Size.zero),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const VerifyWithEmail()));
                      },
                      child: const Text(
                        "Forget Password?",
                        style: TextStyle(color: Colors.grey),
                      ))),
              const SizedBox(
                height: 5,
              ),
              SignInUp(
                questionString: "Dont't have account? ",
                signInOut: "Sign Up",
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignUpScreen()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
