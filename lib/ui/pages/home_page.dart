import 'package:flutter/material.dart';
import 'package:practice_english/ui/widgets/AppBar.dart';
import 'package:practice_english/ui/widgets/Body.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(),
      resizeToAvoidBottomInset: false,
      body: const MyBody(),
    );
  }
}
