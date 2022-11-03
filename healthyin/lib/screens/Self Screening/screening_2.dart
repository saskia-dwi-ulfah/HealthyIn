/*
Pertanyaan kontak dengan pasien COVID-19 14 hari terakhir
*/
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthyin/screens/Self%20Screening/screening_3.dart';

class SecondPageScreening extends StatefulWidget {
  const SecondPageScreening({super.key});

  @override
  State<SecondPageScreening> createState() => _SecondPageScreeningState();
}

class _SecondPageScreeningState extends State<SecondPageScreening> {
  //for storing score from corresponding page
  var data = Get.arguments;

  //question 4
  String question4 =
      "4. Apakah Anda pernah kontak dengan pasien positif COVID-19 atau berada satu ruangan yang sama atau kontak dalam 1 meter pada 14 hari terakhir? ";

//answer choosed
  String answer4 = "";

  //for scoring logic
  int secondPageScore = 0;

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
              child: Text(question4,
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
                  child: RadioListTile(
                    title: Text(
                      'Ya',
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
                    value: 1,
                    groupValue: valueChecked,
                    onChanged: (value) {
                      setState(() => valueChecked = value!);
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
                  child: RadioListTile(
                    title: Text(
                      'Tidak',
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
                    value: 2,
                    groupValue: valueChecked,
                    onChanged: (value) {
                      setState(() => valueChecked = value!);
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
                    onPressed: () {
                      if (valueChecked == 1) {
                        secondPageScore = 1;
                        answer4 = "Ya";
                      } else {
                        secondPageScore = 0;
                        answer4 = "Tidak";
                      }

                      data['second_page'] = {
                        'question': question4,
                        'answer': answer4,
                        'score': secondPageScore
                      };

                      Get.to(() => ThirdPageScreening(), arguments: data);
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
