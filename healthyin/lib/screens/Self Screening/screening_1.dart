// ignore_for_file: sized_box_for_whitespace, prefer_const_literals_to_create_immutables

/*
Nama, usia, jenis kelamin
*/
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthyin/controller/auth_controller.dart';
import 'package:healthyin/screens/Main%20Page/healthyin_main_page.dart';
import 'package:healthyin/screens/Self%20Screening/screening_2.dart';

class FirstPageScreening extends StatefulWidget {
  const FirstPageScreening({super.key});

  @override
  State<FirstPageScreening> createState() => _FirstPageScreeningState();
}

class _FirstPageScreeningState extends State<FirstPageScreening> {
  //for storing data from corresponding page
  var allData = {};

  //controller for name and age fields
  var nameController = TextEditingController();
  var ageController = TextEditingController();

  // value for storing selected gender by user
  String selectedGender = "Pria";

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
          //Spacing between (question and answer box) and 'Self Screening COVID-19' text
          SizedBox(height: 0.18 * h),
          Container(
              width: w,
              height: 90 + 0.024 * h + 0.35 * h,
              margin: const EdgeInsets.only(left: 20, right: 20, bottom: 8),
              child: Column(
                children: [
                  // "1. Nama lengkap"
                  Container(
                    height: 30,
                    width: w,
                    child: Text("1. Nama lengkap",
                        style: GoogleFonts.lato(
                            textStyle: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Color.fromARGB(1000, 18, 18, 18),
                                height: 1.4))),
                  ),
                  const SizedBox(height: 5),
                  // Input for "Nama lengkap"
                  Container(
                    height: 55,
                    width: w,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(1000, 241, 241, 241),
                        borderRadius: BorderRadius.circular(12)),
                    child: TextField(
                      controller: nameController,
                      decoration: InputDecoration(
                          hintText: "contoh: Joko Widodo",
                          hintStyle: GoogleFonts.lato(
                              fontSize: 16, color: Colors.grey[500]),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(
                                  color: Color.fromARGB(1000, 18, 18, 18),
                                  width: 1.5)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(
                                  color: Colors.white, width: 1.0)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12))),
                    ),
                  ),
                  const SizedBox(height: 10),
                  // "2. Jenis kelamin"
                  Container(
                    height: 30,
                    width: w,
                    child: Text("2. Jenis kelamin",
                        style: GoogleFonts.lato(
                            textStyle: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Color.fromARGB(1000, 18, 18, 18),
                                height: 1.4))),
                  ),
                  const SizedBox(height: 5),
                  // Dropdown for "Gender"
                  Container(
                    height: 55,
                    width: w,
                    child: DropdownButton(
                        value: selectedGender,
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedGender = newValue!;
                          });
                        },
                        items: [
                          DropdownMenuItem(
                              value: "Pria",
                              child: Text(
                                "Pria",
                                style: GoogleFonts.lato(
                                    textStyle: const TextStyle(
                                        fontSize: 16,
                                        color: Color.fromARGB(1000, 18, 18, 18),
                                        height: 1.4)),
                              )),
                          DropdownMenuItem(
                              value: "Wanita",
                              child: Text("Wanita",
                                  style: GoogleFonts.lato(
                                      textStyle: const TextStyle(
                                          fontSize: 16,
                                          color:
                                              Color.fromARGB(1000, 18, 18, 18),
                                          height: 1.4))))
                        ]),
                  ),
                  const SizedBox(height: 10),
                  // "3. Usia"
                  Container(
                    height: 30,
                    width: w,
                    child: Text("3. Usia",
                        style: GoogleFonts.lato(
                            textStyle: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Color.fromARGB(1000, 18, 18, 18),
                                height: 1.4))),
                  ),
                  const SizedBox(height: 5),
                  // Input for "Usia"
                  Container(
                    height: 55,
                    width: w,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(1000, 241, 241, 241),
                        borderRadius: BorderRadius.circular(12)),
                    child: TextField(
                      controller: ageController,
                      decoration: InputDecoration(
                          hintText: "contoh: 61",
                          hintStyle: GoogleFonts.lato(
                              fontSize: 16, color: Colors.grey[500]),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(
                                  color: Color.fromARGB(1000, 18, 18, 18),
                                  width: 1.5)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(
                                  color: Colors.white, width: 1.0)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12))),
                    ),
                  )
                ],
              )),
          SizedBox(height: 0.032 * h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //Button Keluar
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
                      'Keluar',
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
                      allData['identity'] = {
                        'email': Get.arguments,
                        'nama': nameController.text.trim(),
                        'gender': selectedGender,
                        'usia': int.parse(ageController.text.trim())
                      };

                      Get.to(() => const SecondPageScreening(),
                          arguments: allData);
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
