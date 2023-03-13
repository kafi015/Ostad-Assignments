import 'package:flutter/material.dart';
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
        widget: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                "Get Started With",
                style: ScreenTitleTextStyle,
              ),
            ),
            SizedBox(
              height: 24,
            ),
            AppTextField(
                hintText: 'Email', controller: TextEditingController()),
            SizedBox(
              height: 16,
            ),
            AppTextField(
                hintText: 'Pasword', controller: TextEditingController(),obscureText: true,),
          ],
        ),
      ),
    );
  }
}
