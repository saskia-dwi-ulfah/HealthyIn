/*
Pertanyaan suhu tubuh >38 derajat 
*/

import 'package:flutter/material.dart';

class FourthPageScreening extends StatefulWidget {
  const FourthPageScreening({super.key});

  @override
  State<FourthPageScreening> createState() => _FourthPageScreeningState();
}

class _FourthPageScreeningState extends State<FourthPageScreening> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        height: h,
        width: w,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/self_screening_bg_x2.png"),
                fit: BoxFit.cover)),
        child: Column(children: [
          SizedBox(height: 0.4 * h),
          /*All questions start here*/
        ]),
      ),
    );
  }
}
