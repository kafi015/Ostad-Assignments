import 'package:flutter/material.dart';
import 'package:task_manager/Data/Models/task_model.dart';
import 'package:task_manager/Data/auth_utils.dart';
import 'package:task_manager/Data/network_utils.dart';
import 'package:task_manager/main.dart';
import 'package:task_manager/ui/utils/snackbar_message.dart';
import 'package:task_manager/ui/widgets/dashboard_item.dart';
import 'package:task_manager/ui/widgets/screen_background.dart';
import 'package:task_manager/ui/widgets/task_single_item.dart';

import '../../Data/urls.dart';
import '../widgets/status_change_bottom_sheet.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({Key? key}) : super(key: key);

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  TaskModel newTaskModel = TaskModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllNewTask();
  }

  bool inProgress = false;

  Future<void> getAllNewTask() async {
    inProgress = true;
    setState(() {});
    final response = await NetworkUtils()
        .getMethod(Urls.getNewTaskUrl, token: AuthUtils.token);

    if (response != null) {
      newTaskModel = TaskModel.fromJson(response);
    } else {
      showSnackBarMessage(MyApp.globalKey.currentContext!,
          'Unable to fetch new task! Try again!');
    }

    inProgress = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ScreenBackground(
      child: RefreshIndicator(
        color: Colors.green,
        onRefresh: () async {
          await getAllNewTask();
        },
        child: Column(
          children: [
            const Row(
              children: [
                Expanded(
                    child: DashBoardItem(
                  numberofTask: 10,
                  typeofTask: "New",
                )),
                Expanded(
                    child: DashBoardItem(
                  numberofTask: 11,
                  typeofTask: "Completed",
                )),
                Expanded(
                    child: DashBoardItem(
                  numberofTask: 12,
                  typeofTask: "Cancel",
                )),
                Expanded(
                    child: DashBoardItem(
                  numberofTask: 13,
                  typeofTask: "In Progress",
                )),
              ],
            ),
            Expanded(
                child: inProgress
                    ? const Center(
                        child: CircularProgressIndicator(
                          color: Colors.green,
                        ),
                      )
                    : ListView.builder(
                        itemCount: newTaskModel.data!.length,
                        itemBuilder: (context, index) {
                          return TaskSingleItem(
                            onEditPress: () {
                              showChangeTaskStatus(newTaskModel.data![index].status ?? '',newTaskModel.data![index].sId ?? '',()=>getAllNewTask());
                            },
                            onDeletePress: () {},
                            subject:
                                newTaskModel.data![index].title ?? 'Unknown',
                            description:
                                newTaskModel.data![index].description ??
                                    'Unknown',
                            date: newTaskModel.data![index].createdDate ??
                                'Unknown',
                            type: newTaskModel.data![index].status ?? 'Unknown',
                            chipColour: Colors.blue,
                          );
                        })),
          ],
        ),
      ),
    );
  }


}
