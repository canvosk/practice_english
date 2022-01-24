import 'dart:developer';

import 'package:english_words/english_words.dart';
import 'package:flutter/cupertino.dart';
import 'package:practice_english/core/models/words.dart';
import 'package:translator/translator.dart';

class WordsState with ChangeNotifier {
  final List<Words> _words = [
    Words(englishWords: "Beach", translatedToTr: "Kumsal"),
  ];

  List<Words> get words => _words;

  Words get lastWord => _words.first;

  createWords() {
    final translator = GoogleTranslator();
    final wordPair = WordPair.random();

    translator
        .translate(wordPair.first.toString(), from: 'en', to: 'tr')
        .then((tr) {
      log("Yeni Kelime: " + wordPair.first.toString());
      Words x =
          Words(englishWords: wordPair.first.toString(), translatedToTr: "$tr");
      _words.insert(0, x);
    });

    notifyListeners();
  }

  List<String> option = [];

  Future<List<String>> createChoice() async {
    option.clear();

    String trueChoice;
    final translator = GoogleTranslator();

    trueChoice = _words.first.translatedToTr;
    option.add(trueChoice);
    log("Dogru cevap: " + trueChoice);

    var choice2 = await translator.translate(WordPair.random().first.toString(),
        from: 'en', to: 'tr');

    option.add(choice2.text);
    log("2. cevap: " + choice2.toString());

    var choice3 = await translator.translate(WordPair.random().first.toString(),
        from: 'en', to: 'tr');

    option.add(choice3.text);
    log("3. cevap: " + choice3.toString());

    var choice4 = await translator.translate(WordPair.random().first.toString(),
        from: 'en', to: 'tr');

    option.add(choice4.text);
    log("4. cevap: " + choice4.toString());

    option.shuffle();

    notifyListeners();

    return option;
  }
}
