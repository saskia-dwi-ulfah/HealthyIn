/*
Pertanyaan gejala 14 hari terakhir, layer 3
*/

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SeventhPageScreening extends StatefulWidget {
  const SeventhPageScreening({super.key});

  @override
  State<SeventhPageScreening> createState() => _SeventhPageScreeningState();
}

class _SeventhPageScreeningState extends State<SeventhPageScreening> {
  //for scoring logic
  bool isPressed1 = false;
  bool isPressed2 = false;
  bool isPressed3 = false;
  bool isPressed4 = false;
  bool isPressed5 = false;
  bool isPressed6 = false;
  bool isPressed7 = false;
  bool isPressed8 = false;
  int counter = 0;

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
                          fontSize: 25,
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
                          fontSize: 25,
                          color: Color.fromARGB(1000, 255, 255, 255),
                          height: 1.5)))),
          //Spacing between (question and options) and 'Self Screening COVID-19' text
          SizedBox(height: 0.18 * h),
          //Question starts here
          Align(
              alignment: Alignment.topCenter,
              child: Text(
                  "6. Apakah Anda pernah mengalami gejala di bawah ini dalam 14 hari terakhir? (scroll hingga ke bawah)",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lato(
                      textStyle: TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(1000, 18, 18, 18),
                          height: 1.5)))),
          SizedBox(height: 10),
          //All options start here*/
          Container(
            width: w,
            height: 0.4 * h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Color.fromARGB(1000, 241, 241, 241)),
            margin: const EdgeInsets.only(left: 10, right: 10),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CheckboxListTile(
                      value: isPressed1,
                      activeColor: Color.fromARGB(1000, 134, 22, 87),
                      onChanged: (value) {
                        setState(() {
                          isPressed1 = value!;
                        });

                        if (isPressed1 == false) {
                          counter = counter - 2;
                        } else {
                          counter = counter + 2;
                        }
                        print(counter);
                      },
                      title: Text("Sakit perut",
                          textAlign: TextAlign.left,
                          style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                  fontSize: 15,
                                  color: Color.fromARGB(1000, 18, 18, 18),
                                  height: 1.5)))),
                  CheckboxListTile(
                      value: isPressed2,
                      activeColor: Color.fromARGB(1000, 134, 22, 87),
                      onChanged: (value) {
                        setState(() {
                          isPressed2 = value!;
                        });

                        if (isPressed2 == false) {
                          counter = counter - 2;
                        } else {
                          counter = counter + 2;
                        }
                        print(counter);
                      },
                      title: Text("Muntah",
                          textAlign: TextAlign.left,
                          style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                  fontSize: 15,
                                  color: Color.fromARGB(1000, 18, 18, 18),
                                  height: 1.5)))),
                  CheckboxListTile(
                      value: isPressed3,
                      activeColor: Color.fromARGB(1000, 134, 22, 87),
                      onChanged: (value) {
                        setState(() {
                          isPressed3 = value!;
                        });

                        if (isPressed3 == false) {
                          counter = counter - 2;
                        } else {
                          counter = counter + 2;
                        }
                        print(counter);
                      },
                      title: Text("Diare",
                          textAlign: TextAlign.left,
                          style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                  fontSize: 15,
                                  color: Color.fromARGB(1000, 18, 18, 18),
                                  height: 1.5)))),
                  CheckboxListTile(
                      value: isPressed4,
                      activeColor: Color.fromARGB(1000, 134, 22, 87),
                      onChanged: (value) {
                        setState(() {
                          isPressed4 = value!;
                        });

                        if (isPressed4 == false) {
                          counter = counter - 2;
                        } else {
                          counter = counter + 2;
                        }
                        print(counter);
                      },
                      title: Text("Nyeri dada atau tekanan",
                          textAlign: TextAlign.left,
                          style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                  fontSize: 15,
                                  color: Color.fromARGB(1000, 18, 18, 18),
                                  height: 1.5)))),
                  CheckboxListTile(
                      value: isPressed5,
                      activeColor: Color.fromARGB(1000, 134, 22, 87),
                      onChanged: (value) {
                        setState(() {
                          isPressed5 = value!;
                        });

                        if (isPressed5 == false) {
                          counter = counter - 2;
                        } else {
                          counter = counter + 2;
                        }
                        print(counter);
                      },
                      title: Text("Nyeri otot",
                          textAlign: TextAlign.left,
                          style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                  fontSize: 15,
                                  color: Color.fromARGB(1000, 18, 18, 18),
                                  height: 1.5)))),
                  CheckboxListTile(
                      value: isPressed6,
                      activeColor: Color.fromARGB(1000, 134, 22, 87),
                      onChanged: (value) {
                        setState(() {
                          isPressed6 = value!;
                        });

                        if (isPressed6 == false) {
                          counter = counter - 2;
                        } else {
                          counter = counter + 2;
                        }
                        print(counter);
                      },
                      title: Text("Kehilangan indra perasa dan pembau",
                          textAlign: TextAlign.left,
                          style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                  fontSize: 15,
                                  color: Color.fromARGB(1000, 18, 18, 18),
                                  height: 1.5)))),
                  CheckboxListTile(
                      value: isPressed7,
                      activeColor: Color.fromARGB(1000, 134, 22, 87),
                      onChanged: (value) {
                        setState(() {
                          isPressed7 = value!;
                        });

                        if (isPressed7 == false) {
                          counter = counter - 2;
                        } else {
                          counter = counter + 2;
                        }
                        print(counter);
                      },
                      title: Text(
                          "Ruam pada kulit atau perubahan warna pada jari tangan atau kaki",
                          textAlign: TextAlign.left,
                          style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                  fontSize: 15,
                                  color: Color.fromARGB(1000, 18, 18, 18),
                                  height: 1.5)))),
                  CheckboxListTile(
                      value: isPressed8,
                      activeColor: Color.fromARGB(1000, 134, 22, 87),
                      onChanged: (value) {
                        setState(() {
                          isPressed8 = value!;
                        });

                        if (isPressed8 == false) {
                          counter = counter - 2;
                        } else {
                          counter = counter + 2;
                        }
                        print(counter);
                      },
                      title: Text(
                          "Kehilangan kemampuan untuk berbicara dan bergerak",
                          textAlign: TextAlign.left,
                          style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                  fontSize: 15,
                                  color: Color.fromARGB(1000, 18, 18, 18),
                                  height: 1.5))))
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          //'Sebelumnya' and 'Selanjutnya' buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                      side: BorderSide(
                          color: Color.fromARGB(1000, 4, 167, 119), width: 1),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)))),
                  child: Text("Sebelumnya",
                      style: GoogleFonts.lato(
                          textStyle: TextStyle(
                              fontSize: 15,
                              color: Color.fromARGB(1000, 4, 167, 119),
                              height: 1.5)))),
              SizedBox(width: 10),
              OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                      side: BorderSide(
                          color: Color.fromARGB(1000, 4, 167, 119), width: 1),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)))),
                  child: Text("Selanjutnya",
                      style: GoogleFonts.lato(
                          textStyle: TextStyle(
                              fontSize: 15,
                              color: Color.fromARGB(1000, 4, 167, 119),
                              height: 1.5))))
            ],
          )
        ]),
      ),
    );
  }
}

/*
More improvement:
- How to make code less repetition?
- How to change active color of outlined button and its text?
 */
