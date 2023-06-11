import 'package:flutter/material.dart';
import 'package:task_manager/ui/widgets/dashboard_item.dart';
import 'package:task_manager/ui/widgets/screen_background.dart';
import 'package:task_manager/ui/widgets/task_single_item.dart';


class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({Key? key}) : super(key: key);

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllNewTask();
  }

  bool inProgress = false;

  getAllNewTask() {
    inProgress = true;
    setState(() {});

    inProgress = false;
    setState(() {});

  }

  @override
  Widget build(BuildContext context) {
    return ScreenBackground(
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
              child: ListView.builder(
                  itemCount: 15,
                  itemBuilder: (context, index) {
                    return TaskSingleItem(
                      onEditPress: () {},
                      onDeletePress: () {},
                      subject: "Title one",
                      description:
                          "the hmber you call ins not be reachedat the momemnt please try again ater thank you",
                      date: "12/05/23",
                      type: "New",
                      chipColour: Colors.blue,
                    );
                  })),
        ],
      ),
    );
  }
}
