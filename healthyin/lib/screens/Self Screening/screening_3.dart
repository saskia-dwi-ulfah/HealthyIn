/*
Pertanyaan kunjungan ke negara endemis
*/

import 'package:flutter/material.dart';

class ThirdPageScreening extends StatefulWidget {
  const ThirdPageScreening({super.key});

  @override
  State<ThirdPageScreening> createState() => _ThirdPageScreeningState();
}

class _ThirdPageScreeningState extends State<ThirdPageScreening> {
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
