import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthyin/model/hospital_model.dart';

// Build hospital card for each record in snapshot
Widget buildHospitalCard(BuildContext context, DocumentSnapshot document) {
  final hospital = HospitalModel.fromSnapshot(document);

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
                  hospital.nama_rs,
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
                  hospital.jenis_rs,
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
                  hospital.kab_kota,
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
        Get.to
      },
    ),
  );
}
