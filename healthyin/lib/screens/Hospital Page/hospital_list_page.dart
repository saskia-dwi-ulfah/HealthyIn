// Tutorial: https://www.youtube.com/watch?v=H3CCtCmBUoQ&t=520s

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:healthyin/model/hospital_model.dart';
import 'package:healthyin/widget/hotel_card.dart';

class HospitalListPage extends StatefulWidget {
  const HospitalListPage({super.key});

  @override
  State<HospitalListPage> createState() => _HospitalListPageState();
}

class _HospitalListPageState extends State<HospitalListPage> {
  final _hospitalSearchController = TextEditingController();

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
        var title =
            HospitalModel.fromSnapshot(hospitalSnapshot).nama_rs.toLowerCase();

        if (title.contains(_hospitalSearchController.text.toLowerCase())) {
          showResults.add(hospitalSnapshot);
        }
      }
    } else {
      showResults = List.from(_allResults);
    }

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
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        body: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Lihat Rumah Sakit di D.I. Yogyakarta",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                ),
                SizedBox(height: 10),
                Container(
                  height: 55,
                  width: w,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(1000, 241, 241, 241),
                      borderRadius: BorderRadius.circular(12)),
                  child: TextField(
                    controller: _hospitalSearchController,
                    decoration: InputDecoration(
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
                SizedBox(height: 10),
                Expanded(
                    child: ListView.builder(
                  itemCount: _resultsList.length,
                  itemBuilder: (BuildContext context, int index) =>
                      buildHospitalCard(context, _resultsList[index]),
                ))
              ],
            )));
  }
}
