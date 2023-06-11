import 'package:flutter/material.dart';
import 'package:task_manager/ui/utils/text_styles.dart';
import 'package:task_manager/ui/widgets/app_textfield_widget.dart';
import 'package:task_manager/ui/widgets/elevated_button.dart';
import 'package:task_manager/ui/widgets/screen_background.dart';
import 'package:task_manager/ui/widgets/user_profile_widget.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({Key? key}) : super(key: key);

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const UserProfileWidget(),
            Expanded(
              child: ScreenBackground(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 35,
                        ),
                        Text(
                          "Update Profile",
                          style: screenTitleTextStyle,
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Row(
                          children: [
                            const Card(
                              color: Colors.black,
                              child: Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Text(
                                  "Photo",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ),
                            Expanded(
                              child: AppTextField(
                                hintText: '',
                                controller: TextEditingController(),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        AppTextField(
                          hintText: 'Email',
                          controller: TextEditingController(),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        AppTextField(
                          hintText: 'First Name',
                          controller: TextEditingController(),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        AppTextField(
                          hintText: 'Last Name',
                          controller: TextEditingController(),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        AppTextField(
                          hintText: 'Mobile',
                          controller: TextEditingController(),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        AppTextField(
                          hintText: 'Password',
                          controller: TextEditingController(),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        AppElevatedButton(
                          child: const Icon(Icons.arrow_circle_right_outlined),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
