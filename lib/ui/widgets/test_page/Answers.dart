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
  int selInd = -1;
  int trueInd = -1;
  bool cond = false;
  bool isButtonDisabled = false;
  bool answerIs = true;
  bool step = true;

  checkListLenght() {
    if (_options.length == 4) {
      cond = true;
    } else {
      cond = false;
    }
  }

  void checkAnswer({required int index}) {
    setState(() {
      isButtonDisabled = true;
      step = false;
      log(_options[index]);

      var v = Provider.of<WordsState>(context, listen: false);
      if (_options[index] == v.words.first.translatedToTr) {
        trueInd = index;
        answerIs = true;
      } else {
        trueInd = _options.indexOf(v.words.first.translatedToTr);
        answerIs = false;
      }
    });
  }

  @override
  void initState() {
    var state = Provider.of<WordsState>(context, listen: false);
    isButtonDisabled = false;
    cond = false;
    step = true;
    selInd = -1;
    Future.delayed(Duration.zero).then((value) async {
      await state.createWords();
      _options = await state.createChoice();
      checkListLenght();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<WordsState>(builder: (context, state, a) {
      //var words = state.words;

      return Column(
        children: [
          textQuestion(state),
          for (var o in _options) _answer(o),
          Center(
            child: step ? null : nextQue(),
          ),
        ],
      );
    });
  }

  Center textQuestion(WordsState state) {
    return Center(
      child: cond
          ? Text(
              state.words.first.englishWords,
              style: GoogleFonts.dongle(textStyle: questionText),
            )
          : null,
    );
  }

  Widget nextQue() {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: FloatingActionButton(
        onPressed: () async {
          nextQueFunc();
        },
        backgroundColor: Colors.green,
        child: const Icon(Icons.navigate_next_sharp),
      ),
    );
  }

  nextQueFunc() async {
    setState(() {
      isButtonDisabled = false;
    });
    var state = Provider.of<WordsState>(context, listen: false);
    cond = false;
    step = true;
    selInd = -1;
    Future.delayed(Duration.zero).then((value) async {
      await state.createWords();
      _options = await state.createChoice();
      checkListLenght();
    });
  }

  Widget _answer(String option) {
    int index = _options.indexOf(option);

    return ListTile(
      title: cond ? elevatedButton(index, option) : null,
    );
  }

  ElevatedButton elevatedButton(int index, String option) {
    return ElevatedButton(
      onPressed: isButtonDisabled
          ? null
          : () {
              selectChoice(index);
            },
      child: Text(
        option,
        style: GoogleFonts.dongle(textStyle: answersText, fontSize: 35),
      ),
      style: getStyle(index),
    );
  }

  selectChoice(int index) {
    setState(() {
      isButtonDisabled = true;
    });
    selInd = index;
    step = false;
    checkAnswer(index: selInd);
  }

  ButtonStyle getStyle(int selected) {
    var v = Provider.of<WordsState>(context, listen: false);
    int abc = _options.indexOf(v.words.first.translatedToTr);
    if (step == false) {
      if (answerIs == true) {
        if (selected == selInd) {
          return trueButton;
        } else {
          return regularButton;
        }
      } else {
        if (selected == selInd) {
          return wrongButton;
        }
        while (trueInd == selected) {
          return trueButton;
        }
        return regularButton;
      }
    } else {
      return regularButton;
    }
  }
}
