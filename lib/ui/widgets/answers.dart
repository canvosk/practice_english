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
  List<String> _options = <String>[
    "Answer 1",
    "Answer 2",
    "Answer 3",
    "Answer 4",
  ];
  int? selectedAnswer;

  WordsState words = WordsState();

  //@override
  // void initState() {
  //   super.initState();
  //   words.createWords();
  //   words.createChoice();

  //   for (var a in words.option) {
  //     log("a: " + a);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Consumer<WordsState>(builder: (context, state, a) {
      //var words = state.words;

      return Column(
        children: [
          Center(
            child: Text(
              state.words.first.englishWords,
              style: GoogleFonts.dongle(textStyle: questionText, fontSize: 80),
            ),
          ),
          const Divider(),
          for (var o in _options) _answer(o),
          const Divider(),
          ElevatedButton(
            onPressed: () async {
              var state = Provider.of<WordsState>(context, listen: false);
              await state.createWords();
              _options = await state.createChoice();
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
      title: Text(
        option,
        style: GoogleFonts.dongle(textStyle: questionText, fontSize: 35),
      ),
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
