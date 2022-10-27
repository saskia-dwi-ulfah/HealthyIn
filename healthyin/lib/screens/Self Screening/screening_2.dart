/*
Pertanyaan kontak dengan pasien COVID-19 14 hari terakhir
*/

import 'package:flutter/material.dart';

class SecondPageScreening extends StatefulWidget {
  const SecondPageScreening({super.key});

  @override
  State<SecondPageScreening> createState() => _SecondPageScreeningState();
}

class _SecondPageScreeningState extends State<SecondPageScreening> {
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
