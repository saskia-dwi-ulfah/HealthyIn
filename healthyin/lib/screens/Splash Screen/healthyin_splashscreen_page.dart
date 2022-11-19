import 'package:flutter/material.dart';
//import 'package:flutter/src/widgets/container.dart';
//import 'package:flutter/src/widgets/framework.dart';
//import 'package:animated_splash_screen/animated_splash_screen.dart';

class HealthyInSplashScreen extends StatelessWidget {
  const HealthyInSplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Container(
      constraints: const BoxConstraints.expand(),
      height: h,
      width: w,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/splashscreen_bg_x2.png'),
            fit: BoxFit.cover),
      ),
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Positioned(
            top: 0.35 * h,
            child: Image.asset('assets/icons/splashscreen_tagline_x2.png',
                scale: 2),
          )
        ],
      ),
    );
  }
}
