import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_manager/ui/widgets/screen_background.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double ScreenHeight = MediaQuery.of(context).size.height;
    double ScreenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: ScreenBackground(
        widget: Center(
          child: SvgPicture.asset(
            'assets/image/logo.svg',
            fit: BoxFit.scaleDown,
            height: ScreenHeight / 13,
            width: ScreenWidth,
          ),
        ),
      ),
    );
  }
}

