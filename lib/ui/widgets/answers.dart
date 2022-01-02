import 'package:flutter/material.dart';
import 'package:practice_english/models/words.dart';

class Answers extends StatefulWidget {
  const Answers({Key? key}) : super(key: key);

  @override
  _AnswersState createState() => _AnswersState();
}

class _AnswersState extends State<Answers> {
  @override
  Widget build(BuildContext context) {
    Words takeChoices = Words();
    List<String> choices = takeChoices.createChoice();
    setState(() {
      choices = takeChoices.createChoice();
    });

    debugPrint(choices[1]);
    return Container(
      padding: const EdgeInsets.all(25),
      child: Column(
        children: [
          ListView.builder(
              itemCount: choices.length,
              itemBuilder: (BuildContext context, int index) {
                return ElevatedButton(
                  onPressed: null,
                  child: Text(choices[index]),
                );
              })
        ],
      ),
    );
  }
}
