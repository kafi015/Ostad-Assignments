import 'package:flutter/material.dart';
import 'package:task_manager/ui/widgets/screen_background.dart';
import 'package:task_manager/ui/widgets/task_single_item.dart';

import '../../Data/Models/task_model.dart';
import '../../Data/auth_utils.dart';
import '../../Data/network_utils.dart';
import '../../Data/urls.dart';
import '../../main.dart';
import '../utils/snackbar_message.dart';
import '../widgets/status_change_bottom_sheet.dart';

class InProgressTaskScreen extends StatefulWidget {
  const InProgressTaskScreen({Key? key}) : super(key: key);

  @override
  State<InProgressTaskScreen> createState() => _InProgressTaskScreenState();
}

class _InProgressTaskScreenState extends State<InProgressTaskScreen> {
  TaskModel inProgressTaskModel = TaskModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllInProgressTask();
  }

  bool inProgress = false;

  Future<void> getAllInProgressTask() async {
    inProgress = true;
    setState(() {});
    final response = await NetworkUtils()
        .getMethod(Urls.getInProgressedTaskUrl, token: AuthUtils.token);

    if (response != null) {
      inProgressTaskModel = TaskModel.fromJson(response);
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
        onRefresh: () async {
          await getAllInProgressTask();
        },
        child: Column(
          children: [
            Expanded(
                child: inProgress
                    ? const Center(
                        child: CircularProgressIndicator(
                          color: Colors.green,
                        ),
                      )
                    : ListView.builder(
                        itemCount: inProgressTaskModel.data!.length,
                        itemBuilder: (context, index) {
                          return TaskSingleItem(
                            onEditPress: () {
                              showChangeTaskStatus(inProgressTaskModel.data![index].status ?? '',inProgressTaskModel.data![index].sId ?? '',()=>getAllInProgressTask());
                            },
                            onDeletePress: () {},
                            subject: inProgressTaskModel.data![index].title ??
                                'Unknown',
                            description:
                                inProgressTaskModel.data![index].description ??
                                    'Unknown',
                            date:
                                inProgressTaskModel.data![index].createdDate ??
                                    'Unknown',
                            type: inProgressTaskModel.data![index].status ??
                                'Unknown',
                            chipColour: Colors.green,
                          );
                        })),
          ],
        ),
      ),
    );
  }
}
