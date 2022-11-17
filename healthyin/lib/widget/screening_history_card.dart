import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthyin/model/self_screening_result_model.dart';
import 'package:healthyin/screens/Self%20Screening/Screening%20History/screening_history_detail.dart';

Widget buildScreeningHistoryCard(
    BuildContext context, DocumentSnapshot document) {
  final screeningResult = ScreeningResultModel.fromSnapshot(document);

  return Card(
    child: InkWell(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Row(children: <Widget>[
                Text(
                  "${screeningResult.identity['nama']}, ${screeningResult.identity['usia']} tahun",
                  style: GoogleFonts.lato(
                      textStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Color.fromARGB(1000, 4, 167, 119),
                          height: 1.4)),
                ),
              ]),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 4.0),
              child: Row(children: <Widget>[
                Text(
                  '${screeningResult.done_at.toDate()}',
                  style: GoogleFonts.lato(
                      textStyle: const TextStyle(
                          fontSize: 13, color: Colors.grey, height: 1.4)),
                ),
                const Spacer(),
              ]),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 4.0),
              child: Row(children: <Widget>[
                Text(
                  "${screeningResult.screening_result} COVID-19",
                  style: GoogleFonts.lato(
                      textStyle: const TextStyle(
                          fontSize: 13,
                          color: Color.fromARGB(1000, 18, 18, 18),
                          height: 1.4)),
                ),
                const Spacer(),
              ]),
            )
          ],
        ),
      ),
      onTap: () {
        Get.to(() => ScreeningHistoryDetail(screeningResult: screeningResult));
      },
    ),
  );
}
