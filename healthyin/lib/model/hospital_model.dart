// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';

class HospitalModel {
  String nama_rs;
  int kode_rs;
  String jenis_rs;
  String alamat;
  String kecamatan;
  String kab_kota;
  String telepon;

  HospitalModel(this.nama_rs, this.kode_rs, this.jenis_rs, this.alamat,
      this.kecamatan, this.kab_kota, this.telepon);

  HospitalModel.fromSnapshot(DocumentSnapshot snapshot)
      : nama_rs = snapshot['nama_rs'],
        kode_rs = snapshot['kode_rs'],
        jenis_rs = snapshot['jenis_rs'],
        alamat = snapshot['alamat'],
        kecamatan = snapshot['kecamatan'],
        kab_kota = snapshot['kab_kota'],
        telepon = snapshot['telepon'];
}
