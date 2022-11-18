// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthyin/model/self_screening_result_model.dart';
import 'package:healthyin/screens/Hospital%20Page/hospital_list_page.dart';

class ScreeningHistoryDetail extends StatefulWidget {
  final ScreeningResultModel screeningResult;
  const ScreeningHistoryDetail({super.key, required this.screeningResult});

  @override
  State<ScreeningHistoryDetail> createState() => _ScreeningHistoryDetailState();
}

class _ScreeningHistoryDetailState extends State<ScreeningHistoryDetail> {
  var consultationHistorySnapshot;

  /*@override
  void initState() {
    super.initState();
    getConsultationHistory(widget.screeningResult.id_skrining);
  }*/

//consultation history id and self screening id is the same.
  getConsultationHistory(var screeningID) async {
    await FirebaseFirestore.instance
        .collection('consultation_history')
        .doc(screeningID)
        .get()
        .then((data) => {consultationHistorySnapshot = data.data()});
  }

  Widget buildAnswer(dynamic answer) {
    if (answer.length == 0) {
      return Text("Tidak ada",
          textAlign: TextAlign.left,
          style: GoogleFonts.lato(
              textStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(1000, 18, 18, 18),
                  height: 1.5)));
    } else {
      var symptoms = answer
          .toString()
          .substring(1, answer.toString().length - 1)
          .trim()
          .split(', ');
      return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: symptoms.map((value) {
            return Text("\u2022 ${value.substring(3)}",
                textAlign: TextAlign.left,
                style: GoogleFonts.lato(
                    textStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(1000, 18, 18, 18),
                        height: 1.5)));
          }).toList());
    }
  }

  Widget buildFurtherRecommendation(var screeningResult, var screeningID) {
    double w = MediaQuery.of(context).size.width;

    if (screeningResult == 'Risiko berat' ||
        screeningResult == 'Risiko sedang') {
      return Column(children: [
        Text(
            "Anda disarankan untuk melakukan konsultasi langsung ke rumah sakit.",
            style: GoogleFonts.lato(
                textStyle: const TextStyle(
                    fontSize: 16,
                    color: Color.fromARGB(1000, 18, 18, 18),
                    height: 1.5))),
        const SizedBox(height: 10),
        GestureDetector(
          onTap: () {
            Get.to(() => const HospitalListPage());
          },
          child: Container(
            width: w,
            height: 45,
            margin: const EdgeInsets.only(left: 20, right: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: const LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: [
                      Color.fromARGB(1000, 134, 22, 87),
                      Color.fromARGB(1000, 193, 31, 126)
                    ])),
            child: Center(
              child: Text("Daftar Rumah Sakit D.I. Yogyakarta",
                  style: GoogleFonts.lato(
                      textStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      color: Colors.white)),
            ),
          ),
        )
      ]);
    } else {
      return FutureBuilder(
          future: getConsultationHistory(screeningID),
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return const Text("...");
            } else {
              if (consultationHistorySnapshot == null) {
                return Text("Belum ada.",
                    style: GoogleFonts.lato(
                        textStyle: const TextStyle(
                            fontSize: 16,
                            color: Color.fromARGB(1000, 18, 18, 18),
                            height: 1.5)));
              } else {
                return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Obat 1 ",
                          style: GoogleFonts.lato(
                              textStyle: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(1000, 134, 22, 87),
                                  height: 1.5))),
                      Text(
                          "Nama obat: ${consultationHistorySnapshot['obat_1']}",
                          style: GoogleFonts.lato(
                              textStyle: const TextStyle(
                                  fontSize: 16,
                                  color: Color.fromARGB(1000, 18, 18, 18),
                                  height: 1.5))),
                      Text(
                          "Aturan pemakaian: ${consultationHistorySnapshot['aturan_obat_1']}",
                          style: GoogleFonts.lato(
                              textStyle: const TextStyle(
                                  fontSize: 16,
                                  color: Color.fromARGB(1000, 18, 18, 18),
                                  height: 1.5))),
                      Text(
                          "Catatan: ${consultationHistorySnapshot['catatan_obat_1']}",
                          style: GoogleFonts.lato(
                              textStyle: const TextStyle(
                                  fontSize: 16,
                                  color: Color.fromARGB(1000, 18, 18, 18),
                                  height: 1.5))),
                      Text("Obat 2 ",
                          style: GoogleFonts.lato(
                              textStyle: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(1000, 134, 22, 87),
                                  height: 1.5))),
                      Text(
                          "Nama obat: ${consultationHistorySnapshot['obat_2']}",
                          style: GoogleFonts.lato(
                              textStyle: const TextStyle(
                                  fontSize: 16,
                                  color: Color.fromARGB(1000, 18, 18, 18),
                                  height: 1.5))),
                      Text(
                          "Aturan pemakaian: ${consultationHistorySnapshot['aturan_obat_2']}",
                          style: GoogleFonts.lato(
                              textStyle: const TextStyle(
                                  fontSize: 16,
                                  color: Color.fromARGB(1000, 18, 18, 18),
                                  height: 1.5))),
                      Text(
                          "Catatan: ${consultationHistorySnapshot['catatan_obat_2']}",
                          style: GoogleFonts.lato(
                              textStyle: const TextStyle(
                                  fontSize: 16,
                                  color: Color.fromARGB(1000, 18, 18, 18),
                                  height: 1.5))),
                      Text("Obat 3 ",
                          style: GoogleFonts.lato(
                              textStyle: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(1000, 134, 22, 87),
                                  height: 1.5))),
                      Text(
                          "Nama obat: ${consultationHistorySnapshot['obat_3']}",
                          style: GoogleFonts.lato(
                              textStyle: const TextStyle(
                                  fontSize: 16,
                                  color: Color.fromARGB(1000, 18, 18, 18),
                                  height: 1.5))),
                      Text(
                          "Aturan pemakaian: ${consultationHistorySnapshot['aturan_obat_3']}",
                          style: GoogleFonts.lato(
                              textStyle: const TextStyle(
                                  fontSize: 16,
                                  color: Color.fromARGB(1000, 18, 18, 18),
                                  height: 1.5))),
                      Text(
                          "Catatan: ${consultationHistorySnapshot['catatan_obat_3']}",
                          style: GoogleFonts.lato(
                              textStyle: const TextStyle(
                                  fontSize: 16,
                                  color: Color.fromARGB(1000, 18, 18, 18),
                                  height: 1.5))),
                      Text("Obat 4 ",
                          style: GoogleFonts.lato(
                              textStyle: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(1000, 134, 22, 87),
                                  height: 1.5))),
                      Text(
                          "Nama obat: ${consultationHistorySnapshot['obat_4']}",
                          style: GoogleFonts.lato(
                              textStyle: const TextStyle(
                                  fontSize: 16,
                                  color: Color.fromARGB(1000, 18, 18, 18),
                                  height: 1.5))),
                      Text(
                          "Aturan pemakaian: ${consultationHistorySnapshot['aturan_obat_4']}",
                          style: GoogleFonts.lato(
                              textStyle: const TextStyle(
                                  fontSize: 16,
                                  color: Color.fromARGB(1000, 18, 18, 18),
                                  height: 1.5))),
                      Text(
                          "Catatan: ${consultationHistorySnapshot['catatan_obat_4']}",
                          style: GoogleFonts.lato(
                              textStyle: const TextStyle(
                                  fontSize: 16,
                                  color: Color.fromARGB(1000, 18, 18, 18),
                                  height: 1.5))),
                      Text("Obat 5 ",
                          style: GoogleFonts.lato(
                              textStyle: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(1000, 134, 22, 87),
                                  height: 1.5))),
                      Text(
                          "Nama obat: ${consultationHistorySnapshot['obat_5']}",
                          style: GoogleFonts.lato(
                              textStyle: const TextStyle(
                                  fontSize: 16,
                                  color: Color.fromARGB(1000, 18, 18, 18),
                                  height: 1.5))),
                      Text(
                          "Aturan pemakaian: ${consultationHistorySnapshot['aturan_obat_5']}",
                          style: GoogleFonts.lato(
                              textStyle: const TextStyle(
                                  fontSize: 16,
                                  color: Color.fromARGB(1000, 18, 18, 18),
                                  height: 1.5))),
                      Text(
                          "Catatan: ${consultationHistorySnapshot['catatan_obat_5']}",
                          style: GoogleFonts.lato(
                              textStyle: const TextStyle(
                                  fontSize: 16,
                                  color: Color.fromARGB(1000, 18, 18, 18),
                                  height: 1.5))),
                      Text("Catatan umum ",
                          style: GoogleFonts.lato(
                              textStyle: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(1000, 134, 22, 87),
                                  height: 1.5))),
                      Text(
                          "${consultationHistorySnapshot['catatan_keseluruhan']}",
                          style: GoogleFonts.lato(
                              textStyle: const TextStyle(
                                  fontSize: 16,
                                  color: Color.fromARGB(1000, 18, 18, 18),
                                  height: 1.5))),
                    ]);
              }
            }
          });
    }
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
          child: Column(
            children: [
              SizedBox(height: 0.05 * h),
              GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Row(children: [
                    const BackButton(
                        color: Color.fromARGB(1000, 255, 255, 255)),
                    Text("Kembali",
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
                  child: Text("Detail Riwayat",
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
                  child: Text("Self Screening",
                      textAlign: TextAlign.start,
                      style: GoogleFonts.lato(
                          textStyle: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w900,
                              letterSpacing: 0.5,
                              color: Color.fromARGB(1000, 255, 255, 255),
                              height: 1.5)))),
              const SizedBox(
                height: 140,
              ),
              Container(
                  height: 0.55 * h,
                  width: w,
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.grey,
                            blurRadius: 3,
                            offset: Offset(0, 0.5))
                      ]),
                  child: SingleChildScrollView(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          "${widget.screeningResult.identity['nama']}, ${widget.screeningResult.identity['gender']}, ${widget.screeningResult.identity['usia']} tahun.",
                          textAlign: TextAlign.left,
                          style: GoogleFonts.lato(
                              textStyle: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w900,
                                  color: Color.fromARGB(1000, 134, 22, 87),
                                  height: 1.5))),
                      Text("ID Pengguna ",
                          textAlign: TextAlign.left,
                          style: GoogleFonts.lato(
                              textStyle: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Color.fromARGB(1000, 4, 167, 119),
                                  height: 1.5))),
                      Text(
                          widget.screeningResult
                              .identity['authenticated_user_id'],
                          textAlign: TextAlign.left,
                          style: GoogleFonts.lato(
                              textStyle: const TextStyle(
                                  fontSize: 16,
                                  color: Color.fromARGB(1000, 18, 18, 18),
                                  height: 1.5))),
                      const SizedBox(height: 20),
                      Text("ID Skrining ",
                          textAlign: TextAlign.left,
                          style: GoogleFonts.lato(
                              textStyle: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Color.fromARGB(1000, 4, 167, 119),
                                  height: 1.5))),
                      Text(widget.screeningResult.id_skrining,
                          textAlign: TextAlign.left,
                          style: GoogleFonts.lato(
                              textStyle: const TextStyle(
                                  fontSize: 16,
                                  color: Color.fromARGB(1000, 18, 18, 18),
                                  height: 1.5))),
                      Text("Tanggal skrining ",
                          textAlign: TextAlign.left,
                          style: GoogleFonts.lato(
                              textStyle: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Color.fromARGB(1000, 4, 167, 119),
                                  height: 1.5))),
                      Text(widget.screeningResult.done_at.toDate().toString(),
                          textAlign: TextAlign.left,
                          style: GoogleFonts.lato(
                              textStyle: const TextStyle(
                                  fontSize: 16,
                                  color: Color.fromARGB(1000, 18, 18, 18),
                                  height: 1.5))),
                      Text("Hasil skrining ",
                          textAlign: TextAlign.left,
                          style: GoogleFonts.lato(
                              textStyle: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Color.fromARGB(1000, 4, 167, 119),
                                  height: 1.5))),
                      Text(
                          "${widget.screeningResult.screening_result} COVID-19",
                          textAlign: TextAlign.left,
                          style: GoogleFonts.lato(
                              textStyle: const TextStyle(
                                  fontSize: 16,
                                  color: Color.fromARGB(1000, 18, 18, 18),
                                  height: 1.5))),
                      const SizedBox(height: 20),
                      Text("PERTANYAAN DAN JAWABAN SKRINING ",
                          textAlign: TextAlign.left,
                          style: GoogleFonts.lato(
                              textStyle: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Color.fromARGB(1000, 4, 167, 119),
                                  height: 1.5))),
                      Text(
                          "1. ${widget.screeningResult.second_page['question'].toString().substring(3)}",
                          textAlign: TextAlign.left,
                          style: GoogleFonts.lato(
                              textStyle: const TextStyle(
                                  fontSize: 16,
                                  color: Color.fromARGB(1000, 18, 18, 18),
                                  height: 1.5))),
                      Text(widget.screeningResult.second_page['answer'],
                          textAlign: TextAlign.left,
                          style: GoogleFonts.lato(
                              textStyle: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(1000, 18, 18, 18),
                                  height: 1.5))),
                      //const SizedBox(height: 10),
                      Text(
                          "2. ${widget.screeningResult.third_page['question'].toString().substring(3)}",
                          textAlign: TextAlign.left,
                          style: GoogleFonts.lato(
                              textStyle: const TextStyle(
                                  fontSize: 16,
                                  color: Color.fromARGB(1000, 18, 18, 18),
                                  height: 1.5))),
                      Text(widget.screeningResult.third_page['answer'],
                          textAlign: TextAlign.left,
                          style: GoogleFonts.lato(
                              textStyle: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(1000, 18, 18, 18),
                                  height: 1.5))),
                      //const SizedBox(height: 10),
                      Text(
                          "3. ${widget.screeningResult.fourth_page['question'].toString().substring(3)}",
                          textAlign: TextAlign.left,
                          style: GoogleFonts.lato(
                              textStyle: const TextStyle(
                                  fontSize: 16,
                                  color: Color.fromARGB(1000, 18, 18, 18),
                                  height: 1.5))),
                      Text(widget.screeningResult.fourth_page['answer'],
                          textAlign: TextAlign.left,
                          style: GoogleFonts.lato(
                              textStyle: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(1000, 18, 18, 18),
                                  height: 1.5))),
                      //const SizedBox(height: 10),
                      Text(
                          "4. ${widget.screeningResult.fifth_page['question'].toString().substring(3)}",
                          textAlign: TextAlign.left,
                          style: GoogleFonts.lato(
                              textStyle: const TextStyle(
                                  fontSize: 16,
                                  color: Color.fromARGB(1000, 18, 18, 18),
                                  height: 1.5))),
                      buildAnswer(widget.screeningResult.fifth_page['answer']),
                      //const SizedBox(height: 10),
                      Text(
                          "5. ${widget.screeningResult.sixth_page['question'].toString().substring(3)}",
                          textAlign: TextAlign.left,
                          style: GoogleFonts.lato(
                              textStyle: const TextStyle(
                                  fontSize: 16,
                                  color: Color.fromARGB(1000, 18, 18, 18),
                                  height: 1.5))),
                      buildAnswer(widget.screeningResult.sixth_page['answer']),
                      //const SizedBox(height: 10),
                      Text(
                          "6. ${widget.screeningResult.seventh_page['question'].toString().substring(3)}",
                          textAlign: TextAlign.left,
                          style: GoogleFonts.lato(
                              textStyle: const TextStyle(
                                  fontSize: 16,
                                  color: Color.fromARGB(1000, 18, 18, 18),
                                  height: 1.5))),
                      buildAnswer(
                          widget.screeningResult.seventh_page['answer']),
                      const SizedBox(height: 20),
                      Text("HASIL REKOMENDASI SKRINING MANDIRI ",
                          textAlign: TextAlign.left,
                          style: GoogleFonts.lato(
                              textStyle: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Color.fromARGB(1000, 4, 167, 119),
                                  height: 1.5))),
                      buildFurtherRecommendation(
                          widget.screeningResult.screening_result,
                          widget.screeningResult.id_skrining)
                    ],
                  )))
            ],
          )),
    );
  }
}
