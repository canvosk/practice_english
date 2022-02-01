import 'package:flutter/material.dart';
import 'package:practice_english/core/state/words_state.dart';

class MainPageBody extends StatelessWidget {
  const MainPageBody({Key? key}) : super(key: key);
  final String button1 = " Test Page";

  // void x() {
  //   WordsState words = WordsState();
  //   words.createWords();
  //   words.createChoice();
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(50),
      child: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  //x();
                  Navigator.pushNamed(context, "/test-page");
                },
                child: Text(button1))
          ],
        ),
      ),
    );
  }
}
