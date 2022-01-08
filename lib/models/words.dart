import 'dart:developer';

import 'package:english_words/english_words.dart';
import 'package:translator/translator.dart';

class Words {
  final Map<String, String> englishWords = {};

  //List<String> englishWords = ["beach"];
  //List<String> toTranslateTR = ["plaj"];

  void _createWords() {
    englishWords["beach"] = "Kumsal";

    //log(englishWords.keys.last + englishWords.values.last);

    final translator = GoogleTranslator();
    final wordPair = WordPair.random();
    //englishWords.insert(0, wordPair.first.toString());
    //log("aşama 2  eng kelime eklendi : " + wordPair.first.toString());
    translator
        .translate(wordPair.first.toString(), from: 'en', to: 'tr')
        .then((tr) {
      englishWords[wordPair.first.toString()] = "$tr";
      //log("Eklenen kelime: Eng : " +
      //   wordPair.first.toString() +
      //    " TR: " +
      //    tr.toString());
      //log("TÜrkçe:" + tr.toString());
    });
  }

  void takeWords() {
    return _createWords();
  }

  List<String> createChoice(List<String> x) {
    String? trueChoice, choice2, choice3, choice4;
    final translator = GoogleTranslator();
    List<String> geciciList = [];

    trueChoice = englishWords.values.last;
    x.add(trueChoice);
    log("şık 1 eklendi: " + trueChoice);

    translator
        .translate(WordPair.random().first.toString(), from: 'en', to: 'tr')
        .then((tr) {
      choice2 = tr.toString();
      log("listeye eklenecek kelime: " + choice2.toString());
      x.add(choice2.toString());
    });

    log("şık 2 eklendi: " + choice2.toString());

    translator
        .translate(WordPair.random().first.toString(), from: 'en', to: 'tr')
        .then((tr) {
      choice3 = tr.toString();
      x.add(choice3.toString());
      log("şık 3 eklendi: " + choice3.toString());
    });

    translator
        .translate(WordPair.random().first.toString(), from: 'en', to: 'tr')
        .then((tr) {
      choice4 = tr.toString();
      x.add(choice4.toString());
      log("şık 4 eklendi: " + choice4.toString());
    });

    //log(x[0]);
    //log(x[1]);
    return x;
  }
}
