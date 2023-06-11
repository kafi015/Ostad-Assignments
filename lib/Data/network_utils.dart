import 'dart:convert';
import 'package:flutter/material.dart';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:task_manager/Data/auth_utils.dart';
import 'package:task_manager/main.dart';
import 'package:task_manager/ui/screens/log_in_screen.dart';

class NetworkUtils {
  Future<dynamic> getMethod(String url,{VoidCallback? onunauthorized, String? token}) async {
    try {
      final http.Response response = await http.get(
        Uri.parse(url),
        headers: {"Content-Type": "application/json", 'token': token ?? ''},
      );
      log(response.body);

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else if (response.statusCode == 401) {
        if(onunauthorized != null)
          {
            onunauthorized();
          }
        else
          {
            moveToLogInScreen();
          }
      }
      else {
        log("Something went wrong ${response.statusCode}");
      }
    } catch (e) {
      log('Error $e');
    }
  }

  Future<dynamic> postMethod(String url,
      {Map<String, String>? body,
      VoidCallback? onunauthorized,
      String? token}) async {
    try {
      final http.Response response = await http.post(Uri.parse(url),
          headers: {"Content-Type": "application/json", 'token': token ?? ''},
          body: jsonEncode(body));
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else if (response.statusCode == 401) {
        if (onunauthorized != null) {
          onunauthorized();
        }
        else
          {
            moveToLogInScreen();
          }

      } else {
        log("Something went wrong");
      }
    } catch (e) {
      log('Error $e');
    }



  }
  void moveToLogInScreen()
  {
    AuthUtils.clearAllData();
    Navigator.pushAndRemoveUntil(MyApp.globalKey.currentContext!, MaterialPageRoute(builder: (context)=>const LogInScreen()), (route) => false);
  }
}
