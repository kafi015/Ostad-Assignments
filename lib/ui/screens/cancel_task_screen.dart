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

class CancelTaskScreen extends StatefulWidget {
  const CancelTaskScreen({Key? key}) : super(key: key);

  @override
  State<CancelTaskScreen> createState() => _CancelTaskScreenState();
}

class _CancelTaskScreenState extends State<CancelTaskScreen> {
  TaskModel canceledTaskModel = TaskModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllCanceledTask();
  }

  bool inProgress = false;

  Future<void> getAllCanceledTask() async {
    inProgress = true;
    setState(() {});
    final response = await NetworkUtils()
        .getMethod(Urls.getCanceledTaskUrl, token: AuthUtils.token);

    if (response != null) {
      canceledTaskModel = TaskModel.fromJson(response);
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
        onRefresh: ()async{
          await getAllCanceledTask();
        },
        child: Column(
          children: [
            Expanded(child: inProgress
                ? const Center(
              child: CircularProgressIndicator(
                color: Colors.green,
              ),
            )
                : ListView.builder(
                itemCount: canceledTaskModel.data!.length,
                itemBuilder: (context, index) {
                  return TaskSingleItem(
                      onEditPress: () {
                        showChangeTaskStatus(canceledTaskModel.data![index].status ?? '',canceledTaskModel.data![index].sId ?? '',()=>getAllCanceledTask());
                      },
                      onDeletePress: () {},
                      subject: canceledTaskModel.data![index].title ?? '',
                      description:
                      canceledTaskModel.data![index].description ?? '',
                      date: canceledTaskModel.data![index].createdDate ?? '',
                      type: canceledTaskModel.data![index].status ?? '', chipColour: Colors.red,);
                })),
          ],
        ),
      ),
    );
  }
}
