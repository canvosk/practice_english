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
  int? selectedAnswer;
  WordsState words = WordsState();
  List<String> _options = <String>[
    // "Answer 1",
    // "Answer 2",
    // "Answer 3",
    // "Answer 4",
  ];

  bool cond = false;
  sorgu() {
    if (_options.length == 4) {
      cond = true;
    } else {
      cond = false;
    }
  }

  @override
  void initState() {
    var c = Provider.of<WordsState>(context, listen: false);
    Future.delayed(Duration.zero).then((value) async {
      Provider.of<WordsState>(context, listen: false).createWords();
    });

    log("Yeni Kelime: " + c.words.first.englishWords);

    Future.delayed(Duration.zero).then((value) async {
      _options =
          await Provider.of<WordsState>(context, listen: false).createChoice();
    });

    log("Siklar: " + _options.toString());
    sorgu();
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
              Future.delayed(Duration.zero).then((value) async {
                await state.createWords();
                _options = await state.createChoice();
                sorgu();
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
          ? Text(
              option,
              style: GoogleFonts.dongle(textStyle: questionText, fontSize: 35),
            )
          : null,
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
