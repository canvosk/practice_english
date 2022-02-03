import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:practice_english/core/state/words_state.dart';
import 'package:practice_english/ui/components/style.dart';
import 'package:provider/provider.dart';

class Answers extends StatefulWidget {
  const Answers({Key? key}) : super(key: key);

  @override
  _AnswersState createState() => _AnswersState();
}

class _AnswersState extends State<Answers> {
  List<String> _options = <String>[];

  bool cond = false;
  checkListLenght() {
    if (_options.length == 4) {
      cond = true;
    } else {
      cond = false;
    }
  }

  bool answerIs = true;
  int step = 1;
  void checkAnswer(String word) {
    setState(() {
      step = 2;
      var v = Provider.of<WordsState>(context, listen: false);
      if (word == v.words.first.translatedToTr) {
        answerIs = true;
        //log("dogru kelime: " + word);
      } else {
        answerIs = false;
        //log("yanlis kelime: " + word);
      }
    });
  }

  @override
  void initState() {
    int sayac = 0;
    var c = Provider.of<WordsState>(context, listen: false);
    Future.delayed(Duration.zero).then((value) async {
      c.createWords();
      sayac++;
    });

    //log("Yeni Kelime: " + c.words.first.englishWords);
    if (sayac == 1) {
      Future.delayed(Duration.zero).then((value) async {
        _options = await c.createChoice();
        log("Siklar: " + _options.toString());
        checkListLenght();
      });
    }
    Future.delayed(const Duration(seconds: 2));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<WordsState>(builder: (context, state, a) {
      //var words = state.words;

      return Column(
        children: [
          Center(
            child: cond
                ? Text(
                    state.words.first.englishWords,
                    style: GoogleFonts.dongle(
                        textStyle: questionText, fontSize: 80),
                  )
                : null,
          ),
          const Divider(),
          for (var o in _options) _answer(o),
          const Divider(),
          ElevatedButton(
            onPressed: () async {
              var state = Provider.of<WordsState>(context, listen: false);
              cond = false;
              step = 1;
              Future.delayed(Duration.zero).then((value) async {
                await state.createWords();
                _options = await state.createChoice();
                checkListLenght();
              });
            },
            child: const Text("Yeni Soruya Gec"),
          )
        ],
      );
    });
  }

  Widget _answer(String option) {
    int index = _options.indexOf(option);
    return ListTile(
      title: cond
          ? ElevatedButton(
              onPressed: () {
                checkAnswer(_options[index]);
              },
              child: Text(
                option,
                style: GoogleFonts.dongle(textStyle: answersText, fontSize: 35),
              ),
              style: getStyle(index),
            )
          : null,
    );
  }

  ButtonStyle getStyle(int index) {
    if (step == 2) {
      if (answerIs == true) {
        return trueButton;
      } else {
        return wrongButton;
      }
    } else {
      return regularButton;
    }
  }
}
