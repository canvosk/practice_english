import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:practice_english/core/models/words.dart';
//import 'package:practice_english/core/models/words.dart';
//import 'package:practice_english/core/models/words.dart';
import 'package:practice_english/core/state/words_state.dart';
//import 'package:practice_english/ui/components/style.dart';
import 'package:provider/provider.dart';

// class ListPageBody extends StatelessWidget {
//   const ListPageBody({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {

// }

class ListPageBody extends StatefulWidget {
  const ListPageBody({Key? key}) : super(key: key);

  @override
  State<ListPageBody> createState() => _ListPageBodyState();
}

class _ListPageBodyState extends State<ListPageBody> {
  @override
  Widget build(BuildContext context) {
    return Consumer<WordsState>(
      builder: (context, state, a) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            padding: const EdgeInsets.all(0),
            width: double.infinity,
            height: double.infinity,
            child: wordsList(state),
          ),
        );
      },
    );
  }

  ListView wordsList(WordsState state) {
    return ListView.builder(
        itemCount: state.words.length,
        itemBuilder: (context, index) {
          return listCard(state, index);
        });
  }

  Card listCard(WordsState state, int index) {
    final bool alreadySaved;
    if (state.favs.isEmpty) {
      alreadySaved = false;
    } else {
      Words w = state.words[index];
      alreadySaved = state.favs.contains(w);
    }

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      elevation: 4,
      child: ListTile(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        title: Text(
          state.words[index].englishWords,
          style:
              const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(state.words[index].translatedToTr),
        trailing: Icon(
          alreadySaved ? Icons.favorite : Icons.favorite_border,
          color: alreadySaved ? Colors.red : null,
          semanticLabel: alreadySaved ? 'Remove from saved' : 'Save',
        ),
        onTap: () {
          Words a = state.words[index];
          setState(() {
            if (alreadySaved) {
              state.favs.remove(a);
            } else {
              state.favs.insert(0, a);
            }
          });
        },
      ),
    );
  }
}
