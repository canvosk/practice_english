import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:practice_english/models/words.dart';

class Answers extends StatefulWidget {
  const Answers({Key? key}) : super(key: key);

  @override
  _AnswersState createState() => _AnswersState();
}

class _AnswersState extends State<Answers> {
  Words words = Words();
  List<String> getOptions = [];

  final List<String> _options = <String>[
    "Answer 1",
    "Answer 2",
    "Answer 3",
    "Answer 4",
  ];
  int? selectedAnswer;

  @override
  Widget build(BuildContext context) {
    setState(() {
      words.takeWords();
    });
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 100),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _question,
                const Divider(),
                for (var o in _options) _answer(o),
                const Divider(),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 100,
            width: double.infinity,
            color: Colors.yellow,
            child: MaterialButton(
              onPressed: () {
                if (selectedAnswer != null) {
                  log("Selected answer is $selectedAnswer");
                } else {
                  log("you must select an answer before submitting");
                }
              },
              child: Text(words.englishWords.keys.last +
                  " " +
                  words.englishWords.values.last),
            ),
          ),
        ),
      ],
    );
  }

  Widget get _question => Container(
        width: double.infinity,
        color: Colors.red,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: const Text(
          "ENG KELIME",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24),
        ),
      );

  Widget _answer(String option) {
    int index = _options.indexOf(option);
    return ListTile(
      title: Text(option),
      selectedColor: Colors.blue,
      selected: index == selectedAnswer,
      onTap: () {
        if (!mounted) return;
        setState(() {
          selectedAnswer = index;
        });
        log("option #$index is checked");
      },
    );
  }
}
