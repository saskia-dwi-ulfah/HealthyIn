/*
Nama, usia, jenis kelamin
*/

import 'package:flutter/material.dart';

class FirstPageScreening extends StatefulWidget {
  const FirstPageScreening({super.key});

  @override
  State<FirstPageScreening> createState() => _FirstPageScreeningState();
}

class _FirstPageScreeningState extends State<FirstPageScreening> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Column(
      children: [
        Column(
          children: [
            Container(
              height: h,
              width: w,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image:
                          AssetImage("assets/images/self_screening_bg_x2.png"),
                      fit: BoxFit.cover)),
            )
          ],
        )
      ],
    );
  }
}
