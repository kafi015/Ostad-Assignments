import 'package:flutter/material.dart';
import 'package:todo_app/todohomepage.dart';

void main()
{
  runApp(MyApp());
}


class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),

      debugShowCheckedModeBanner: false,
      home: ToDoHomePage(),
    );
  }
}
