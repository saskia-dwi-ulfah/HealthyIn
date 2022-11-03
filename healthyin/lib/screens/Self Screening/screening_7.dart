/*
Pertanyaan gejala 14 hari terakhir, layer 3
*/
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthyin/screens/Screening%20Result/recommendation_mild.dart';
import 'package:healthyin/screens/Screening%20Result/recommendation_moderate.dart';
import 'package:healthyin/screens/Screening%20Result/recommendation_severe.dart';
import 'dart:convert' show json;

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
  Set<String> answerChoosed = {};

  //for scoring logic
  int tempScore = 0;
  int seventhPageScore = 0;
  int final_score = 0;

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
          //Spacing between (question and options) and 'Self Screening COVID-19' text
          SizedBox(height: 0.18 * h),
          /*All questions start here*/
          Container(
              height: 90,
              width: w,
              alignment: Alignment.topCenter,
              margin: EdgeInsets.only(left: 20, right: 20),
              child: Text(question9,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lato(
                      textStyle: TextStyle(
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
                  padding: EdgeInsets.all(4),
                  margin: EdgeInsets.only(left: 20, right: 20, bottom: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Color.fromARGB(1000, 241, 241, 241),
                  ),
                  child: CheckboxListTile(
                    title: Text(
                      'Sakit perut',
                      style: GoogleFonts.lato(
                        textStyle: TextStyle(
                            color: Color.fromARGB(1000, 18, 18, 18),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            height: 1.4),
                      ),
                    ),
                    activeColor: Color.fromARGB(1000, 134, 22, 87),
                    controlAffinity: ListTileControlAffinity.leading,
                    value: isChecked1,
                    onChanged: (value) {
                      setState(() => isChecked1 = value!);

                      if (isChecked1 == true) {
                        answerChoosed.add("Sakit perut");
                      } else {
                        answerChoosed.remove("Sakit perut");
                      }
                    },
                  )),
              //Option 2
              Container(
                  padding: EdgeInsets.all(4),
                  margin: EdgeInsets.only(left: 20, right: 20, bottom: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Color.fromARGB(1000, 241, 241, 241),
                  ),
                  child: CheckboxListTile(
                    title: Text(
                      'Muntah',
                      style: GoogleFonts.lato(
                        textStyle: TextStyle(
                            color: Color.fromARGB(1000, 18, 18, 18),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            height: 1.4),
                      ),
                    ),
                    activeColor: Color.fromARGB(1000, 134, 22, 87),
                    controlAffinity: ListTileControlAffinity.leading,
                    value: isChecked2,
                    onChanged: (value) {
                      setState(() => isChecked2 = value!);

                      if (isChecked2 == true) {
                        answerChoosed.add("Muntah");
                      } else {
                        answerChoosed.remove("Muntah");
                      }
                    },
                  )),
              //Option 3
              Container(
                  padding: EdgeInsets.all(4),
                  margin: EdgeInsets.only(left: 20, right: 20, bottom: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Color.fromARGB(1000, 241, 241, 241),
                  ),
                  child: CheckboxListTile(
                    title: Text(
                      'Diare',
                      style: GoogleFonts.lato(
                        textStyle: TextStyle(
                            color: Color.fromARGB(1000, 18, 18, 18),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            height: 1.4),
                      ),
                    ),
                    activeColor: Color.fromARGB(1000, 134, 22, 87),
                    controlAffinity: ListTileControlAffinity.leading,
                    value: isChecked3,
                    onChanged: (value) {
                      setState(() => isChecked3 = value!);

                      if (isChecked3 == true) {
                        answerChoosed.add("Diare");
                      } else {
                        answerChoosed.remove("Diare");
                      }
                    },
                  )),
              //Option 4
              Container(
                  padding: EdgeInsets.all(4),
                  margin: EdgeInsets.only(left: 20, right: 20, bottom: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Color.fromARGB(1000, 241, 241, 241),
                  ),
                  child: CheckboxListTile(
                    title: Text(
                      'Nyeri dada atau tekanan',
                      style: GoogleFonts.lato(
                        textStyle: TextStyle(
                            color: Color.fromARGB(1000, 18, 18, 18),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            height: 1.4),
                      ),
                    ),
                    activeColor: Color.fromARGB(1000, 134, 22, 87),
                    controlAffinity: ListTileControlAffinity.leading,
                    value: isChecked4,
                    onChanged: (value) {
                      setState(() => isChecked4 = value!);

                      if (isChecked4 == true) {
                        answerChoosed.add("Nyeri dada atau tekanan");
                      } else {
                        answerChoosed.remove("Nyeri dada atau tekanan");
                      }
                    },
                  )),
              //Option 5
              Container(
                  padding: EdgeInsets.all(4),
                  margin: EdgeInsets.only(left: 20, right: 20, bottom: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Color.fromARGB(1000, 241, 241, 241),
                  ),
                  child: CheckboxListTile(
                    title: Text(
                      'Nyeri otot',
                      style: GoogleFonts.lato(
                        textStyle: TextStyle(
                            color: Color.fromARGB(1000, 18, 18, 18),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            height: 1.4),
                      ),
                    ),
                    activeColor: Color.fromARGB(1000, 134, 22, 87),
                    controlAffinity: ListTileControlAffinity.leading,
                    value: isChecked5,
                    onChanged: (value) {
                      setState(() => isChecked5 = value!);

                      if (isChecked5 == true) {
                        answerChoosed.add("Nyeri otot");
                      } else {
                        answerChoosed.remove("Nyeri otot");
                      }
                    },
                  )),
              //Option 6
              Container(
                  padding: EdgeInsets.all(4),
                  margin: EdgeInsets.only(left: 20, right: 20, bottom: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Color.fromARGB(1000, 241, 241, 241),
                  ),
                  child: CheckboxListTile(
                    title: Text(
                      'Kehilangan indra perasa dan pembau',
                      style: GoogleFonts.lato(
                        textStyle: TextStyle(
                            color: Color.fromARGB(1000, 18, 18, 18),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            height: 1.4),
                      ),
                    ),
                    activeColor: Color.fromARGB(1000, 134, 22, 87),
                    controlAffinity: ListTileControlAffinity.leading,
                    value: isChecked6,
                    onChanged: (value) {
                      setState(() => isChecked6 = value!);

                      if (isChecked6 == true) {
                        answerChoosed.add("Kehilangan indra perasa dan pembau");
                      } else {
                        answerChoosed
                            .remove("Kehilangan indra perasa dan pembau");
                      }
                    },
                  )),
              //Option 7
              Container(
                  padding: EdgeInsets.all(4),
                  margin: EdgeInsets.only(left: 20, right: 20, bottom: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Color.fromARGB(1000, 241, 241, 241),
                  ),
                  child: CheckboxListTile(
                    title: Text(
                      'Ruam pada kulit atau perubahan warna pada jari tangan atau kaki',
                      style: GoogleFonts.lato(
                        textStyle: TextStyle(
                            color: Color.fromARGB(1000, 18, 18, 18),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            height: 1.4),
                      ),
                    ),
                    activeColor: Color.fromARGB(1000, 134, 22, 87),
                    controlAffinity: ListTileControlAffinity.leading,
                    value: isChecked7,
                    onChanged: (value) {
                      setState(() => isChecked7 = value!);

                      if (isChecked7 == true) {
                        answerChoosed.add(
                            "Ruam pada kulit atau perubahan warna pada jari tangan atau kaki");
                      } else {
                        answerChoosed.remove(
                            "Ruam pada kulit atau perubahan warna pada jari tangan atau kaki");
                      }
                    },
                  )),
              //Option 8
              Container(
                  padding: EdgeInsets.all(4),
                  margin: EdgeInsets.only(left: 20, right: 20, bottom: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Color.fromARGB(1000, 241, 241, 241),
                  ),
                  child: CheckboxListTile(
                    title: Text(
                      'Kehilangan kemampuan untuk berbicara dan bergerak',
                      style: GoogleFonts.lato(
                        textStyle: TextStyle(
                            color: Color.fromARGB(1000, 18, 18, 18),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            height: 1.4),
                      ),
                    ),
                    activeColor: Color.fromARGB(1000, 134, 22, 87),
                    controlAffinity: ListTileControlAffinity.leading,
                    value: isChecked8,
                    onChanged: (value) {
                      setState(() => isChecked8 = value!);

                      if (isChecked8 == true) {
                        answerChoosed.add(
                            "Kehilangan kemampuan untuk berbicara dan bergerak");
                      } else {
                        answerChoosed.remove(
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
                      side: BorderSide(
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

                      print(json.encode(data));

                      //save data to Firestore
                      /* await screeningHistory
                          .add(
                              /*'email': data['identity']['email'].toString(),
                        'nama': data['identity']['nama'].toString(),
                        'gender': data['identity']['gender'].toString(),
                        'usia': data['identity']['usia'],
                        'second_page_question':
                            data['second_page']['question'].toString(),
                        'second_page_answer': data['second_page']['answer'],
                        'second_page_score': data['second_page']['score'],
                        'third_page_question':
                            data['third_page']['question'].toString(),
                        'third_page_answer': data['third_page']['answer'],
                        'third_page_score': data['third_page']['score'],
                        'fourth_page_question':
                            data['fourth_page']['question'].toString(),
                        'fourth_page_answer': data['fourth_page']['answer'],
                        'fourth_page_score': data['fourth_page']['score'],
                        'fifth_page_question':
                            data['fifth_page']['question'].toString(),
                        'fifth_page_answer': data['fifth_page']['answer'],
                        'fifth_page_score': data['fifth_page']['score'],
                        'sixth_page_question':
                            data['sixth_page']['question'].toString(),
                        'sixth_page_answer': data['sixth_page']['answer'],
                        'sixth_page_score': data['sixth_page']['score'],
                        'seventh_page_question':
                            data['seventh_page']['question'].toString(),
                        'seventh_page_answer': data['seventh_page']['answer'],
                        'seventh_page_score': data['seventh_page']['score']*/
                              Map<String, dynamic>.from(data))
                          .then(
                              (value) => print('Data successfully submitted'));*/

                      /* final_score = data['second_page']['score'] +
                          data['third_page']['score'] +
                          data['fourth_page']['score'] +
                          data['fifth_page']['score'] +
                          data['sixth_page']['score'] +
                          data['seventh_page']['score'];

                      if (final_score < 5) {
                        Get.to(() => MildRecommendation());
                      } else if (final_score >= 5 && final_score <= 7) {
                        Get.to(() => ModerateRecommendation());
                      } else if (final_score > 7) {
                        Get.to(() => SevereRecommendation());
                      }*/
                    },
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
