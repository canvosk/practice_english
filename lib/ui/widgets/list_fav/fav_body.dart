import 'package:flutter/material.dart';
import 'package:practice_english/core/models/words.dart';
import 'package:practice_english/core/state/words_state.dart';
import 'package:practice_english/ui/components/style.dart';
import 'package:provider/provider.dart';

class FavPageBody extends StatelessWidget {
  const FavPageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<WordsState>(builder: (context, state, a) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: const EdgeInsets.all(0),
          width: double.infinity,
          height: double.infinity,
          child: favsList(state),
        ),
      );
    });
  }

  ListView favsList(WordsState state) {
    return ListView.builder(
        itemCount: state.favs.length,
        itemBuilder: (context, index) {
          return listCard(state, index);
        });
  }

  Card listCard(WordsState state, int index) {
    return Card(
      //color: Colors.amber[900],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      elevation: 4,
      child: ListTile(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        title: Text(
          state.favs[index].englishWords,
          style:
              const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(state.favs[index].translatedToTr),
        trailing: const Icon(Icons.favorite, color: Colors.red),
        onTap: () {
          state.delFromFav(index);
        },
      ),
    );
  }

  Widget myCard(Words x, WordsState state) {
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
    //int index = state.favs.indexOf(x);

    return ListView.builder(
      itemCount: state.favs.length,
      itemBuilder: (context, index) {
        return ListTile(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          title: Text(
            state.words[index].englishWords,
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(state.words[index].translatedToTr),
          trailing: const Icon(Icons.favorite, color: Colors.red),
          onTap: () {
            state.delFromFav(index);
          },
        );
      },
    );

    // return ListTile(
    //   contentPadding:
    //       const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
    //   title: Text(
    //     state.words[index].englishWords,
    //     style:
    //         const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
    //   ),
    //   subtitle: Text(state.words[index].translatedToTr),
    //   trailing:
    //       const Icon(Icons.star_rounded, color: Colors.yellow, size: 30.0),
    //   onTap: () {
    //     state.delFromFav(index);
    //   },
    // );
  }
}
