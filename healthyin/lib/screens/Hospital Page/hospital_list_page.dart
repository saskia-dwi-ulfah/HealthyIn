import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HospitalListPage extends StatefulWidget {
  const HospitalListPage({super.key});

  @override
  State<HospitalListPage> createState() => _HospitalListPageState();
}

class _HospitalListPageState extends State<HospitalListPage> {
  var _hospitalSearchController = TextEditingController();

  /*List _allResults = [];

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

  _onSearchChanged() {
    print(_hospitalSearchController.text);
  }

  getHospitalLists() async {
    var data =
        await FirebaseFirestore.instance.collection('hospitals').snapshots();

    setState(() {
      _allResults = data as List;
    });
  }*/

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    final db = FirebaseFirestore.instance;

    return Scaffold(
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
                Center(
                  child: OutlinedButton(
                      onPressed: () async {
                        FirebaseFirestore.instance
                            .collection('hospitals')
                            .get()
                            .then((QuerySnapshot querySnapshot) {
                          querySnapshot.docs.forEach((doc) {
                            print(doc["nama_rs"]);
                          });
                        });
                      },
                      child: Text("Click me")),
                )
                /*Expanded(
                  child: ListView(),
                )*/
              ],
            )));
  }
}
