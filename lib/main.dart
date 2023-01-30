import 'dart:async';
import 'package:flutter/material.dart';
import 'package:music_player/amazon_Scraper.dart';

// import 'package:html/dom.dart' as dom;
// import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(color: Colors.blue),
        textTheme: TextTheme(bodyText2: TextStyle(fontSize: 24)),
      ),
      home: AmazonScraper(),
    );
  }
}

