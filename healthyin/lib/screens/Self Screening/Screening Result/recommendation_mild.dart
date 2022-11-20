// ignore_for_file: deprecated_member_use, prefer_const_constructors

/*
Chat with doctor
*/
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:healthyin/api/pdf_paragraph_api.dart';
import 'package:healthyin/controller/auth_controller.dart';
import 'package:healthyin/screens/Main%20Page/healthyin_main_page.dart';

class MildRecommendation extends StatelessWidget {
  const MildRecommendation({super.key});

  @override
  Widget build(BuildContext context) {
    //get list of screening result and its ID on Firestore
    var data = Get.arguments;

    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    openWhatsApp() async {
      String number = "+6285878391837";
      String message =
          "Halo, saya ingin mengonsultasikan hasil skrining mandiri dari aplikasi HealthyIn.";

      try {
        String url = "whatsapp://send?phone=$number&text=$message";
        await launchUrl(Uri.parse(url));
      } catch (e) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Can't open WhatsApp.")));
      }
    }

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
            Image.asset("assets/images/mild_x2.png", scale: 2),
            Text("Anda Berisiko Ringan COVID-19",
                style: GoogleFonts.lato(
                    fontSize: 20,
                    height: 1.5,
                    color: const Color.fromARGB(1000, 132, 215, 157),
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
                "Kami rekomendasikan Anda untuk isolasi mandiri dan berkonsultasi jarak jauh dengan dokter.",
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
                    showDialog(
                        context: context,
                        builder: ((context) => AlertDialog(
                              title: Text('Warning',
                                  style: GoogleFonts.lato(
                                      textStyle: const TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 0.5,
                                          color:
                                              Color.fromARGB(1000, 134, 22, 87),
                                          height: 1.4))),
                              content: Text(
                                  'Sebelum Anda melakukan konsultasi dengan dokter. Jangan lupa untuk mengunduh hasil skrining mandiri COVID-19 yang telah Anda lakukan sebelumnya.',
                                  style: GoogleFonts.lato(
                                      textStyle: const TextStyle(
                                          fontSize: 16,
                                          letterSpacing: 0.5,
                                          color: Colors.black,
                                          height: 1.4))),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      openWhatsApp();
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
                  style: TextButton.styleFrom(
                      backgroundColor: const Color.fromARGB(1000, 4, 167, 119),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)))),
                  child: Text("Konsultasi dengan Dokter Sekarang",
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
