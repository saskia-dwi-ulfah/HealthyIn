// ignore_for_file: unnecessary_import, implementation_imports
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:healthyin/model/hospital_model.dart';
import 'package:healthyin/screens/Main%20Page/healthyin_main_page.dart';

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
              SizedBox(height: 0.05 * h),
              GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Row(children: [
                    const BackButton(
                        color: Color.fromARGB(1000, 255, 255, 255)),
                    Text("Daftar Rumah Sakit di D.I. Yogyakarta",
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
                        Text(hospital.nama_rs,
                            textAlign: TextAlign.left,
                            style: GoogleFonts.lato(
                                textStyle: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w900,
                                    color: Color.fromARGB(1000, 134, 22, 87),
                                    height: 1.5))),
                        Text(hospital.kode_rs.toString(),
                            textAlign: TextAlign.left,
                            style: GoogleFonts.lato(
                                textStyle: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey,
                                    height: 1.5))),
                        Text(hospital.jenis_rs,
                            textAlign: TextAlign.left,
                            style: GoogleFonts.lato(
                                textStyle: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey,
                                    height: 1.5))),
                        const SizedBox(height: 10),
                        Text("Alamat: ",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.lato(
                                textStyle: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Color.fromARGB(1000, 4, 167, 119),
                                    height: 1.5))),
                        Text(hospital.alamat,
                            textAlign: TextAlign.left,
                            style: GoogleFonts.lato(
                                textStyle: const TextStyle(
                                    fontSize: 16,
                                    color: Color.fromARGB(1000, 18, 18, 18),
                                    height: 1.5))),
                        Text("Kecamatan: ",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.lato(
                                textStyle: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Color.fromARGB(1000, 4, 167, 119),
                                    height: 1.5))),
                        Text(hospital.kecamatan,
                            textAlign: TextAlign.left,
                            style: GoogleFonts.lato(
                                textStyle: const TextStyle(
                                    fontSize: 16,
                                    color: Color.fromARGB(1000, 18, 18, 18),
                                    height: 1.5))),
                        Text("Kabupaten/Kota: ",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.lato(
                                textStyle: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Color.fromARGB(1000, 4, 167, 119),
                                    height: 1.5))),
                        Text(hospital.kab_kota,
                            textAlign: TextAlign.left,
                            style: GoogleFonts.lato(
                                textStyle: const TextStyle(
                                    fontSize: 16,
                                    color: Color.fromARGB(1000, 18, 18, 18),
                                    height: 1.5))),
                        Text("Telepon: ",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.lato(
                                textStyle: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Color.fromARGB(1000, 4, 167, 119),
                                    height: 1.5))),
                        Text(hospital.telepon,
                            textAlign: TextAlign.left,
                            style: GoogleFonts.lato(
                                textStyle: const TextStyle(
                                    fontSize: 16,
                                    color: Color.fromARGB(1000, 18, 18, 18),
                                    height: 1.5))),
                      ]),
                ),
              ),
            ])));
  }
}
