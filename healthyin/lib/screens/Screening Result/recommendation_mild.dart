/*
Chat with doctor
*/

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class MildRecommendation extends StatelessWidget {
  const MildRecommendation({super.key});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Container(
          height: h,
          width: w,
          margin: const EdgeInsets.only(left: 20, right: 20),
          child: Column(children: [
            SizedBox(height: 0.15 * h),
            Text("Hasil self screening Anda adalah:",
                style: GoogleFonts.lato(
                    fontSize: 16, color: Color.fromARGB(1000, 170, 170, 170))),
            SizedBox(height: 10),
            Image.asset("assets/images/mild_x2.png", scale: 2),
            Text("Anda Berisiko Ringan COVID-19",
                style: GoogleFonts.lato(
                    fontSize: 20,
                    height: 1.5,
                    color: Color.fromARGB(1000, 132, 215, 157),
                    fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            Text("Berikut hal-hal yang dapat dilakukan sebagai tindakan awal",
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                    fontSize: 16,
                    height: 1.5,
                    color: Color.fromARGB(1000, 170, 170, 170))),
            Text(
                "Apa Yang Harus Saya Lakukan Apabila Terindikasi Positif COVID-19?",
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                    fontSize: 16,
                    height: 1.5,
                    color: Color.fromARGB(1000, 4, 167, 119),
                    fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            Text(
                "Kami rekomendasikan Anda untuk isolasi mandiri dan berkonsultasi jarak jauh dengan dokter.",
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                    fontSize: 16,
                    height: 1.5,
                    color: Color.fromARGB(1000, 170, 170, 170))),
            SizedBox(height: 20),
            Container(
              height: 40,
              width: w,
              color: Colors.white,
              child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                      side: BorderSide(
                          color: Color.fromARGB(1000, 4, 167, 119), width: 1),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)))),
                  child: Text("Konsultasi dengan Dokter Sekarang",
                      style: GoogleFonts.lato(
                          textStyle: TextStyle(
                              fontSize: 15,
                              color: Color.fromARGB(1000, 4, 167, 119),
                              height: 1.5)))),
            ),
            SizedBox(height: 10),
            Container(
              height: 40,
              width: w,
              color: Colors.white,
              child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                      side: BorderSide(
                          color: Color.fromARGB(1000, 4, 167, 119), width: 1),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)))),
                  child: Text("Unduh Hasil Screening",
                      style: GoogleFonts.lato(
                          textStyle: TextStyle(
                              fontSize: 15,
                              color: Color.fromARGB(1000, 4, 167, 119),
                              height: 1.5)))),
            )
          ])),
    );
  }
}
