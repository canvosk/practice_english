import 'package:flutter/material.dart';
import 'package:practice_english/ui/widgets/app_bar.dart';
import 'package:practice_english/ui/widgets/list_words/list_body.dart';

class ListPage extends StatelessWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(),
      body: const ListPageBody(),
    );
  }
}
