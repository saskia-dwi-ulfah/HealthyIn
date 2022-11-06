import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
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
              padding: const EdgeInsets.only(top: 8.0, bottom: 4.0),
              child: Row(children: <Widget>[
                Text(
                  hospital.nama_rs,
                  style: GoogleFonts.lato(fontSize: 10.0),
                ),
                const Spacer(),
              ]),
            ),
            /* Padding(
              padding: const EdgeInsets.only(top: 4.0, bottom: 80.0),
              child: Row(children: <Widget>[
                Text(
                    "${DateFormat('MM/dd/yyyy').format(trip.startDate).toString()} - ${DateFormat('MM/dd/yyyy').format(trip.endDate).toString()}"),
                Spacer(),
              ]),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: Row(
                children: <Widget>[
                  Text(
                    "\$${(trip.budget == null) ? "n/a" : trip.budget.toStringAsFixed(2)}",
                    style: new TextStyle(fontSize: 35.0),
                  ),
                  Spacer(),
                  (tripType.containsKey(trip.travelType))
                      ? tripType[trip.travelType]
                      : tripType["other"],
                ],
              ),
            )*/
          ],
        ),
      ),
      onTap: () {},
    ),
  );
}
