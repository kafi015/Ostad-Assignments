import 'package:flutter/material.dart';
import 'package:task_manager/Data/auth_utils.dart';
import 'package:task_manager/Data/network_utils.dart';
import 'package:task_manager/ui/screens/main_bottom_navbar.dart';
import 'package:task_manager/ui/screens/sign_up.dart';
import 'package:task_manager/ui/screens/verify_with_email.dart';
import 'package:task_manager/ui/widgets/app_sign_in_out_text.dart';
import 'package:task_manager/ui/widgets/elevated_button.dart';
import 'package:task_manager/ui/widgets/screen_background.dart';

import '../../Data/urls.dart';
import '../utils/snackbar_message.dart';
import '../utils/text_styles.dart';
import '../widgets/app_textfield_widget.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool inProgress = false;

  Future<void> logIn() async {
    inProgress = true;
    setState(() {});
    final response = await NetworkUtils().postMethod(Urls.loginUrl, body: {
      'email': emailController.text.trim(),
      'password': passController.text,
    }, onunauthorized: () {
      showSnackBarMessage(context, 'Email or Password incorrect', true);
    });
    inProgress = false;
    setState(() {});

    if (response != null && response['status'] == 'success') {
      AuthUtils.saveUserData(
          response['data']['firstName'],
          response['data']['lastName'],
          response['token'],
          response['data']['photo'],
          response['data']['mobile'],
          response['data']['email']
      );

      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const MainBottonNavbar()),
          (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ScreenBackground(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 100,
                    ),
                    Text(
                      "Get Started With",
                      style: ScreenTitleTextStyle,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    AppTextField(
                      hintText: 'Email',
                      controller: emailController,
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return "Enter your email";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    AppTextField(
                      hintText: 'Pasword',
                      controller: passController,
                      validator: (value) {
                        if ((value?.isEmpty ?? true) &&
                            ((value?.length ?? 0) < 6)) {
                          return "Enter password more than 6 letter";
                        }
                        return null;
                      },
                      obscureText: true,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    inProgress
                        ? const Center(
                            child: CircularProgressIndicator(
                              color: Colors.green,
                            ),
                          )
                        : AppElevatedButton(
                            child:
                                const Icon(Icons.arrow_circle_right_outlined),
                            onTap: () async {
                              if (_formKey.currentState!.validate()) {
                                logIn();
                              }
                            }),
                    const SizedBox(
                      height: 36,
                    ),
                    Center(
                        child: TextButton(
                            style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                                minimumSize: Size.zero),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const VerifyWithEmail()));
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
          ),
        ),
      ),
    );
  }
}
