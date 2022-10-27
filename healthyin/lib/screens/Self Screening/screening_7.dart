/*
Pertanyaan gejala 14 hari terakhir, layer 3
*/

import 'package:flutter/material.dart';

class SeventhPageScreening extends StatefulWidget {
  const SeventhPageScreening({super.key});

  @override
  State<SeventhPageScreening> createState() => _SeventhPageScreeningState();
}

class _SeventhPageScreeningState extends State<SeventhPageScreening> {
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
