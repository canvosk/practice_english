import 'package:english_words/english_words.dart';

class Words {
  String englishWords = "";
  String toTranslateTR = "";

  String _createWords() {
    final wordPair = WordPair.random();
    englishWords = wordPair.first.toString();
    return wordPair.asPascalCase.toString();
  }

  String takeWords() {
    return _createWords();
  }

  List<String> createChoice() {
    String? trueChoice, choice2, choice3, choice4;

    trueChoice = englishWords;

    choice2 = WordPair.random().first.toString();
    choice3 = WordPair.random().first.toString();
    choice4 = WordPair.random().first.toString();

    List<String> choices = [trueChoice, choice2, choice3, choice4];

    return choices;
  }
}
