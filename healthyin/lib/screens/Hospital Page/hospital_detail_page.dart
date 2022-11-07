// ignore_for_file: unnecessary_import, implementation_imports

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:healthyin/model/hospital_model.dart';

class HospitalDetail extends StatelessWidget {
  final HospitalModel hospital;

  const HospitalDetail({Key? key, required this.hospital}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Container(
            height: h,
            width: w,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/self_screening_bg_x2.png"),
                    fit: BoxFit.cover)),
            child: Column(children: [
              SizedBox(height: 0.1 * h),
              Container(
                  width: w,
                  height: 40,
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  child: Text("Detail Rumah",
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
                  child: Text("Sakit",
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
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  width: w,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.grey,
                            blurRadius: 3,
                            offset: Offset(0, 0.5))
                      ]),
                  child: Column(children: [
                    Text(hospital.nama_rs,
                        textAlign: TextAlign.left,
                        style: GoogleFonts.lato(
                            textStyle: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w900,
                                letterSpacing: 1.5,
                                color: Color.fromARGB(1000, 4, 167, 119),
                                height: 1.5))),
                    Text(hospital.jenis_rs,
                        textAlign: TextAlign.left,
                        style: GoogleFonts.lato(
                            textStyle: const TextStyle(
                                fontSize: 16,
                                letterSpacing: 1.5,
                                color: Color.fromARGB(1000, 4, 167, 119),
                                height: 1.5))),
                    Text(hospital.alamat,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.lato(
                            textStyle: const TextStyle(
                                fontSize: 16,
                                letterSpacing: 1.5,
                                color: Color.fromARGB(1000, 4, 167, 119),
                                height: 1.5))),
                    Text(hospital.kecamatan,
                        textAlign: TextAlign.left,
                        style: GoogleFonts.lato(
                            textStyle: const TextStyle(
                                fontSize: 16,
                                letterSpacing: 1.5,
                                color: Color.fromARGB(1000, 4, 167, 119),
                                height: 1.5))),
                    Text(hospital.kab_kota,
                        textAlign: TextAlign.left,
                        style: GoogleFonts.lato(
                            textStyle: const TextStyle(
                                fontSize: 16,
                                letterSpacing: 1.5,
                                color: Color.fromARGB(1000, 4, 167, 119),
                                height: 1.5))),
                    Text(hospital.telepon,
                        textAlign: TextAlign.left,
                        style: GoogleFonts.lato(
                            textStyle: const TextStyle(
                                fontSize: 16,
                                letterSpacing: 1.5,
                                color: Color.fromARGB(1000, 4, 167, 119),
                                height: 1.5))),
                  ]))
            ])));
  }
}
