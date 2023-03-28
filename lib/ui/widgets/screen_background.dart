import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

class ScreenBackground extends StatelessWidget {
  const ScreenBackground({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    double ScreenHeight = MediaQuery.of(context).size.height;
    double ScreenWidth = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        SvgPicture.asset(
          'assets/image/background.svg',
          fit: BoxFit.cover,
          width: ScreenWidth,
          height: ScreenHeight,
        ),
        child,
      ],
    );
  }
}
