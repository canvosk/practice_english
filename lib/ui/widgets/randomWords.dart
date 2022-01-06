//import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:practice_english/models/words.dart';

class RandomWords extends StatefulWidget {
  const RandomWords({Key? key}) : super(key: key);

  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  @override
  Widget build(BuildContext context) {
    Words words = Words();
    String newWord = '';

    setState(() {
      newWord = words.englishWords.keys.first;
    });
    return Text(newWord);
  }
}
