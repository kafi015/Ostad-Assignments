import 'package:flutter/material.dart';

import '../../Data/auth_utils.dart';
import '../../Data/network_utils.dart';
import '../../Data/urls.dart';
import '../../main.dart';
import '../utils/snackbar_message.dart';
import 'elevated_button.dart';

showChangeTaskStatus(
    String currentStatus, String taskId, VoidCallback onTaskCompleted) {
  String groupTask = currentStatus;
  showModalBottomSheet(
      context: MyApp.globalKey.currentContext!,
      builder: (context) => StatefulBuilder(
          builder: (context, changeState) => Column(
                children: [
                  RadioListTile(
                      activeColor: Colors.green,
                      value: 'New',
                      title: const Text("New"),
                      groupValue: groupTask,
                      onChanged: (state) {
                        groupTask = state!;
                        changeState(() {});
                      }),
                  RadioListTile(
                      value: 'Completed',
                      activeColor: Colors.green,
                      title: const Text("Completed"),
                      groupValue: groupTask,
                      onChanged: (state) {
                        groupTask = state!;
                        changeState(() {});
                      }),
                  RadioListTile(
                      value: 'Canceled',
                      activeColor: Colors.green,
                      title: const Text("Canceled"),
                      groupValue: groupTask,
                      onChanged: (state) {
                        groupTask = state!;
                        changeState(() {});
                      }),
                  RadioListTile(
                      value: 'InProgress',
                      activeColor: Colors.green,
                      title: const Text("InProgress"),
                      groupValue: groupTask,
                      onChanged: (state) {
                        groupTask = state!;
                        changeState(() {});
                      }),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: AppElevatedButton(
                        child: const Text('Change Status'),
                        onTap: () async {
                          final resposne = await NetworkUtils().getMethod(
                              Urls.changeTaskStatus(taskId, groupTask),
                              token: AuthUtils.token);

                          if (resposne != null) {
                            onTaskCompleted();
                            Navigator.pop(MyApp.globalKey.currentContext!);
                          } else {
                            showSnackBarMessage(MyApp.globalKey.currentContext!,
                                'Status change failed! Try again', true);
                          }
                        }),
                  )
                ],
              )));
}
