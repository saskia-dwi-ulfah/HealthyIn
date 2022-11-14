// ignore_for_file: sized_box_for_whitespace, must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthyin/controller/auth_controller.dart';
import 'package:healthyin/screens/Hospital%20Page/hospital_list_page.dart';
import 'package:healthyin/screens/Self%20Screening/screening_1.dart';

class HealthyInMainPage extends StatelessWidget {
  String email;
  HealthyInMainPage({Key? key, required this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: h,
        width: w,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/home_page_x2.png'),
              fit: BoxFit.cover),
        ),
        child: Column(children: [
          SizedBox(height: 0.20 * h),
          //'Selamat Datang' Text
          Container(
            width: w,
            height: 24,
            margin: const EdgeInsets.only(left: 20, right: 20),
            child: Text("Selamat Datang,",
                textAlign: TextAlign.start,
                style: GoogleFonts.lato(
                    textStyle: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.5,
                        color: Color.fromARGB(1000, 255, 255, 255),
                        height: 1.4))),
          ),
          //Profile Name text
          Container(
            width: w,
            height: 40,
            margin: const EdgeInsets.only(left: 20, right: 20),
            child: Text("Capbatu Kesehatan",
                textAlign: TextAlign.start,
                style: GoogleFonts.lato(
                    textStyle: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 0.5,
                        color: Color.fromARGB(1000, 255, 255, 255),
                        height: 1.5))),
          ),
          //Space between
          SizedBox(height: 0.12 * h),
          //'Menu Utama' Text
          Container(
            width: w,
            height: 40,
            margin: const EdgeInsets.only(left: 20, right: 20),
            child: Text("Menu Utama",
                textAlign: TextAlign.start,
                style: GoogleFonts.lato(
                    textStyle: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 0.5,
                        color: Color.fromARGB(1000, 18, 18, 18),
                        height: 1.5))),
          ),
          //Spacing Between
          SizedBox(height: 0.016 * h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //Card Skrining
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24)),
                elevation: 0,
                color: const Color.fromARGB(1000, 241, 241, 241),
                child: SizedBox(
                  width: 165,
                  height: 165,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        //Skrining Icon
                        const Align(
                          alignment: Alignment.topLeft,
                          child: CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/icons/screening_avatar.png'),
                            backgroundColor:
                                Color.fromARGB(1000, 255, 255, 255),
                            radius: 16,
                          ),
                        ),
                        //Spacing Between
                        SizedBox(height: 0.012 * h),
                        //Card Title
                        SizedBox(
                          child: Text(
                            "Skrining Mandiri COVID-19",
                            style: GoogleFonts.lato(
                              color: const Color.fromARGB(1000, 18, 18, 18),
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              height: 1.4,
                            ),
                          ),
                        ),
                        //Spacing Between
                        SizedBox(height: 0.022 * h),
                        //Button
                        Container(
                          width: 130,
                          height: 30,
                          child: TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(1000, 4, 167, 119),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)),
                              ),
                              onPressed: () {
                                Get.to(() => const FirstPageScreening(),
                                    arguments: email);
                              },
                              child: Text(
                                'Mulai',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.lato(
                                  textStyle: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600),
                                ),
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              //Card List Rumah Sakit
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24)),
                elevation: 0,
                color: const Color.fromARGB(1000, 241, 241, 241),
                child: SizedBox(
                  width: 165,
                  height: 165,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        //Skrining Icon
                        const Align(
                          alignment: Alignment.topLeft,
                          child: CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/icons/rs_avatar.png'),
                            backgroundColor:
                                Color.fromARGB(1000, 255, 255, 255),
                            radius: 16,
                          ),
                        ),
                        //Spacing Between
                        SizedBox(height: 0.012 * h),
                        //Card Title
                        SizedBox(
                          width: 128,
                          child: Text(
                            "Rumah Sakit Rujukan COVID-19",
                            style: GoogleFonts.lato(
                              color: const Color.fromARGB(1000, 18, 18, 18),
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              height: 1.4,
                            ),
                          ),
                        ),
                        //Spacing Between
                        SizedBox(height: 0.022 * h),
                        //Button
                        Container(
                          width: 130,
                          height: 30,
                          child: TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(1000, 4, 167, 119),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)),
                              ),
                              onPressed: () {
                                Get.to(() => const HospitalListPage(),
                                    arguments: email);
                              },
                              child: Text(
                                'Cari',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.lato(
                                  textStyle: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600),
                                ),
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          //Spacing Between
          SizedBox(height: 0.008 * h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //Card Konsultasi Dokter
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24)),
                elevation: 0,
                color: const Color.fromARGB(1000, 241, 241, 241),
                child: SizedBox(
                  width: 165,
                  height: 165,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        //Skrining Icon
                        const Align(
                          alignment: Alignment.topLeft,
                          child: CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/icons/doctor_avatar.png'),
                            backgroundColor:
                                Color.fromARGB(1000, 255, 255, 255),
                            radius: 16,
                          ),
                        ),
                        //Spacing Between
                        SizedBox(height: 0.012 * h),
                        //Card Title
                        SizedBox(
                          child: Text(
                            "Chat Konsultasi Dokter",
                            style: GoogleFonts.lato(
                              color: const Color.fromARGB(1000, 18, 18, 18),
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              height: 1.4,
                            ),
                          ),
                        ),
                        //Spacing Between
                        SizedBox(height: 0.022 * h),
                        //Button
                        Container(
                          width: 130,
                          height: 30,
                          child: TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(1000, 4, 167, 119),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)),
                              ),
                              onPressed: () {},
                              child: Text(
                                'Chat',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.lato(
                                  textStyle: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600),
                                ),
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              //Card Artikel Kesehatan
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24)),
                elevation: 0,
                color: const Color.fromARGB(1000, 241, 241, 241),
                child: SizedBox(
                  width: 165,
                  height: 165,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        //Skrining Icon
                        const Align(
                          alignment: Alignment.topLeft,
                          child: CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/icons/article_avatar.png'),
                            backgroundColor:
                                Color.fromARGB(1000, 255, 255, 255),
                            radius: 16,
                          ),
                        ),
                        //Spacing Between
                        SizedBox(height: 0.012 * h),
                        //Card Title
                        SizedBox(
                          width: 128,
                          child: Text(
                            "Berita/Artikel Kesehatan",
                            style: GoogleFonts.lato(
                              color: const Color.fromARGB(1000, 18, 18, 18),
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              height: 1.4,
                            ),
                          ),
                        ),
                        //Spacing Between
                        SizedBox(height: 0.022 * h),
                        //Button
                        Container(
                          width: 130,
                          height: 30,
                          child: TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(1000, 4, 167, 119),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)),
                              ),
                              onPressed: () {},
                              child: Text(
                                'Baca',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.lato(
                                  textStyle: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600),
                                ),
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ]),
      ),
    );

    /*return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Container(width: w, height: 0.3 * h),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: w,
              margin: const EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Welcome",
                      style: GoogleFonts.lato(
                          textStyle: const TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                              color: Colors.black54))),
                  Text(email,
                      style: GoogleFonts.lato(
                          textStyle: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black54)))
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {
                Get.to(() => const FirstPageScreening(), arguments: email);
              },
              child: Container(
                  width: w * 0.5,
                  height: h * 0.08,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: const Color.fromARGB(1000, 134, 22, 87)),
                  child: const Center(
                    child: Text("Skrining Mandiri",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                  )),
            ),
            const SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {
                Get.to(() => const HospitalListPage(), arguments: email);
              },
              child: Container(
                  width: w * 0.5,
                  height: h * 0.08,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: const Color.fromARGB(1000, 134, 22, 87)),
                  child: const Center(
                    child: Text("Daftar Rumah Sakit",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                  )),
            ),
            const SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {
                AuthController.instance.logout();
              },
              child: Container(
                width: w * 0.5,
                height: h * 0.08,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: const Color.fromARGB(1000, 134, 22, 87)),
                child: const Center(
                  child: Text("Sign out",
                      style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                ),
              ),
            ),
          ],
        ));*/
  }
}
