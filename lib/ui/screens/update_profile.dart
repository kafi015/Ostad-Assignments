import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
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

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({Key? key}) : super(key: key);

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  final TextEditingController emailETcontroller = TextEditingController();
  final TextEditingController firstNameETcontroller = TextEditingController();
  final TextEditingController lastNameETcontroller = TextEditingController();
  final TextEditingController mobileETcontroller = TextEditingController();
  final TextEditingController passETcontroller = TextEditingController();

  XFile? pickedImage;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailETcontroller.text = AuthUtils.email ?? 'Unknown';
    firstNameETcontroller.text = AuthUtils.firstName ?? 'Unknown';
    lastNameETcontroller.text = AuthUtils.lastName ?? 'Unknown';
    mobileETcontroller.text = AuthUtils.mobile ?? 'Unknown';
  }

  bool inProgress = false;
  String? base64Image;

  void updateProfile() async {
    inProgress = true;
    setState(() {});

    if(pickedImage != null)
      {
        List<int> imageByte = await pickedImage!.readAsBytes();
        base64Image = base64Encode(imageByte);
      }

    Map<String, String> body = {
      'firstName': firstNameETcontroller.text.trim(),
      'lastName': lastNameETcontroller.text.trim(),
      'mobile': mobileETcontroller.text.trim(),
    };
    if (passETcontroller.text.isNotEmpty) {
      body['password'] = passETcontroller.text;
    }

    final response = await NetworkUtils()
        .postMethod(Urls.profileUpdateUrl, token: AuthUtils.token, body: body);
    inProgress = false;
    setState(() {});
    //print(response);
    if (response != null && response['status'] == 'success') {
      AuthUtils.saveUserData(
          firstNameETcontroller.text.trim(),
          lastNameETcontroller.text.trim(),
          AuthUtils.token ?? '',
          '',
          mobileETcontroller.text.trim(),
          emailETcontroller.text,
          );

      showSnackBarMessage(MyApp.globalKey.currentContext!, 'Profile Update Successfully');
    } else {
      showSnackBarMessage(MyApp.globalKey.currentContext!, 'Profile Update Failed', true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
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
                          InkWell(
                            onTap: () async {
                              pickImage();
                            },
                            child: Row(
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
                                  child: Container(
                                    padding: const EdgeInsets.all(20.0),
                                    decoration: const BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(8.0),
                                            bottomRight: Radius.circular(8.0))),
                                    child: Text(
                                      pickedImage?.name ?? '',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          AppTextField(
                            readOnly: true,
                            hintText: 'Email',
                            controller: emailETcontroller,
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          AppTextField(
                            hintText: 'First Name',
                            controller: firstNameETcontroller,
                            validator: (value) {
                              if (value?.isEmpty ?? true) {
                                return "Enter your first name";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          AppTextField(
                            hintText: 'Last Name',
                            controller: lastNameETcontroller,
                            validator: (value) {
                              if (value?.isEmpty ?? true) {
                                return "Enter your last name";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          AppTextField(
                            hintText: 'Mobile',
                            controller: mobileETcontroller,
                            validator: (value) {
                              if (value?.isEmpty ?? true) {
                                return "Enter your mobile number";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          AppTextField(
                            hintText: 'Password',
                            controller: passETcontroller,
                            // validator: (value) {
                            //   if ((value?.isEmpty ?? true) &&
                            //       ((value?.length ?? 0) < 6)) {
                            //     return "Enter password more then 6 letter";
                            //   }
                            //   return null;
                            // },
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
                                  onTap: () {
                                    if (_formKey.currentState!.validate()) {
                                      updateProfile();
                                    }
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
      ),
    );
  }

  void pickImage() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    onTap: () async {
                      pickedImage = await ImagePicker()
                          .pickImage(source: ImageSource.camera);

                      if (pickedImage != null) {
                        setState(() {});
                      }
                      Navigator.pop(MyApp.globalKey.currentContext!);
                    },
                    leading: const Icon(Icons.camera),
                    title: const Text('Camera'),
                  ),
                  ListTile(
                    onTap: () async {
                      pickedImage = await ImagePicker()
                          .pickImage(source: ImageSource.gallery);

                      if (pickedImage != null) {
                        setState(() {});
                      }
                      Navigator.pop(MyApp.globalKey.currentContext!);
                    },
                    leading: const Icon(Icons.image),
                    title: const Text('Gallery'),
                  ),
                ],
              ),
            ));
  }
}
