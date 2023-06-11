import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

class ScreenBackground extends StatelessWidget {
  const ScreenBackground({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        SvgPicture.asset(
          'assets/image/background.svg',
          fit: BoxFit.cover,
          width: screenWidth,
          height: screenHeight,
        ),
        child,
      ],
    );
  }
}
