// ignore_for_file: sized_box_for_whitespace, duplicate_ignore

/*
Pertanyaan gejala 14 hari terakhir, layer 3
*/

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthyin/screens/Self%20Screening/Screening%20Result/recommendation_mild.dart';
import 'package:healthyin/screens/Self%20Screening/Screening%20Result/recommendation_moderate.dart';
import 'package:healthyin/screens/Self%20Screening/Screening%20Result/recommendation_severe.dart';

class SeventhPageScreening extends StatefulWidget {
  const SeventhPageScreening({super.key});

  @override
  State<SeventhPageScreening> createState() => _SeventhPageScreeningState();
}

class _SeventhPageScreeningState extends State<SeventhPageScreening> {
  //catch argument from previous screen
  var data = Get.arguments;

  //question 9
  var question9 =
      "9. Apakah anda mengalami gejala berikut dalam 14 hari terakhir?";

  //answer choosed
  var answerChoosed = {};

  //for scoring logic
  int tempScore = 0;
  int seventhPageScore = 0;
  int finalScore = 0;

  bool isChecked1 = false;
  bool isChecked2 = false;
  bool isChecked3 = false;
  bool isChecked4 = false;
  bool isChecked5 = false;
  bool isChecked6 = false;
  bool isChecked7 = false;
  bool isChecked8 = false;
  List<bool> symptomps = [];

  //for storing data to the database
  CollectionReference screeningHistory =
      FirebaseFirestore.instance.collection('self_screening_history');

  // ignore: prefer_typing_uninitialized_variables
  var idSkrining;

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
              child: Text(question9,
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
          // ignore: sized_box_for_whitespace
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
                      'Sakit perut',
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
                            "Sakit perut";
                      } else {
                        answerChoosed.removeWhere(
                            (key, value) => value == "Sakit perut");
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
                      'Muntah',
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
                            "Muntah";
                      } else {
                        answerChoosed
                            .removeWhere((key, value) => value == "Muntah");
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
                      'Diare',
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
                            "Diare";
                      } else {
                        answerChoosed
                            .removeWhere((key, value) => value == "Diare");
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
                      'Nyeri dada atau tekanan',
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
                            "Nyeri dada atau tekanan";
                      } else {
                        answerChoosed.removeWhere(
                            (key, value) => value == "Nyeri dada atau tekanan");
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
                      'Nyeri otot',
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
                            "Nyeri otot";
                      } else {
                        answerChoosed
                            .removeWhere((key, value) => value == "Nyeri otot");
                      }
                    },
                  )),
              //Option 6
              Container(
                  padding: const EdgeInsets.all(4),
                  margin: const EdgeInsets.only(left: 20, right: 20, bottom: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: const Color.fromARGB(1000, 241, 241, 241),
                  ),
                  child: CheckboxListTile(
                    title: Text(
                      'Kehilangan indra perasa dan pembau',
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
                    value: isChecked6,
                    onChanged: (value) {
                      setState(() => isChecked6 = value!);

                      if (isChecked6 == true) {
                        answerChoosed[(answerChoosed.length + 1).toString()] =
                            "Kehilangan indra perasa dan pembau";
                      } else {
                        answerChoosed.removeWhere((key, value) =>
                            value == "Kehilangan indra perasa dan pembau");
                      }
                    },
                  )),
              //Option 7
              Container(
                  padding: const EdgeInsets.all(4),
                  margin: const EdgeInsets.only(left: 20, right: 20, bottom: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: const Color.fromARGB(1000, 241, 241, 241),
                  ),
                  child: CheckboxListTile(
                    title: Text(
                      'Ruam pada kulit atau perubahan warna pada jari tangan atau kaki',
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
                    value: isChecked7,
                    onChanged: (value) {
                      setState(() => isChecked7 = value!);

                      if (isChecked7 == true) {
                        answerChoosed[(answerChoosed.length + 1).toString()] =
                            "Ruam pada kulit atau perubahan warna pada jari tangan atau kaki";
                      } else {
                        answerChoosed.removeWhere((key, value) =>
                            value ==
                            "Ruam pada kulit atau perubahan warna pada jari tangan atau kaki");
                      }
                    },
                  )),
              //Option 8
              Container(
                  padding: const EdgeInsets.all(4),
                  margin: const EdgeInsets.only(left: 20, right: 20, bottom: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: const Color.fromARGB(1000, 241, 241, 241),
                  ),
                  child: CheckboxListTile(
                    title: Text(
                      'Kehilangan kemampuan untuk berbicara dan bergerak',
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
                    value: isChecked8,
                    onChanged: (value) {
                      setState(() => isChecked8 = value!);

                      if (isChecked8 == true) {
                        answerChoosed[(answerChoosed.length + 1).toString()] =
                            "Kehilangan kemampuan untuk berbicara dan bergerak";
                      } else {
                        answerChoosed.removeWhere((key, value) =>
                            value ==
                            "Kehilangan kemampuan untuk berbicara dan bergerak");
                      }
                    },
                  ))
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
              //Button Selesai
              Container(
                width: 152,
                height: 40,
                child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: const Color.fromARGB(1000, 4, 167, 119),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                    onPressed: () async {
                      showDialog(
                          context: context,
                          builder: ((context) => AlertDialog(
                                title: Text('Warning',
                                    style: GoogleFonts.lato(
                                        textStyle: const TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 0.5,
                                            color: Color.fromARGB(
                                                1000, 134, 22, 87),
                                            height: 1.4))),
                                content: Text(
                                    'Anda telah sampai pada pertanyaan akhir skrining mandiri COVID-19. Dengan menekan tombol OK, Anda menyetujui bahwa data yang Anda masukkan sudah benar.',
                                    style: GoogleFonts.lato(
                                        textStyle: const TextStyle(
                                            fontSize: 16,
                                            letterSpacing: 0.5,
                                            color: Colors.black,
                                            height: 1.4))),
                                actions: [
                                  TextButton(
                                      onPressed: () async {
                                        symptomps = [
                                          isChecked1,
                                          isChecked2,
                                          isChecked3,
                                          isChecked4,
                                          isChecked5,
                                          isChecked6,
                                          isChecked7,
                                          isChecked8
                                        ];

                                        tempScore = symptomps
                                            .where((element) => element == true)
                                            .toList()
                                            .length;

                                        if (tempScore != 0) {
                                          seventhPageScore = tempScore * 2;
                                        } else {
                                          seventhPageScore = 0;
                                        }

                                        data['seventh_page'] = {
                                          'question': question9,
                                          'answer': answerChoosed,
                                          'score': seventhPageScore
                                        };

                                        finalScore = data['second_page']
                                                ['score'] +
                                            data['third_page']['score'] +
                                            data['fourth_page']['score'] +
                                            data['fifth_page']['score'] +
                                            data['sixth_page']['score'] +
                                            data['seventh_page']['score'];

                                        //for determining risk level
                                        if (finalScore < 5) {
                                          data['screening_result'] =
                                              'Risiko ringan';
                                        } else if (finalScore >= 5 &&
                                            finalScore <= 7) {
                                          data['screening_result'] =
                                              'Risiko sedang';
                                        } else if (finalScore > 7) {
                                          data['screening_result'] =
                                              'Risiko berat';
                                        }

                                        //save data to Firestore
                                        await screeningHistory.add({
                                          'done_at': DateTime.now(),
                                          'identity': data['identity'],
                                          'second_page': data['second_page'],
                                          'third_page': data['third_page'],
                                          'fourth_page': data['fourth_page'],
                                          'fifth_page': data['fifth_page'],
                                          'sixth_page': data['sixth_page'],
                                          'seventh_page': data['seventh_page'],
                                          'score': finalScore,
                                          'screening_result':
                                              data['screening_result'],
                                        }).then((value) {
                                          setState(() {
                                            idSkrining = value;
                                          });
                                        });

                                        //reference for displaying screening history and consultation history
                                        data['id_skrining'] = idSkrining;

                                        if (finalScore < 5) {
                                          Get.offAll(
                                              () => const MildRecommendation(),
                                              arguments: data);
                                        } else if (finalScore >= 5 &&
                                            finalScore <= 7) {
                                          Get.offAll(
                                              () =>
                                                  const ModerateRecommendation(),
                                              arguments: data);
                                        } else if (finalScore > 7) {
                                          Get.offAll(
                                              () =>
                                                  const SevereRecommendation(),
                                              arguments: data);
                                        }
                                      },
                                      child: Text('OK',
                                          style: GoogleFonts.lato(
                                              textStyle: const TextStyle(
                                                  letterSpacing: 0.5,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                  height: 1.4)))),
                                  TextButton(
                                      onPressed: () {
                                        Get.back();
                                      },
                                      child: Text('Batal',
                                          style: GoogleFonts.lato(
                                              textStyle: const TextStyle(
                                                  letterSpacing: 0.5,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                  height: 1.4))))
                                ],
                              )));
                    },
                    child: Text(
                      'Selesai',
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

/*
More improvement:
- How to make code less repetition?
 */

