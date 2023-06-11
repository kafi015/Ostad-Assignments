import 'package:flutter/material.dart';
import 'package:task_manager/Data/auth_utils.dart';
import 'package:task_manager/Data/network_utils.dart';
import 'package:task_manager/Data/urls.dart';
import 'package:task_manager/main.dart';
import 'package:task_manager/ui/utils/snackbar_message.dart';
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
  TextEditingController subjectEtController = TextEditingController();
  TextEditingController descriptionEtController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool inProgress = false;

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
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 35,
                          ),
                          Text(
                            "Add New Task",
                            style: screenTitleTextStyle,
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          AppTextField(
                            hintText: 'Subject',
                            controller: subjectEtController,
                            validator: (value) {
                              if (value?.isEmpty ?? true) {
                                return "Enter the task Subject";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          AppTextField(
                            hintText: 'Description',
                            controller: descriptionEtController,
                            validator: (value) {
                              if (value?.isEmpty ?? true) {
                                return "Enter some description about this task";
                              }
                              return null;
                            },
                            maxLines: 5,
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
                                  child: const Icon(
                                      Icons.arrow_circle_right_outlined),
                                  onTap: () async {
                                    if (_formKey.currentState!.validate()) {
                                      inProgress = true;
                                      setState(() {});
                                      final result = await NetworkUtils()
                                          .postMethod(Urls.createNewTaskUrl,
                                              token: AuthUtils.token,
                                              body: {
                                            'title': subjectEtController.text.trim(),
                                            'description':
                                                descriptionEtController.text.trim(),
                                            'status': 'New'
                                          });
                                      inProgress = false;
                                      setState(() {});
                                      if (result != null && result['status'] == 'success') {
                                        subjectEtController.clear();
                                        descriptionEtController.clear();
                                        Navigator.pop(MyApp.globalKey.currentContext!);
                                        showSnackBarMessage(
                                            MyApp.globalKey.currentContext!,
                                            'New Task Added Successfully',
                                            false);
                                      } else {
                                        showSnackBarMessage(
                                            MyApp.globalKey.currentContext!,
                                            'New Task Add Failed. Try Again!',
                                            true);
                                      }
                                    }
                                  },
                                ),
                        ],
                      ),
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
