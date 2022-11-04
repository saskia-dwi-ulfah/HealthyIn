// ignore_for_file: sized_box_for_whitespace

/*
Pertanyaan gejala 14 hari terakhir, layer 2
*/

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthyin/screens/Self%20Screening/screening_7.dart';

class SixthPageScreening extends StatefulWidget {
  const SixthPageScreening({super.key});

  @override
  State<SixthPageScreening> createState() => _SixthPageScreeningState();
}

class _SixthPageScreeningState extends State<SixthPageScreening> {
  //catch argument from previous screen
  var data = Get.arguments;

  //question8
  var question8 =
      "8. Apakah anda mengalami gejala berikut dalam 14 hari terakhir?";

  //answer choosed
  var answerChoosed = {};

  //for scoring logic
  int tempScore = 0;
  int sixthPageScore = 0;

  bool isChecked1 = false;
  bool isChecked2 = false;
  bool isChecked3 = false;
  bool isChecked4 = false;
  bool isChecked5 = false;
  List<bool> symptomps = [];

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
                      textStyle: const TextStyle(
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
                      textStyle: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 0.5,
                          color: Color.fromARGB(1000, 255, 255, 255),
                          height: 1.5)))),
          //Spacing between (question and options) and 'Self Screening COVID-19' text
          SizedBox(height: 0.18 * h),
          /*All questions start here*/
          Container(
              height: 90,
              width: w,
              alignment: Alignment.topCenter,
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: Text(question8,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lato(
                      textStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color.fromARGB(1000, 18, 18, 18),
                          height: 1.4)))),
          //Spacing between question and options
          SizedBox(height: 0.024 * h),
          /*All options start here*/
          Container(
            width: w,
            height: 0.35 * h,
            child: SingleChildScrollView(
                child: Column(children: [
              //Option 1
              Container(
                  padding: const EdgeInsets.all(4),
                  margin: const EdgeInsets.only(left: 20, right: 20, bottom: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: const Color.fromARGB(1000, 241, 241, 241),
                  ),
                  child: CheckboxListTile(
                    title: Text(
                      'Masalah pernapasan',
                      style: GoogleFonts.lato(
                        textStyle: const TextStyle(
                            color: Color.fromARGB(1000, 18, 18, 18),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            height: 1.4),
                      ),
                    ),
                    activeColor: const Color.fromARGB(1000, 134, 22, 87),
                    controlAffinity: ListTileControlAffinity.leading,
                    value: isChecked1,
                    onChanged: (value) {
                      setState(() => isChecked1 = value!);

                      if (isChecked1 == true) {
                        answerChoosed[(answerChoosed.length + 1).toString()] =
                            "Masalah pernapasan";
                      } else {
                        answerChoosed.removeWhere(
                            (key, value) => value == "Masalah pernapasan");
                      }
                    },
                  )),
              //Option 2
              Container(
                  padding: const EdgeInsets.all(4),
                  margin: const EdgeInsets.only(left: 20, right: 20, bottom: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: const Color.fromARGB(1000, 241, 241, 241),
                  ),
                  child: CheckboxListTile(
                    title: Text(
                      'Batuk kering',
                      style: GoogleFonts.lato(
                        textStyle: const TextStyle(
                            color: Color.fromARGB(1000, 18, 18, 18),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            height: 1.4),
                      ),
                    ),
                    activeColor: const Color.fromARGB(1000, 134, 22, 87),
                    controlAffinity: ListTileControlAffinity.leading,
                    value: isChecked2,
                    onChanged: (value) {
                      setState(() => isChecked2 = value!);

                      if (isChecked2 == true) {
                        answerChoosed[(answerChoosed.length + 1).toString()] =
                            "Batuk kering";
                      } else {
                        answerChoosed.removeWhere(
                            (key, value) => value == "Batuk kering");
                      }
                    },
                  )),
              //Option 3
              Container(
                  padding: const EdgeInsets.all(4),
                  margin: const EdgeInsets.only(left: 20, right: 20, bottom: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: const Color.fromARGB(1000, 241, 241, 241),
                  ),
                  child: CheckboxListTile(
                    title: Text(
                      'Sakit tenggorokan',
                      style: GoogleFonts.lato(
                        textStyle: const TextStyle(
                            color: Color.fromARGB(1000, 18, 18, 18),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            height: 1.4),
                      ),
                    ),
                    activeColor: const Color.fromARGB(1000, 134, 22, 87),
                    controlAffinity: ListTileControlAffinity.leading,
                    value: isChecked3,
                    onChanged: (value) {
                      setState(() => isChecked3 = value!);

                      if (isChecked3 == true) {
                        answerChoosed[(answerChoosed.length + 1).toString()] =
                            "Sakit tenggorokan";
                      } else {
                        answerChoosed.removeWhere(
                            (key, value) => value == "Sakit tenggorokan");
                      }
                    },
                  )),
              //Option 4
              Container(
                  padding: const EdgeInsets.all(4),
                  margin: const EdgeInsets.only(left: 20, right: 20, bottom: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: const Color.fromARGB(1000, 241, 241, 241),
                  ),
                  child: CheckboxListTile(
                    title: Text(
                      'Pilek',
                      style: GoogleFonts.lato(
                        textStyle: const TextStyle(
                            color: Color.fromARGB(1000, 18, 18, 18),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            height: 1.4),
                      ),
                    ),
                    activeColor: const Color.fromARGB(1000, 134, 22, 87),
                    controlAffinity: ListTileControlAffinity.leading,
                    value: isChecked4,
                    onChanged: (value) {
                      setState(() => isChecked4 = value!);

                      if (isChecked4 == true) {
                        answerChoosed[(answerChoosed.length + 1).toString()] =
                            "Pilek";
                      } else {
                        answerChoosed
                            .removeWhere((key, value) => value == "Pilek");
                      }
                    },
                  )),
              //Option 5
              Container(
                  padding: const EdgeInsets.all(4),
                  margin: const EdgeInsets.only(left: 20, right: 20, bottom: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: const Color.fromARGB(1000, 241, 241, 241),
                  ),
                  child: CheckboxListTile(
                    title: Text(
                      'Lemah, letih, lesu',
                      style: GoogleFonts.lato(
                        textStyle: const TextStyle(
                            color: Color.fromARGB(1000, 18, 18, 18),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            height: 1.4),
                      ),
                    ),
                    activeColor: const Color.fromARGB(1000, 134, 22, 87),
                    controlAffinity: ListTileControlAffinity.leading,
                    value: isChecked5,
                    onChanged: (value) {
                      setState(() => isChecked5 = value!);

                      if (isChecked5 == true) {
                        answerChoosed[(answerChoosed.length + 1).toString()] =
                            "Lemah, letih, lesu";
                      } else {
                        answerChoosed.removeWhere(
                            (key, value) => value == "Lemah, letih, lesu");
                      }
                    },
                  )),
            ])),
          ),
          //Spacing between (question and options) and buttons
          SizedBox(height: 0.032 * h),
          //Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //Button Sebelumnya
              Container(
                width: 152,
                height: 40,
                child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(
                          color: Color.fromARGB(1000, 4, 167, 119), width: 2),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                    onPressed: () {
                      Get.back();
                    },
                    child: Text(
                      'Sebelumnya',
                      style: GoogleFonts.lato(
                        textStyle: const TextStyle(
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
                      backgroundColor: const Color.fromARGB(1000, 4, 167, 119),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                    onPressed: () {
                      symptomps = [
                        isChecked1,
                        isChecked2,
                        isChecked3,
                        isChecked4,
                        isChecked5
                      ];
                      tempScore = symptomps
                          .where((element) => element == true)
                          .toList()
                          .length;

                      if (tempScore != 0) {
                        sixthPageScore = 3 + tempScore - 1;
                      } else {
                        sixthPageScore = 0;
                      }

                      data['sixth_page'] = {
                        'question': question8,
                        'answer': answerChoosed,
                        'score': sixthPageScore
                      };

                      Get.to(() => const SeventhPageScreening(),
                          arguments: data);
                    },
                    child: Text(
                      'Selanjutnya',
                      style: GoogleFonts.lato(
                        textStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            height: 1.5),
                      ),
                    )),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
