import 'dart:developer';
import 'package:english_words/english_words.dart';
import 'package:flutter/cupertino.dart';
import 'package:practice_english/core/models/words.dart';
import 'package:translator/translator.dart';

class WordsState with ChangeNotifier {
  final List<Words> _words = [
    Words(englishWords: "Beach", translatedToTr: "Kumsal"),
  ];

  final List<Words> _favWords = [];

  bool condition = false;

  List<Words> get words => _words;

  List<Words> get favs => _favWords;

  Words get lastWord => _words.first;

  Future<void> createWords() async {
    final translator = GoogleTranslator();
    final wordPair = WordPair.random();

    var newWord = wordPair.first.toString();
    var translated = await translator.translate(newWord, from: 'en', to: 'tr');
    String tr = translated.text;

    newWord = newWord.replaceFirst(newWord[0], newWord[0].toUpperCase());
    tr = tr.replaceFirst(tr[0], tr[0].toUpperCase());
    // toUpper(newWord, tr);

    Words x = Words(englishWords: newWord, translatedToTr: tr);

    if (_words.contains(x)) {
      newWord = wordPair.second.toString();
      translated = await translator.translate(newWord, from: 'en', to: 'tr');
      // newWord = newWord.replaceFirst(newWord[0], newWord[0].toUpperCase());
      // tr = tr.replaceFirst(tr[0], tr[0].toUpperCase());

      x = Words(englishWords: newWord, translatedToTr: tr);
    }

    _words.insert(0, x);

    notifyListeners();

    //return _words[0].toString();
  }

  // void toUpper(String a, String b) {
  //   a = a.replaceFirst(a[0], a[0].toUpperCase());
  //   b = b.replaceFirst(b[0], b[0].toUpperCase());
  // }

  Future<List<String>> createChoice() async {
    final List<String> _options = <String>[];

    _options.clear();
    condition = false;
    log("log cond:" + condition.toString());
    String trueChoice;
    final translator = GoogleTranslator();

    trueChoice = _words.first.translatedToTr;
    _options.add(trueChoice);
    //log("Dogru cevap: " + trueChoice);

    var choice2 = await translator.translate(WordPair.random().first.toString(),
        from: 'en', to: 'tr');
    String ch2 = choice2.toString();
    ch2 = ch2.replaceFirst(ch2[0], ch2[0].toUpperCase());

    if (ch2 == trueChoice) {
      choice2 = await translator.translate(WordPair.random().first.toString(),
          from: 'en', to: 'tr');
      String ch2 = choice2.toString();
      ch2 = ch2.replaceFirst(ch2[0], ch2[0].toUpperCase());
    }

    _options.add(ch2);

    var choice3 = await translator.translate(WordPair.random().first.toString(),
        from: 'en', to: 'tr');
    String ch3 = choice3.toString();
    ch3 = ch3.replaceFirst(ch3[0], ch3[0].toUpperCase());

    if (ch3 == trueChoice) {
      choice3 = await translator.translate(WordPair.random().first.toString(),
          from: 'en', to: 'tr');
      String ch3 = choice3.toString();
      ch3 = ch3.replaceFirst(ch3[0], ch3[0].toUpperCase());
    }

    _options.add(ch3);

    var choice4 = await translator.translate(WordPair.random().first.toString(),
        from: 'en', to: 'tr');
    String ch4 = choice4.toString();
    ch4 = ch4.replaceFirst(ch4[0], ch4[0].toUpperCase());

    if (ch4 == trueChoice) {
      choice4 = await translator.translate(WordPair.random().first.toString(),
          from: 'en', to: 'tr');
      String ch4 = choice4.toString();
      ch4 = ch4.replaceFirst(ch4[0], ch4[0].toUpperCase());
    }

    _options.add(ch4);

    _options.shuffle();

    condition = true;
    log("2. log cond:" + condition.toString());

    notifyListeners();

    return _options;
  }

  void addToFav(int index) {
    Words fav = Words(
        englishWords: words[index].englishWords,
        translatedToTr: words[index].translatedToTr);

    _favWords.insert(0, fav);

    notifyListeners();
  }

  void delFromFav(int index) {
    // Words fav = Words(
    //     englishWords: words[index].englishWords,
    //     translatedToTr: words[index].translatedToTr);

    _favWords.removeAt(index);
    //_favWords.insert(0, fav);

    notifyListeners();
  }
}
