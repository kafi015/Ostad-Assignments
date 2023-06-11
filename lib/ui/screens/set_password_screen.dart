import 'package:flutter/material.dart';
import 'package:task_manager/ui/screens/log_in_screen.dart';
import 'package:task_manager/ui/utils/text_styles.dart';
import 'package:task_manager/ui/widgets/app_sign_in_out_text.dart';
import 'package:task_manager/ui/widgets/app_textfield_widget.dart';
import 'package:task_manager/ui/widgets/elevated_button.dart';

import '../widgets/screen_background.dart';

class SetPasswordScreen extends StatefulWidget {
  const SetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<SetPasswordScreen> createState() => _SetPasswordScreenState();
}

class _SetPasswordScreenState extends State<SetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Set Password",
                style: screenTitleTextStyle,
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                "Minimum length password 8 character with\nLetter and number combination",
                style: screenSubtileTextStyle,
              ),
              const SizedBox(
                height: 24,
              ),
              AppTextField(
                hintText: "Password",
                controller: TextEditingController(),
              ),
              const SizedBox(
                height: 24,
              ),
              AppTextField(
                hintText: "Confirm Password",
                controller: TextEditingController(),
              ),
              const SizedBox(
                height: 24,
              ),
              AppElevatedButton(
                  child: const Text("Confirm"),
                  onTap: () {
                    //   Navigator.push(context, MaterialPageRoute(builder: (context)=> const OTPVarificationScreen()));
                  }),
              const SizedBox(
                height: 24,
              ),
              SignInUp(
                questionString: "Have account? ",
                signInOut: "Sign In",
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LogInScreen()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
