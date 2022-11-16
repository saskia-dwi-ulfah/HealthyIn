import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:healthyin/model/self_screening_result_model.dart';

class ScreeningHistoryDetail extends StatefulWidget {
  final ScreeningHistoryDetail screeningResult;
  const ScreeningHistoryDetail({super.key, required this.screeningResult});

  @override
  State<ScreeningHistoryDetail> createState() => _ScreeningHistoryDetailState();
}

class _ScreeningHistoryDetailState extends State<ScreeningHistoryDetail> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text("To do....")),
    );
  }
}
