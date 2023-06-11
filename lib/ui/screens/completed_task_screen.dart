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

class CompletedTaskScreen extends StatefulWidget {
  const CompletedTaskScreen({Key? key}) : super(key: key);

  @override
  State<CompletedTaskScreen> createState() => _CompletedTaskScreenState();
}

class _CompletedTaskScreenState extends State<CompletedTaskScreen> {
  TaskModel completedTaskModel = TaskModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllCompletedTask();
  }

  bool inProgress = false;

  Future<void> getAllCompletedTask() async {
    inProgress = true;
    setState(() {});
    final response = await NetworkUtils()
        .getMethod(Urls.getCompletedTaskUrl, token: AuthUtils.token);

    if (response != null) {
      completedTaskModel = TaskModel.fromJson(response);
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
         await getAllCompletedTask();
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
                        itemCount: completedTaskModel.data!.length,
                        itemBuilder: (context, index) {
                          return TaskSingleItem(
                            onEditPress: () {
                              showChangeTaskStatus(completedTaskModel.data![index].status ?? '', completedTaskModel.data![index].sId ?? '',()=>getAllCompletedTask());

                            },
                            onDeletePress: () {},
                            subject: completedTaskModel.data![index].title ??
                                'Unknown',
                            description:
                                completedTaskModel.data![index].description ??
                                    'Unknown',
                            date: completedTaskModel.data![index].createdDate ??
                                'Unknown',
                            type: completedTaskModel.data![index].status ??
                                'Unknown',
                            chipColour: Colors.purple,
                          );
                        })),
          ],
        ),
      ),
    );
  }
}
