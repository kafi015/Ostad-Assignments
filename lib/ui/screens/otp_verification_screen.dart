import 'package:flutter/material.dart';
import 'package:task_manager/ui/screens/log_in_screen.dart';
import 'package:task_manager/ui/utils/text_styles.dart';
import 'package:task_manager/ui/widgets/app_sign_in_out_text.dart';
import 'package:task_manager/ui/widgets/elevated_button.dart';
import 'package:task_manager/ui/widgets/screen_background.dart';

class OTPVarificationScreen extends StatefulWidget {
  const OTPVarificationScreen({Key? key}) : super(key: key);

  @override
  State<OTPVarificationScreen> createState() => _OTPVarificationScreenState();
}

class _OTPVarificationScreenState extends State<OTPVarificationScreen> {
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
                "PIN Verification",
                style: ScreenTitleTextStyle,
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                "A 6 digit varification pin will send to your\nemail address",
                style: ScreenSubtileTextStyle,
              ),
              const SizedBox(
                height: 24,
              ),
              // AppTextField(
              //   hintText: "Email",
              //   controller: TextEditingController(),
              // ),
              const SizedBox(
                height: 24,
              ),
              AppElevatedButton(
                  child: const Text("Verify"),
                  onTap: () {
                   // Navigator.push(context, MaterialPageRoute(builder: (context)=> OTPVarificationScreen()));
                  }),
              const SizedBox(
                height: 24,
              ),
              SignInUp(
                questionString: "Have account? ",
                signInOut: "Sign In",
                onTap: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const LogInScreen()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
