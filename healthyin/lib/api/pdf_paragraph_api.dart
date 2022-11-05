import 'dart:io';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

class PdfParagraphApi {
  static Future<File> generate(dynamic data) async {
    final headerLogo =
        await rootBundle.loadString('assets/icons/splashscreen_tagline.svg');
    final pdf = Document();

    pdf.addPage(
      MultiPage(
        build: (context) => <Widget>[
          buildLogo(headerLogo),
          SizedBox(height: 0.5 * PdfPageFormat.cm),
          Center(
              child: Text("Hasil Self Screening",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: PdfColors.black))),
          buildQuestion('1. Nama: ${data['identity']['nama']}'),
          buildQuestion('2. Gender: ${data['identity']['gender']}'),
          buildQuestion('3. Usia: ${data['identity']['usia']} tahun'),
          buildQuestion(
              data['second_page']['question'] + data['second_page']['answer']),
          buildQuestion(data['third_page']['question'] +
              ' ' +
              data['third_page']['answer']),
          buildQuestion(data['fourth_page']['question'] +
              ' ' +
              data['fourth_page']['answer']),
          buildQuestion(data['fifth_page']['question']),
          ...buildBulletPoints(data['fifth_page']['answer']),
          buildQuestion(data['sixth_page']['question']),
          ...buildBulletPoints(data['sixth_page']['answer']),
          buildQuestion(data['seventh_page']['question']),
          ...buildBulletPoints(data['seventh_page']['answer']),
          SizedBox(height: 0.1 * PdfPageFormat.cm),
        ],
        footer: (context) {
          final text = 'Page ${context.pageNumber} of ${context.pagesCount}';

          return Container(
            alignment: Alignment.centerRight,
            margin: const EdgeInsets.only(top: 1 * PdfPageFormat.cm),
            child: Text(
              text,
              style: const TextStyle(color: PdfColors.black),
            ),
          );
        },
      ),
    );
    return saveDocument(name: 'screening_result.pdf', pdf: pdf);
  }

  static Future<File> saveDocument({
    required String name,
    required Document pdf,
  }) async {
    final bytes = await pdf.save();

    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/$name');

    await file.writeAsBytes(bytes);

    return file;
  }

  static Future openFile(File file) async {
    final url = file.path;
    await OpenFile.open(url);
  }

  /*Build custom widget for PDF*/

  //defining the logo for header
  static Widget buildLogo(final headerLogo) => Container(
        padding: const EdgeInsets.only(bottom: 3 * PdfPageFormat.mm),
        decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(width: 2, color: PdfColors.black)),
        ),
        child: Row(
          children: [
            SvgImage(
              svg: headerLogo,
            )
          ],
        ),
      );

// defining question widget
  static Widget buildQuestion(String question) => Header(
        child: Text(question,
            style: const TextStyle(
              fontSize: 12,
              color: PdfColors.black,
            ),
            textAlign: TextAlign.left),
        padding: const EdgeInsets.all(1),
        decoration: const BoxDecoration(color: PdfColors.white),
      );

//defining answer
  static List<dynamic> buildBulletPoints(answer) {
    if (answer == null) {
      return [Bullet(text: "Tidak ada")];
    } else {
      return answer.entries.map((e) => Bullet(text: e.value)).toList();
    }
  }
}
