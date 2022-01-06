//import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:practice_english/ui/widgets/answers.dart';
//impor'package:practice_english/ui/widgets/R,andomWords.dart't';

class MyBody extends StatefulWidget {
  const MyBody({Key? key}) : super(key: key);

  @override
  _MyBodyState createState() => _MyBodyState();
}

class _MyBodyState extends State<MyBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          //Center(
          // child: RandomWords(),
          // ),
          Answers(),
        ],
      ),
    );
  }
}
