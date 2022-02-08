import 'package:flutter/material.dart';
import 'package:practice_english/core/models/words.dart';
import 'package:practice_english/core/state/words_state.dart';
import 'package:practice_english/ui/components/style.dart';
import 'package:provider/provider.dart';

class ListPageBody extends StatelessWidget {
  const ListPageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<WordsState>(
      builder: (context, state, a) {
        return Column(
          children: [
            //myCard(Words x, WordsState state),
            for (var o in state.words) myCard(o, state),
          ],
        );
      },
    );
  }

  Container myCard(Words x, WordsState state) {
    return Container(
      padding: const EdgeInsets.all(0),
      decoration: listPageDec,
      child: Card(
        elevation: 8.0,
        margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
        child: Container(
          child: _words(x, state),
        ),
      ),
    );
  }

  Widget _words(Words x, WordsState state) {
    int index = state.words.indexOf(x);

    return ListTile(
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      title: Text(
        state.words[index].englishWords,
        style:
            const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(state.words[index].translatedToTr),
      trailing: const Icon(Icons.favorite, color: Colors.red, size: 30.0),
    );
  }
}
