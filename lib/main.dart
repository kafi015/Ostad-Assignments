import 'package:flutter/material.dart';

void main()
{
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  MySnakbar(context,String message)
  {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        ),
        backgroundColor: Colors.green,
        duration: Duration(seconds: 1),
      ),
    );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        backgroundColor: Colors.white,
        titleSpacing: 10,
        toolbarHeight: 70,
        elevation: 7,
        toolbarOpacity: 1,
        title: Text("Assignment 01",
        style: TextStyle(
          color: Colors.orange,
          fontWeight: FontWeight.bold,
        ),
        ),

        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: IconButton(
                onPressed: (){
                  MySnakbar(context,"Hey! you pressed E-mail icon. Welcome to E-mail");
                },
                icon: Icon(Icons.email,color: Colors.red,)),
          ),

          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: IconButton(onPressed: (){
              MySnakbar(context, "Hey! you pressed Facebook icon. Welcome to Facebook");
            }, icon: Icon(Icons.facebook,color: Colors.blue,)),
          ),

          IconButton(onPressed: (){

            MySnakbar(context, "Hey! you pressed WhatsApp icon. Welcome to WhatsApp");

          }, icon: Icon(Icons.whatsapp,color: Colors.green,)),
        ],
      ),


      floatingActionButton: FloatingActionButton(
        onPressed: (){
          MySnakbar(context, "This is FloatingActionButton!");
        },
        child: Icon(Icons.check),
        backgroundColor: Colors.green,
      ),


    );
  }
}

