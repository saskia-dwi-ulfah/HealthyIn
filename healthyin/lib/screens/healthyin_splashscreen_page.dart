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
      constraints: BoxConstraints.expand(),
      height: h,
      width: w,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/splashscreen_bg.png'),
            fit: BoxFit.fill),
      ),
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Positioned(
            top: 0.35 * h,
            child: Image.asset('assets/icons/splashscreen_tagline.png'),
          )
        ],
      ),
    );
    ;

    /*return AnimatedHealthyInSplashScreen(
      splash: Container(
        height: h,
        width: w,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/HealthyInSplashScreen_bg.png'),
              fit: BoxFit.fill),
        ),
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Positioned(
              top: 0.35 * h,
              child: Image.asset('assets/images/HealthyInSplashScreen_tagline.png'),
            )
          ],
        ),
      ),
      nextScreen: LoginPage(),
    );*/
  }
}
