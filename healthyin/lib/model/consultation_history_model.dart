// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';

class ConsultationHistoryModel {
  String id_skrining;
  String hasil_skrining;
  String id_pasien;
  String nama_pasien;
  String jenis_kelamin;
  int usia;
  String obat_1;
  String obat_2;
  String obat_3;
  String obat_4;
  String obat_5;
  String aturan_obat_1;
  String aturan_obat_2;
  String aturan_obat_3;
  String aturan_obat_4;
  String aturan_obat_5;
  String catatan_obat_1;
  String catatan_obat_2;
  String catatan_obat_3;
  String catatan_obat_4;
  String catatan_obat_5;
  String catatan_keseluruhan;
  String penanggung_jawab;

  ConsultationHistoryModel(
      this.id_skrining,
      this.hasil_skrining,
      this.id_pasien,
      this.nama_pasien,
      this.jenis_kelamin,
      this.usia,
      this.obat_1,
      this.obat_2,
      this.obat_3,
      this.obat_4,
      this.obat_5,
      this.aturan_obat_1,
      this.aturan_obat_2,
      this.aturan_obat_3,
      this.aturan_obat_4,
      this.aturan_obat_5,
      this.catatan_obat_1,
      this.catatan_obat_2,
      this.catatan_obat_3,
      this.catatan_obat_4,
      this.catatan_obat_5,
      this.catatan_keseluruhan,
      this.penanggung_jawab);

  ConsultationHistoryModel.fromSnapshot(DocumentSnapshot snapshot)
      : id_skrining = snapshot['id_skrining'],
        hasil_skrining = snapshot['hasil_skrining'],
        id_pasien = snapshot['id_pasien'],
        nama_pasien = snapshot['nama_pasien'],
        jenis_kelamin = snapshot['jenis_kelamin'],
        usia = snapshot['usia'],
        obat_1 = snapshot['obat_1'],
        obat_2 = snapshot['obat_2'],
        obat_3 = snapshot['obat_3'],
        obat_4 = snapshot['obat_4'],
        obat_5 = snapshot['obat_5'],
        aturan_obat_1 = snapshot['aturan_obat_1'],
        aturan_obat_2 = snapshot['aturan_obat_2'],
        aturan_obat_3 = snapshot['aturan_obat_3'],
        aturan_obat_4 = snapshot['aturan_obat_4'],
        aturan_obat_5 = snapshot['aturan_obat_5'],
        catatan_obat_1 = snapshot['catatan_obat_1'],
        catatan_obat_2 = snapshot['catatan_obat_2'],
        catatan_obat_3 = snapshot['catatan_obat_3'],
        catatan_obat_4 = snapshot['catatan_obat_4'],
        catatan_obat_5 = snapshot['catatan_obat_5'],
        catatan_keseluruhan = snapshot['catatan_keseluruhan'],
        penanggung_jawab = snapshot['penanggung_jawab'];
}
