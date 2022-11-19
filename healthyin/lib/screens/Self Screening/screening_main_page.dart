// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthyin/widget/screening_history_card.dart';
import 'package:healthyin/controller/auth_controller.dart';
import 'package:healthyin/screens/Main%20Page/healthyin_main_page.dart';
import 'package:healthyin/screens/Self%20Screening/Screening%20Question/screening_1.dart';

class ScreeningMainPage extends StatefulWidget {
  const ScreeningMainPage({super.key});

  @override
  State<ScreeningMainPage> createState() => _ScreeningMainPageState();
}

class _ScreeningMainPageState extends State<ScreeningMainPage> {
  @override
  void initState() {
    super.initState();
    getScreeningResult();
  }

  List _allResults = [];

  getScreeningResult() async {
    var data = await FirebaseFirestore.instance
        .collection('self_screening_history')
        .where("identity.authenticated_user_id",
            isEqualTo: AuthController().auth.currentUser!.uid)
        .get();

    setState(() {
      _allResults = data.docs;
    });

    print(_allResults.length);
  }

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
          SizedBox(height: 0.05 * h),
          GestureDetector(
              onTap: () {
                Get.offAll(() => HealthyInMainPage(
                    email: AuthController().auth.currentUser!.email!));
              },
              child: Row(children: [
                const BackButton(color: Color.fromARGB(1000, 255, 255, 255)),
                Text("Beranda",
                    style: GoogleFonts.lato(
                        fontSize: 14,
                        height: 1,
                        color: const Color.fromARGB(1000, 255, 255, 255)))
              ])),
          SizedBox(height: 0.01 * h),
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
          Container(
              width: w,
              height: 40,
              margin: const EdgeInsets.only(left: 20, right: 20)),
          const SizedBox(height: 30),
          Container(
            height: 55,
            width: w * 0.85,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.grey, blurRadius: 3, offset: Offset(0, 0.5))
                ]),
            child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: const Color.fromARGB(1000, 4, 167, 119),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: ((context) => AlertDialog(
                            title: Text('Disclaimer',
                                style: GoogleFonts.lato(
                                    textStyle: const TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 0.5,
                                        color:
                                            Color.fromARGB(1000, 134, 22, 87),
                                        height: 1.4))),
                            content: Text(
                                'Fitur Skrining Mandiri COVID-19 ini tidak dapat dijadikan sebagai satu-satunya petunjuk indikasi medis tertentu. Dengan menekan tombol OK kamu menyetujui untuk menyelesaikan skrining sampai terakhir.',
                                style: GoogleFonts.lato(
                                    textStyle: const TextStyle(
                                        fontSize: 16,
                                        letterSpacing: 0.5,
                                        color: Colors.black,
                                        height: 1.4))),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Get.to(() => const FirstPageScreening());
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
                  'Mulai Skrining Mandiri COVID-19',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lato(
                    textStyle:
                        const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                )),
          ),
          const SizedBox(height: 20),
          Container(
              width: w,
              height: 40,
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: Text("Riwayat Self Screening COVID-19",
                  textAlign: TextAlign.start,
                  style: GoogleFonts.lato(
                      textStyle: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.5,
                          color: Color.fromARGB(1000, 18, 18, 18),
                          height: 1.5)))),
          Expanded(
              child: ListView.builder(
            itemCount: _allResults.length,
            itemBuilder: (BuildContext context, int index) =>
                buildScreeningHistoryCard(context, _allResults[index]),
          ))
        ]),
      ),
    );
  }
}
