import 'package:flutter/material.dart';
import 'package:task_manager/ui/utils/text_styles.dart';
import 'package:task_manager/ui/widgets/app_textfield_widget.dart';
import 'package:task_manager/ui/widgets/elevated_button.dart';
import 'package:task_manager/ui/widgets/screen_background.dart';
import 'package:task_manager/ui/widgets/user_profile_widget.dart';

class AddNewTask extends StatefulWidget {
  const AddNewTask({Key? key}) : super(key: key);

  @override
  State<AddNewTask> createState() => _AddNewTaskState();
}

class _AddNewTaskState extends State<AddNewTask> {
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
                        Text("Add New Task",style: ScreenTitleTextStyle,),
                        const SizedBox(
                          height: 25,
                        ),
                        AppTextField(
                          hintText: 'Subject',
                          controller: TextEditingController(),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        AppTextField(
                          hintText: 'Description',
                          controller: TextEditingController(),
                          maxLines: 5,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        AppElevatedButton(
                          child: const Icon(Icons.arrow_circle_right_outlined),
                          onTap: (){
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
