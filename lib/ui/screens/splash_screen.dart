import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double ScreenHeight = MediaQuery.of(context).size.height;
    double ScreenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          SvgPicture.asset(
            'assets/image/background.svg',
            fit: BoxFit.cover,
            width: ScreenWidth,
            height: ScreenHeight,
          ),
          Center(
              child: SvgPicture.asset(
            'assets/image/logo.svg',
                fit: BoxFit.scaleDown,
                height: ScreenHeight/13,
                width: ScreenWidth,
          ))
        ],
      ),
    );
  }
}
