/*
Show list of hospitals
*/
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthyin/api/pdf_paragraph_api.dart';
import 'package:healthyin/controller/auth_controller.dart';
import 'package:healthyin/screens/Main%20Page/healthyin_main_page.dart';
import 'package:healthyin/screens/Hospital%20Page/hospital_list_page.dart';

class SevereRecommendation extends StatelessWidget {
  const SevereRecommendation({super.key});

  @override
  Widget build(BuildContext context) {
    var data = Get.arguments;

    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Container(
          height: h,
          width: w,
          margin: const EdgeInsets.only(left: 10, right: 10),
          child: Column(children: [
            SizedBox(height: 0.05 * h),
            GestureDetector(
              onTap: () {
                Get.offAll(() => HealthyInMainPage(
                    email: AuthController().auth.currentUser!.email!));
              },
              child: Row(children: [
                const BackButton(color: Color.fromARGB(1000, 18, 18, 18)),
                Text("Beranda",
                    style: GoogleFonts.lato(
                        fontSize: 14,
                        height: 1,
                        color: const Color.fromARGB(1000, 18, 18, 18)))
              ]),
            ),
            SizedBox(height: 0.01 * h),
            Text("Hasil self screening Anda adalah:",
                style: GoogleFonts.lato(
                    fontSize: 16,
                    color: const Color.fromARGB(1000, 170, 170, 170))),
            const SizedBox(height: 10),
            Image.asset("assets/images/severe_x2.png", scale: 2),
            Text("Anda Berisiko Tinggi COVID-19",
                style: GoogleFonts.lato(
                    fontSize: 20,
                    height: 1.5,
                    color: const Color.fromARGB(1000, 227, 23, 10),
                    fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            Text("Berikut hal-hal yang dapat dilakukan sebagai tindakan awal",
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                    fontSize: 16,
                    height: 1.5,
                    color: const Color.fromARGB(1000, 170, 170, 170))),
            Text(
                "Apa Yang Harus Saya Lakukan Apabila Terindikasi Positif COVID-19?",
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                    fontSize: 16,
                    height: 1.5,
                    color: const Color.fromARGB(1000, 4, 167, 119),
                    fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            Text(
                "Kami rekomendasikan Anda agar berkonsultasi langsung ke rumah sakit.",
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                    fontSize: 16,
                    height: 1.5,
                    color: const Color.fromARGB(1000, 170, 170, 170))),
            const SizedBox(height: 20),
            Container(
              height: 40,
              width: w,
              color: Colors.white,
              child: TextButton(
                  onPressed: () {
                    Get.to(() => const HospitalListPage(), arguments: data);
                  },
                  style: TextButton.styleFrom(
                      backgroundColor: const Color.fromARGB(1000, 4, 167, 119),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)))),
                  child: Text("Lihat Daftar Rumah Sakit di D.I. Yogyakarta",
                      style: GoogleFonts.lato(
                          textStyle: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              height: 1.5)))),
            ),
            const SizedBox(height: 10),
            Container(
              height: 40,
              width: w,
              color: Colors.white,
              child: OutlinedButton(
                  onPressed: () async {
                    //print(data);
                    final pdfFile = await PdfParagraphApi.generate(data);
                    PdfParagraphApi.openFile(pdfFile);
                  },
                  style: OutlinedButton.styleFrom(
                      side: const BorderSide(
                          color: Color.fromARGB(1000, 4, 167, 119), width: 2),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)))),
                  child: Text("Unduh Hasil Screening",
                      style: GoogleFonts.lato(
                          textStyle: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Color.fromARGB(1000, 4, 167, 119),
                              height: 1.5)))),
            )
          ])),
    );
  }
}

/*
Fixing problem: why when screening result is generated, there is some lag. The PDF shows previous screening result. 
We need to 'back' and repress 'Unduh Hasil Screening' to be able to see current screening result.
 */
