import 'package:flutter/material.dart';
import 'package:practice_english/ui/widgets/app_bar.dart';
import 'package:practice_english/ui/widgets/list_fav/fav_body.dart';
import 'package:practice_english/ui/widgets/list_words/list_body.dart';
import 'package:practice_english/ui/widgets/scaffold.dart';

class FavPage extends StatelessWidget {
  const FavPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return myScaffold(
      const MyAppBar(),
      const FavPageBody(),
    );
    // return Scaffold(
    //   appBar: myAppBar(),
    //   body: const FavPageBody(),
    // );
  }
}
