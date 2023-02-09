import 'package:flutter/material.dart';

void main() {
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

  MySnakBar(msg, context) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        msg,
        style: TextStyle(fontSize: 24),
      ),
    ));
  }

  MyAlertDialog(context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Expanded(
            child: AlertDialog(
              title: Text("Alert"),
              content: Text("Do you want to exit?"),
              actions: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                    onPressed: () {
                      MySnakBar("Exit Successfully", context);
                      Navigator.of(context).pop();
                    },
                    child: Text("Yes")),

                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("No")),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text("Assignment 02"),
        centerTitle: true,
      ),

      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              padding: EdgeInsets.all(0.0),
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.white),
                arrowColor: Colors.white,
                accountName: Text(
                  "Abdullh Al-Kafi",
                  style: TextStyle(color: Colors.black),
                ),
                accountEmail: Text(
                  "kaficsebaiust02@gmail.com",
                  style: TextStyle(color: Colors.black),
                ),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage("kafi_profile.jpg"),
                ),
                onDetailsPressed: () {
                  MySnakBar("This is Profile", context);
                },
              ),
            ),
            ListTile(
              onTap: () {
                MySnakBar("This is home Button", context);
              },
              leading: Icon(Icons.home,color: Colors.deepOrange,),
              title: Text("Home",style: TextStyle(color: Colors.deepOrange,),)
            ),
            ListTile(
              onTap: () {
                MySnakBar("This is Contact Button", context);
              },
              leading: Icon(Icons.contact_mail,color: Colors.deepOrange,),
              title: Text("Contact",style: TextStyle(color: Colors.deepOrange,),),
            ),
            SizedBox(
              height: 300,
            ),
            ListTile(
              onTap: () {
                MySnakBar("LogOut Successfully", context);
              },
              leading: Icon(Icons.logout,color: Colors.deepOrange,),
              title: Text("Logout",style: TextStyle(color: Colors.deepOrange,),
            ),
            ),
          ],
        ),
      ),
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepOrange,
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text("Exit"),
          ),
          onPressed: () {
           MyAlertDialog(context);
          },
        ),
      ),
    );
  }
}
