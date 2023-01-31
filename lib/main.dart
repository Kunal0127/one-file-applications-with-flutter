import 'dart:async';
import 'package:flutter/material.dart';
import 'package:music_player/amazon_Scraper.dart';
import 'package:music_player/learn_navigation.dart';
import 'package:provider/provider.dart';

// import 'package:html/dom.dart' as dom;
// import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppState(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          appBarTheme: AppBarTheme(color: Colors.blue),
          textTheme: TextTheme(bodyText2: TextStyle(fontSize: 24)),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        ),
        home: LearnNavigation(),
      ),
    );
  }
}
