import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ScreeningMainPage extends StatefulWidget {
  const ScreeningMainPage({super.key});

  @override
  State<ScreeningMainPage> createState() => _ScreeningMainPageState();
}

class _ScreeningMainPageState extends State<ScreeningMainPage> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
            height: h,
            width: w,
            //Background image
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/self_screening_bg_x2.png"),
                    fit: BoxFit.cover))));
  }
}
