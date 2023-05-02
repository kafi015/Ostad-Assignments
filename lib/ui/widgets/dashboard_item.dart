import 'package:flutter/material.dart';

class DashBoardItem extends StatelessWidget {
  const DashBoardItem({
    Key? key, required this.numberofTask, required this.typeofTask,
  }) : super(key: key);

  final int numberofTask ;
  final String typeofTask;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.white,

      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text("$numberofTask",style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
            const SizedBox(height: 8,),
            FittedBox(child: Text(typeofTask)),
          ],
        ),
      ),
    );
  }
}