import 'dart:core';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/style.dart';

class ToDoHomePage extends StatefulWidget {
  const ToDoHomePage({Key? key}) : super(key: key);

  @override
  State<ToDoHomePage> createState() => _ToDoHomePageState();
}

class _ToDoHomePageState extends State<ToDoHomePage> {
  List todolist = [];
  List date = [];
  List time = [];

  TextEditingController todoController = TextEditingController();

  mySnakBar(msg, context) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: Colors.orange,
      content: Text(
        msg,
        style: const TextStyle(fontSize: 18),
      ),
    ));
  }

  myAlertDialog(context, index) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Expanded(
              child: AlertDialog(
            title: const Text("Alert"),
            content: const Text("Do you want to delete this todo?"),
            actions: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
                  onPressed: () {
                    todolist.removeAt(index);
                    setState(() {});
                    Navigator.of(context).pop();
                  },
                  child: const Text("YES")),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("NO")),
            ],
          ));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("To Do"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  Expanded(
                    flex: 7,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: TextFormField(
                        maxLines: 2,
                        controller: todoController,
                        keyboardType: TextInputType.text,
                        decoration: MyAppInputDecoration(),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                      child: ElevatedButton(
                        style: MyAppButtonStyle(),
                        child: const Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Text("Add"),
                        ),
                        onPressed: () {
                          if (todoController.text != "") {
                            todolist.add(todoController.text);
                            todoController.clear();
                          } else {
                            mySnakBar("Write anything for add.", context);
                          }
                         time.add(DateFormat.jm().format(DateTime.now()));
                          date.add(DateFormat.yMMMEd().format(DateTime.now()));

                          setState(() {});
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 9,
              child: ListView.builder(
                itemCount: todolist.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                    child: Card(
                      elevation: 15,
                      child: SizedBox50(
                        Row(
                          children: [
                            Expanded(
                                flex: 80, child: Column(
                              children: [
                                Container( alignment: Alignment.bottomLeft,child: Text(todolist[index].toString())),
                                const SizedBox(height: 8,),
                                Container(
                                  alignment: Alignment.bottomRight,
                                  child: Text("${time[index]}    ${date[index]}",style: const TextStyle(color: Colors.grey),),
                                ),
                              ],
                            ),),
                            Expanded(
                              flex: 20,
                              child: TextButton(
                                onPressed: () {
                                  myAlertDialog(context, index);
                                },
                                child: const Icon(Icons.delete),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
