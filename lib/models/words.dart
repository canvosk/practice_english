import 'dart:developer';

import 'package:english_words/english_words.dart';
import 'package:translator/translator.dart';

class Words {
  final Map<String, String> englishWords = {"Beach": "Kumsal"};

  //List<String> englishWords = ["beach"];
  //List<String> toTranslateTR = ["plaj"];

  void _createWords() {
    final translator = GoogleTranslator();
    final wordPair = WordPair.random();

    translator
        .translate(wordPair.first.toString(), from: 'en', to: 'tr')
        .then((tr) {
      englishWords[wordPair.first.toString()] = "$tr";
      log("Eklenen kelime: " + wordPair.first.toString());
      log("Türkçe kelime: " + tr.toString());
    });
  }

  void takeWords() {
    log("kelime eklendi");
    return _createWords();
  }

  Future<List<String>> createChoice(List<String> x) async {
    String? trueChoice;
    final translator = GoogleTranslator();

    trueChoice = englishWords.values.last;
    x.add(trueChoice);

    var choice2 = await translator.translate(WordPair.random().first.toString(),
        from: 'en', to: 'tr');

    x.add(choice2.text);

    var choice3 = await translator.translate(WordPair.random().first.toString(),
        from: 'en', to: 'tr');

    x.add(choice3.text);

    var choice4 = await translator.translate(WordPair.random().first.toString(),
        from: 'en', to: 'tr');

    x.add(choice4.text);

    //setState(() {
    //x.add(choice2.toString());
    //x.add(choice3.toString());
    //x.add(choice4.toString());
    //});
    log("1. Kelime: " + x[0]);
    log("2. Kelime: " + x[1]);
    log("3. Kelime: " + x[2]);
    log("4. Kelime: " + x[3]);

    return x;
  }
}
