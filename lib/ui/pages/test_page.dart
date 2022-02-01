import 'package:flutter/material.dart';
import 'package:practice_english/ui/widgets/AppBar.dart';
import 'package:practice_english/ui/widgets/test_page/Body.dart';

class TestPage extends StatelessWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(),
      resizeToAvoidBottomInset: false,
      body: const MyBody(),
    );
  }
}