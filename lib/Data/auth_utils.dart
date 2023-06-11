import 'package:shared_preferences/shared_preferences.dart';

class AuthUtils {
  static String? firstName, lastName, token, profilePic, mobile, email;

  static Future<void> saveUserData(String fName, String lName, String uToken,
      String uProfilePic, String uMobile, String uEmail) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString('firstName', fName);
    sharedPreferences.setString('lastName', lName);
    sharedPreferences.setString('token', uToken);
    sharedPreferences.setString('profilePic', uProfilePic);
    sharedPreferences.setString('mobile', uMobile);
    sharedPreferences.setString('email', uEmail);

    firstName = fName;
    lastName = lName;
    token = uToken;
    profilePic = uProfilePic;
    mobile = uMobile;
    email = uEmail;
  }

  static Future<bool> checkLoginState() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString('token');
    if (token == null) {
      return false;
    } else {
      return true;
    }
  }

  static Future<void> getAuthData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    firstName = sharedPreferences.getString('firstName');
    lastName = sharedPreferences.getString('lastName');
    token = sharedPreferences.getString('token');
    profilePic = sharedPreferences.getString('profilePic');
    mobile = sharedPreferences.getString('mobile');
    email = sharedPreferences.getString('email');
  }

  static Future<void> clearAllData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();
  }
}
