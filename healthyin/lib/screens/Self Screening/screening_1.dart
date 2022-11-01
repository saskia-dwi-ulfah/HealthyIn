/*
Nama, usia, jenis kelamin
*/

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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

    return Scaffold(
      body: Container(
        height: h,
        width: w,
        //Background image
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/self_screening_bg_x2.png"),
                fit: BoxFit.cover)),
        child: Column(children: [
          SizedBox(height: 0.1 * h),
          //'Self Screening'text
          Container(
              width: w,
              height: 40,
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: Text("Self Screening",
                  textAlign: TextAlign.start,
                  style: GoogleFonts.lato(
                      textStyle: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 0.5,
                          color: Color.fromARGB(1000, 255, 255, 255),
                          height: 1.5)))),
          //'COVID-19' text
          Container(
              width: w,
              height: 40,
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: Text("COVID-19",
                  textAlign: TextAlign.start,
                  style: GoogleFonts.lato(
                      textStyle: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 0.5,
                          color: Color.fromARGB(1000, 255, 255, 255),
                          height: 1.5)))),
          //Spacing between (question and answer box) and 'Self Screening COVID-19' text
          SizedBox(height: 0.18 * h),
          Container(
              width: w,
              height: 90 + 0.024 * h + 0.35 * h,
              color: Colors.amber,
              margin: EdgeInsets.only(left: 20, right: 20, bottom: 8),
              child: Column(
                children: [
                  Container(
                    height: 30,
                    width: w,
                    color: Colors.blueAccent,
                    child: Text("1. Nama lengkap",
                        style: GoogleFonts.lato(
                            textStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Color.fromARGB(1000, 18, 18, 18),
                                height: 1.4))),
                  ),
                  SizedBox(height: 5),
                  Container(
                    height: 40,
                    width: w,
                    color: Colors.blueGrey,
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 30,
                    width: w,
                    color: Colors.blueAccent,
                    child: Text("2. Jenis kelamin",
                        style: GoogleFonts.lato(
                            textStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Color.fromARGB(1000, 18, 18, 18),
                                height: 1.4))),
                  ),
                  SizedBox(height: 5),
                  Container(
                    height: 40,
                    width: w,
                    color: Colors.blueGrey,
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 30,
                    width: w,
                    color: Colors.blueAccent,
                    child: Text("3. Usia",
                        style: GoogleFonts.lato(
                            textStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Color.fromARGB(1000, 18, 18, 18),
                                height: 1.4))),
                  ),
                  SizedBox(height: 5),
                  Container(
                    height: 40,
                    width: w,
                    color: Colors.blueGrey,
                  )

                  /*                 Container(
                      alignment: Alignment.centerLeft,
                      //margin: EdgeInsets.only(left: 50, right: 50),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //Text Input
                          TextField(
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(
                                    width: 1.5,
                                    color: Colors.grey,
                                  ),
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 12.5, horizontal: 20),
                                filled: true,
                                hintStyle: GoogleFonts.lato(
                                    textStyle: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color:
                                            Color.fromARGB(232, 134, 134, 134),
                                        height: 1)),
                                hintText: "Nama Lengkap",
                                fillColor: Colors.white70),
                          )
                        ],
                      ))*/
                ],
              )),
          SizedBox(height: 0.032 * h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //Button Sebelumnya
              Container(
                width: 152,
                height: 40,
                child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(
                          color: Color.fromARGB(1000, 4, 167, 119), width: 2),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                    onPressed: () {},
                    child: Text(
                      'Sebelumnya',
                      style: GoogleFonts.lato(
                        textStyle: TextStyle(
                            color: Color.fromARGB(1000, 4, 167, 119),
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            height: 1.5),
                      ),
                    )),
              ),
              //Button Selanjutnya
              Container(
                width: 152,
                height: 40,
                child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Color.fromARGB(1000, 4, 167, 119),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                    onPressed: () {},
                    child: Text(
                      'Selanjutnya',
                      style: GoogleFonts.lato(
                        textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            height: 1.5),
                      ),
                    )),
              ),
            ],
          )
          /*// Size Box
          SizedBox(height: 0.143 * h),

          // "Nama"
          Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: 45, right: 45),
              child: Text("1. Siapakah nama anda?",
                  textAlign: TextAlign.left,
                  style: GoogleFonts.lato(
                      textStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color.fromARGB(1000, 18, 18, 18),
                          height: 1.4)))),

          // Size Box
          SizedBox(height: 0.03 * h),

          // Name Box
          Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: 50, right: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //Text Input
                  TextField(
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                            width: 1.5,
                            color: Colors.grey,
                          ),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 12.5, horizontal: 20),
                        filled: true,
                        hintStyle: GoogleFonts.lato(
                            textStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Color.fromARGB(232, 134, 134, 134),
                                height: 1)),
                        hintText: "Nama Lengkap",
                        fillColor: Colors.white70),
                  )
                ],
              )),

          // Size Box
          SizedBox(height: 0.37 * h),*/

          //Button Selanjutnya
        ]),
      ),
    );
  }
}
