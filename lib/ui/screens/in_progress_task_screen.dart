import 'package:flutter/material.dart';
import 'package:task_manager/ui/widgets/screen_background.dart';
import 'package:task_manager/ui/widgets/task_single_item.dart';

class InProgressTaskScreen extends StatefulWidget {
  const InProgressTaskScreen({Key? key}) : super(key: key);

  @override
  State<InProgressTaskScreen> createState() => _InProgressTaskScreenState();
}

class _InProgressTaskScreenState extends State<InProgressTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return ScreenBackground(
      child: Column(
        children: [
          Expanded(child: ListView.builder(
              itemCount: 15,
              itemBuilder: (context, index) {
                return TaskSingleItem(
                    onEditPress: () {},
                    onDeletePress: () {},
                    subject: "Title one",
                    description:
                    "the hmber you call ins not be reachedat the momemnt please try again ater thank you",
                    date: "12/05/23",
                    type: "In Progress", chipColour: Colors.green,);
              })),
        ],
      ),
    );
  }
}
