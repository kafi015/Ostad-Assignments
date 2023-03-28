import 'package:flutter/material.dart';
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
        widget: Padding(
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
                  child: Icon(Icons.arrow_circle_right_outlined), onTap: () {}),
              const SizedBox(
                height: 36,
              ),
              Center(
                  child: TextButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: Size.zero
                    ),
                      onPressed: () {},
                      child: const Text(
                        "Forget Password?",
                        style: TextStyle(color: Colors.grey),
                      ))),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Dont't have account? ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextButton(

                    style: TextButton.styleFrom(
                      minimumSize: Size.zero,
                      padding: EdgeInsets.zero,
                    ),

                      onPressed: () {},
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(
                          color: Colors.green,
                        ),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
