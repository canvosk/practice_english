//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practice_english/models/words.dart';
//import 'package:english_words/english_words.dart';
import 'package:practice_english/ui/pages/home_page.dart';

void main() {
  Words words = Words();
  words.takeWords();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Practice English',
      home: HomePage(),
    );
  }
}
