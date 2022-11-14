// ignore_for_file: sized_box_for_whitespace, must_be_immutable
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthyin/controller/auth_controller.dart';
import 'package:healthyin/screens/Hospital%20Page/hospital_list_page.dart';
import 'package:healthyin/screens/Self%20Screening/screening_1.dart';

class HealthyInMainPage extends StatefulWidget {
  String email;
  HealthyInMainPage({Key? key, required this.email}) : super(key: key);

  @override
  State<HealthyInMainPage> createState() => _HealthyInMainPageState();
}

class _HealthyInMainPageState extends State<HealthyInMainPage> {
  //checking for fetching active user's name
  var name;

  getUserName() async {
    var collection = FirebaseFirestore.instance.collection('users');

    await collection
        .where("email", isEqualTo: AuthController().auth.currentUser!.email)
        .get()
        .then((doc) {
      name = doc.docs[0]["name"];
    });
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
                child: Column(
              children: [
                const CircleAvatar(
                    radius: 50,
                    backgroundColor: Color.fromARGB(1000, 4, 167, 119)),
                const SizedBox(height: 10),
                Text(widget.email,
                    style: GoogleFonts.lato(
                        textStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.5,
                            color: Colors.black,
                            height: 1.4))),
              ],
            )),
            ListTile(
              onTap: () {
                showDialog(
                    context: context,
                    builder: ((context) => AlertDialog(
                          title: Text('Logout',
                              style: GoogleFonts.lato(
                                  textStyle: const TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 0.5,
                                      color: Color.fromARGB(1000, 134, 22, 87),
                                      height: 1.4))),
                          content: Text('Yakin ingin keluar?',
                              style: GoogleFonts.lato(
                                  textStyle: const TextStyle(
                                      fontSize: 16,
                                      letterSpacing: 0.5,
                                      color: Colors.black,
                                      height: 1.4))),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  AuthController.instance.logout();
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
              title: Text("Keluar",
                  style: GoogleFonts.lato(
                      textStyle: const TextStyle(
                          fontSize: 14,
                          letterSpacing: 0.5,
                          color: Colors.black,
                          height: 1.4))),
              leading: const Icon(Icons.logout,
                  color: Color.fromARGB(1000, 134, 22, 87)),
            )
          ],
        ),
      ),
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
            child: FutureBuilder(
              future: getUserName(),
              builder: (context, snapshot) {
                if (snapshot.connectionState != ConnectionState.done) {
                  return Text("...",
                      style: GoogleFonts.lato(
                          textStyle: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w900,
                              letterSpacing: 0.5,
                              color: Color.fromARGB(1000, 255, 255, 255),
                              height: 1.5)));
                } else {
                  return Text(name,
                      style: GoogleFonts.lato(
                          textStyle: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w900,
                              letterSpacing: 0.5,
                              color: Color.fromARGB(1000, 255, 255, 255),
                              height: 1.5)));
                }
              },
            ),
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
                                showDialog(
                                    context: context,
                                    builder: ((context) => AlertDialog(
                                          title: Text('Disclaimer',
                                              style: GoogleFonts.lato(
                                                  textStyle: const TextStyle(
                                                      fontSize: 24,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      letterSpacing: 0.5,
                                                      color: Color.fromARGB(
                                                          1000, 134, 22, 87),
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
                                                  Get.to(
                                                      const FirstPageScreening());
                                                },
                                                child: Text('OK',
                                                    style: GoogleFonts.lato(
                                                        textStyle:
                                                            const TextStyle(
                                                                letterSpacing:
                                                                    0.5,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .black,
                                                                height: 1.4)))),
                                            TextButton(
                                                onPressed: () {
                                                  Get.back();
                                                },
                                                child: Text('Batal',
                                                    style: GoogleFonts.lato(
                                                        textStyle:
                                                            const TextStyle(
                                                                letterSpacing:
                                                                    0.5,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .black,
                                                                height: 1.4))))
                                          ],
                                        )));
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
                                    arguments: widget.email);
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
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: ((context) => AlertDialog(
                                          title: Text('Maaf ya...',
                                              style: GoogleFonts.lato(
                                                  textStyle: const TextStyle(
                                                      fontSize: 24,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      letterSpacing: 0.5,
                                                      color: Color.fromARGB(
                                                          1000, 134, 22, 87),
                                                      height: 1.4))),
                                          content: Text(
                                              'Untuk saat ini fitur Chat Konsultasi Dokter hanya dapat diakses melalui fitur Skrining Mandiri COVID-19.',
                                              style: GoogleFonts.lato(
                                                  textStyle: const TextStyle(
                                                      fontSize: 16,
                                                      letterSpacing: 0.5,
                                                      color: Colors.black,
                                                      height: 1.4))),
                                          actions: [
                                            TextButton(
                                                onPressed: () {
                                                  Get.back();
                                                },
                                                child: Text('OK',
                                                    style: GoogleFonts.lato(
                                                        textStyle:
                                                            const TextStyle(
                                                                letterSpacing:
                                                                    0.5,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .black,
                                                                height: 1.4))))
                                          ],
                                        )));
                              },
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
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: ((context) => AlertDialog(
                                          title: Text('Maaf ya...',
                                              style: GoogleFonts.lato(
                                                  textStyle: const TextStyle(
                                                      fontSize: 24,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      letterSpacing: 0.5,
                                                      color: Color.fromARGB(
                                                          1000, 134, 22, 87),
                                                      height: 1.4))),
                                          content: Text(
                                              'Fitur ini sedang dikembangkan.',
                                              style: GoogleFonts.lato(
                                                  textStyle: const TextStyle(
                                                      fontSize: 16,
                                                      letterSpacing: 0.5,
                                                      color: Colors.black,
                                                      height: 1.4))),
                                          actions: [
                                            TextButton(
                                                onPressed: () {
                                                  Get.back();
                                                },
                                                child: Text('OK',
                                                    style: GoogleFonts.lato(
                                                        textStyle:
                                                            const TextStyle(
                                                                letterSpacing:
                                                                    0.5,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .black,
                                                                height: 1.4))))
                                          ],
                                        )));
                              },
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
  }
}
