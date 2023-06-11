import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_manager/Data/auth_utils.dart';
import 'package:task_manager/ui/screens/log_in_screen.dart';
import 'package:task_manager/ui/screens/main_bottom_navbar.dart';
import 'package:task_manager/ui/widgets/screen_background.dart';

import '../../main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 2))
        .then((value) => {checkUserAuthState()});
  }

  Future<void> checkUserAuthState() async {
    final bool result = await AuthUtils.checkLoginState();

    if (result) {
      AuthUtils.getAuthData();
      Navigator.pushAndRemoveUntil(
          MyApp.globalKey.currentContext!,
          MaterialPageRoute(builder: (context) => const MainBottonNavbar()),
          (route) => false);
    } else {
      Navigator.pushAndRemoveUntil(
          MyApp.globalKey.currentContext!,
          MaterialPageRoute(builder: (context) => const LogInScreen()),
          (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: ScreenBackground(
        child: Center(
          child: SvgPicture.asset(
            'assets/image/logo.svg',
            fit: BoxFit.scaleDown,
            height: screenHeight / 13,
            width: screenWidth,
          ),
        ),
      ),
    );
  }
}
