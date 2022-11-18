// ignore_for_file: library_private_types_in_public_api, depend_on_referenced_packages, duplicate_ignore

import 'dart:convert';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:healthyin/screens/Artikel Page/healthyin_artikel_detail_page.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  List _posts = [];

  @override
  void initState() {
    super.initState();
    _getData();
  }

  Future _getData() async {
    try {
      final response = await http.get(Uri.parse(
          'https://newsapi.org/v2/top-headlines?country=id&category=health&apiKey=55222fafc68e4c5682d18641bda3f015'));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          _posts = data['articles'];
        });
      }
    } catch (e) {
      //print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('News page',
              style: GoogleFonts.lato(
                textStyle: (const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    height: 1,
                    color: Color.fromARGB(1000, 255, 255, 255))),
              )),
          backgroundColor: const Color.fromARGB(1000, 134, 22, 87)),
      body: ListView.builder(
        itemCount: _posts.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Container(
              color: Colors.grey[200],
              height: 100,
              width: 100,
              child: _posts[index]['urlToImage'] != null
                  ? Image.network(
                      _posts[index]['urlToImage'],
                      width: 100,
                      fit: BoxFit.cover,
                    )
                  : const Center(),
            ),
            title: Text(
              '${_posts[index]['title']}',
              style: GoogleFonts.lato(
                textStyle: (const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  height: 1,
                )),
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: Text(
              '${_posts[index]['source']['name']}',
              style: GoogleFonts.lato(
                textStyle: (const TextStyle(
                  fontSize: 14,
                  height: 1.5,
                )),
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            onTap: () {
              Get.to(Detail(
                  url: _posts[index]['url'],
                  title: _posts[index]['title'],
                  content: _posts[index]['content'],
                  publishedAt: _posts[index]['publishedAt'],
                  author: _posts[index]['author'],
                  urlToImage: _posts[index]['urlToImage']));
            },
          );
        },
      ),
    );
  }
}
