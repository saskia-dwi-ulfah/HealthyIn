// ignore_for_file: prefer_typing_uninitialized_variables
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Detail extends StatefulWidget {
  final url;
  final title;
  final content;
  final publishedAt;
  final author;
  final urlToImage;

  const Detail(
      {super.key,
      this.url,
      this.title,
      this.content,
      this.publishedAt,
      this.author,
      this.urlToImage});

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  late WebViewController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('News',
                style: GoogleFonts.lato(
                  textStyle: (const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      height: 1,
                      color: Color.fromARGB(1000, 255, 255, 255))),
                )),
            backgroundColor: const Color.fromARGB(1000, 134, 22, 87)),
        body: WebView(
          javascriptMode: JavascriptMode.unrestricted,
          initialUrl: widget.url,
          onWebViewCreated: (url) {
            controller = controller;
          },
        ) /*Column(
        children: <Widget>[
          urlToImage != null
              ? Image.network(urlToImage)
              : Container(
                  height: 250,
                  color: Colors.grey[200],
                ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '$title',
                  style: GoogleFonts.lato(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Text(
                  '$publishedAt',
                  style: GoogleFonts.lato(fontStyle: FontStyle.italic),
                ),
                const SizedBox(height: 5),
                Text('$content'),
                //const Divider(),
                //Text('Author : $author'),
                //Text('$url'),
              ],
            ),
          )
        ],
      )
      ,
      floatingActionButton: FloatingActionButton(
          backgroundColor: const Color.fromARGB(1000, 134, 22, 87),
          child: const Icon(Icons.close),
          onPressed: () {
            Get.back();
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,*/
        );
  }
}
