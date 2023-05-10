import 'package:flutter/material.dart';
import 'package:task_manager/Data/network_utils.dart';
import 'package:task_manager/ui/utils/snackbar_message.dart';
import 'package:task_manager/ui/utils/text_styles.dart';
import 'package:task_manager/ui/widgets/app_sign_in_out_text.dart';
import 'package:task_manager/ui/widgets/app_textfield_widget.dart';
import 'package:task_manager/ui/widgets/elevated_button.dart';
import 'package:task_manager/ui/widgets/screen_background.dart';

import '../../Data/urls.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController emailETcontroller = TextEditingController();
  final TextEditingController firstNameETcontroller = TextEditingController();
  final TextEditingController lastNameETcontroller = TextEditingController();
  final TextEditingController mobileETcontroller = TextEditingController();
  final TextEditingController passETcontroller = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
        child: SafeArea(
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
                      hintText: "Email",
                      controller: emailETcontroller,
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
                      hintText: "First Name",
                      controller: firstNameETcontroller,
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return "Enter your first name";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    AppTextField(
                      hintText: "Last Name",
                      controller: lastNameETcontroller,
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return "Enter your last name";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    AppTextField(
                      hintText: "Mobile",
                      controller: mobileETcontroller,
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return "Enter your mobile number";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    AppTextField(
                      hintText: "Password",
                      controller: passETcontroller,
                      validator: (value) {
                        if ((value?.isEmpty ?? true) &&
                            ((value?.length ?? 0) < 6)) {
                          return "Enter password more then 6 letter";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    AppElevatedButton(
                        child: const Icon(Icons.arrow_circle_right_outlined),
                        onTap: () async {
                          if (_formKey.currentState!.validate()) {
                            final result = await NetworkUtils().postMethod(
                                Urls.registrationUrl,
                                body: {
                                  'email': emailETcontroller.text.trim(),
                                  'mobile': mobileETcontroller.text.trim(),
                                  'password': passETcontroller.text,
                                  'firstName':
                                      firstNameETcontroller.text.trim(),
                                  'lastName': lastNameETcontroller.text.trim(),
                                });
                            if (result != null &&
                                result['status'] == 'success') {
                              emailETcontroller.clear();
                              firstNameETcontroller.clear();
                              lastNameETcontroller.clear();
                              mobileETcontroller.clear();
                              passETcontroller.clear();
                              showSnackBarMessage(context, "Registration successful!");
                            } else {
                              showSnackBarMessage(context, "Registration failed! Try again.",true);
                            }
                          }
                        }),
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
      ),
    );
  }
}
