// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';

class ScreeningResultModel {
  Timestamp done_at;
  Map identity;
  Map second_page;
  Map third_page;
  Map fourth_page;
  Map fifth_page;
  Map sixth_page;
  Map seventh_page;
  int score;
  String screening_result;

  ScreeningResultModel(
      this.done_at,
      this.identity,
      this.second_page,
      this.third_page,
      this.fourth_page,
      this.fifth_page,
      this.sixth_page,
      this.seventh_page,
      this.score,
      this.screening_result);

  ScreeningResultModel.fromSnapshot(DocumentSnapshot snapshot)
      : done_at = snapshot['done_at'],
        identity = snapshot['identity'],
        second_page = snapshot['second_page'],
        third_page = snapshot['third_page'],
        fourth_page = snapshot['fourth_page'],
        fifth_page = snapshot['fifth_page'],
        sixth_page = snapshot['sixth_page'],
        seventh_page = snapshot['seventh_page'],
        score = snapshot['score'],
        screening_result = snapshot['screening_result'];
}
