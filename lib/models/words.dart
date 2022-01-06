import 'dart:developer';

import 'package:english_words/english_words.dart';
import 'package:translator/translator.dart';

class Words {
  final Map<String, String> englishWords = {};

  //List<String> englishWords = ["beach"];
  //List<String> toTranslateTR = ["plaj"];

  void _createWords() {
    englishWords["beach"] = "Kumsal";

    log(englishWords.keys.last + englishWords.values.last);

    final translator = GoogleTranslator();
    final wordPair = WordPair.random();
    //englishWords.insert(0, wordPair.first.toString());
    log("aşama 2  eng kelime eklendi : " + wordPair.first.toString());
    translator
        .translate(wordPair.first.toString(), from: 'en', to: 'tr')
        .then((tr) {
      englishWords[wordPair.first.toString()] = "$tr";
      log("Eklenen kelime: Eng : " +
          wordPair.first.toString() +
          " TR: " +
          tr.toString());
      log("TÜrkçe:" + tr.toString());
    });
  }

  void takeWords() {
    return _createWords();
  }

  List<String> createChoice(List<String> x) {
    String? trueChoice, choice2, choice3, choice4;

    trueChoice = englishWords.keys.last;

    choice2 = WordPair.random().first.toString();
    choice3 = WordPair.random().first.toString();
    choice4 = WordPair.random().first.toString();

    x = [trueChoice, choice2, choice3, choice4];

    return x;
  }
}
