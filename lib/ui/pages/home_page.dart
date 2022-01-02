import 'package:flutter/material.dart';
import 'package:practice_english/ui/widgets/appBar.dart';
import 'package:practice_english/ui/widgets/body.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(),
      body: const MyBody(),
    );
  }
}
