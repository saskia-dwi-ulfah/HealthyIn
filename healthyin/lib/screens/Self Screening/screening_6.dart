/*
Pertanyaan gejala 14 hari terakhir, layer 2
*/

import 'package:flutter/material.dart';

class SixthPageScreening extends StatefulWidget {
  const SixthPageScreening({super.key});

  @override
  State<SixthPageScreening> createState() => _SixthPageScreeningState();
}

class _SixthPageScreeningState extends State<SixthPageScreening> {
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
