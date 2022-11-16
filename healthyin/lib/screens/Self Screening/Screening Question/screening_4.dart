// ignore_for_file: sized_box_for_whitespace, avoid_print

/*
Pertanyaan suhu tubuh >38 derajat 
*/
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthyin/screens/Self%20Screening/Screening%20Question/screening_5.dart';

class FourthPageScreening extends StatefulWidget {
  const FourthPageScreening({super.key});

  @override
  State<FourthPageScreening> createState() => _FourthPageScreeningState();
}

class _FourthPageScreeningState extends State<FourthPageScreening> {
  //catch argument from previous screen
  var data = Get.arguments;

  //question 6
  var question6 =
      "6. Apakah Anda memiliki riwayat suhu tubuh lebih dari 38°C dalam 14 hari terakhir?";

  //answer choosed
  String answer6 = "";

  //for scoring logic
  int fourthPageScore = 0;

  int valueChecked = 0;

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
              child: Text(question6,
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
                  child: RadioListTile(
                    title: Text(
                      'Ya',
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
                    value: 1,
                    groupValue: valueChecked,
                    onChanged: (value) {
                      setState(() => valueChecked = value!);
                      print(valueChecked);
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
                  child: RadioListTile(
                    title: Text(
                      'Tidak',
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
                    value: 2,
                    groupValue: valueChecked,
                    onChanged: (value) {
                      setState(() => valueChecked = value!);
                      print(valueChecked);
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
                      if (valueChecked == 1) {
                        fourthPageScore = 2;
                        answer6 = "Ya";
                      } else {
                        fourthPageScore = 0;
                        answer6 = "Tidak";
                      }
                      data['fourth_page'] = {
                        'question': question6,
                        'answer': answer6,
                        'score': fourthPageScore
                      };

                      Get.to(() => const FifthPageScreening(), arguments: data);
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
