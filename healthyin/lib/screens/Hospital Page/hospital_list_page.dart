// Tutorial: https://www.youtube.com/watch?v=H3CCtCmBUoQ&t=520s

// ignore_for_file: prefer_const_constructors
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthyin/model/hospital_model.dart';
import 'package:healthyin/widget/hotel_card.dart';
import 'package:healthyin/screens/Main%20Page/healthyin_main_page.dart';
import 'package:healthyin/controller/auth_controller.dart';

class HospitalListPage extends StatefulWidget {
  const HospitalListPage({super.key});

  @override
  State<HospitalListPage> createState() => _HospitalListPageState();
}

class _HospitalListPageState extends State<HospitalListPage> {
  var data = Get.arguments;
  final _hospitalSearchController = TextEditingController();
  //var selectedCity = "Semua kabupaten/kota";

  late Future resultsLoaded;
  List _allResults = [];
  List _resultsList = [];

  @override
  void initState() {
    super.initState();
    _hospitalSearchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _hospitalSearchController.removeListener(_onSearchChanged);
    _hospitalSearchController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    resultsLoaded = getHospitalLists();
  }

  _onSearchChanged() {
    searchResultList();
  }

  searchResultList() {
    var showResults = [];

    if (_hospitalSearchController.text != "") {
      // we have a search parameter
      for (var hospitalSnapshot in _allResults) {
        var hospital =
            HospitalModel.fromSnapshot(hospitalSnapshot).nama_rs.toLowerCase();

        var kabKota =
            HospitalModel.fromSnapshot(hospitalSnapshot).kab_kota.toLowerCase();

        if (hospital.contains(_hospitalSearchController.text.toLowerCase()) ||
            kabKota.contains(_hospitalSearchController.text.toLowerCase())) {
          showResults.add(hospitalSnapshot);
        }
      }
    } else {
      showResults = List.from(_allResults);
    }

    /*if (selectedCity != "Semua kabupaten/kota") {
      // we have a search parameter
      for (var hospitalSnapshot in _allResults) {
        var title =
            HospitalModel.fromSnapshot(hospitalSnapshot).kab_kota.toLowerCase();

        if (title == selectedCity) {
          showResults.add(hospitalSnapshot);
        }
      }
    }*/

    setState(() {
      _resultsList = showResults;
    });
  }

  getHospitalLists() async {
    var data = await FirebaseFirestore.instance.collection('hospitals').get();

    setState(() {
      _allResults = data.docs;
    });
    searchResultList();
    return 'complete';
  }

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
          child: Column(
            children: [
              SizedBox(height: 0.05 * h),
              GestureDetector(
                  onTap: () {
                    Get.offAll(() => HealthyInMainPage(
                        email: AuthController().auth.currentUser!.email!));
                  },
                  child: Row(children: [
                    const BackButton(
                        color: Color.fromARGB(1000, 255, 255, 255)),
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
                  child: Text("Daftar Rumah",
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
                  child: Text("Sakit di",
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
                  child: Text("D.I. Yogyakarta",
                      textAlign: TextAlign.start,
                      style: GoogleFonts.lato(
                          textStyle: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w900,
                              letterSpacing: 0.5,
                              color: Color.fromARGB(1000, 255, 255, 255),
                              height: 1.5)))),
              /*  SizedBox(height: 10),
                  SizedBox(
                    height: 55,
                    width: w,
                    child: DropdownButton(
                        value: selectedCity,
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedCity = newValue!;
                          });
                          print(newValue);
                        },
                        items: [
                          DropdownMenuItem(
                              value: "Semua kabupaten/kota",
                              child: Text("Semua kabupaten/kota",
                                  style: GoogleFonts.lato(
                                      textStyle: const TextStyle(
                                          fontSize: 16,
                                          color: Color.fromARGB(1000, 18, 18, 18),
                                          height: 1.4)))),
                          DropdownMenuItem(
                              value: "Sleman",
                              child: Text("Sleman",
                                  style: GoogleFonts.lato(
                                      textStyle: const TextStyle(
                                          fontSize: 16,
                                          color: Color.fromARGB(1000, 18, 18, 18),
                                          height: 1.4)))),
                          DropdownMenuItem(
                              value: "Gunung Kidul",
                              child: Text("Gunung Kidul",
                                  style: GoogleFonts.lato(
                                      textStyle: const TextStyle(
                                          fontSize: 16,
                                          color: Color.fromARGB(1000, 18, 18, 18),
                                          height: 1.4)))),
                          DropdownMenuItem(
                              value: "Kulon Progo",
                              child: Text("Kulon Progo",
                                  style: GoogleFonts.lato(
                                      textStyle: const TextStyle(
                                          fontSize: 16,
                                          color: Color.fromARGB(1000, 18, 18, 18),
                                          height: 1.4)))),
                          DropdownMenuItem(
                              value: "Bantul",
                              child: Text("Bantul",
                                  style: GoogleFonts.lato(
                                      textStyle: const TextStyle(
                                          fontSize: 16,
                                          color: Color.fromARGB(1000, 18, 18, 18),
                                          height: 1.4)))),
                          DropdownMenuItem(
                              value: "Kota Yogyakarta",
                              child: Text("Kota Yogyakarta",
                                  style: GoogleFonts.lato(
                                      textStyle: const TextStyle(
                                          fontSize: 16,
                                          color: Color.fromARGB(1000, 18, 18, 18),
                                          height: 1.4))))
                        ]),
                  ),*/
              SizedBox(height: 30),
              Container(
                height: 55,
                width: w * 0.85,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.grey,
                          blurRadius: 3,
                          offset: Offset(0, 0.5))
                    ]),
                child: TextField(
                  controller: _hospitalSearchController,
                  decoration: InputDecoration(
                      hintText: "Masukkan nama kota atau nama rumah sakit",
                      hintStyle: GoogleFonts.lato(
                          fontSize: 12, color: Colors.grey[500]),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                              color: Color.fromARGB(1000, 18, 18, 18),
                              width: 1.5)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                              color: Colors.white, width: 1.0)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12))),
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                  child: ListView.builder(
                itemCount: _resultsList.length,
                itemBuilder: (BuildContext context, int index) =>
                    buildHospitalCard(context, _resultsList[index]),
              ))
            ],
          ),
        ));
  }
}
