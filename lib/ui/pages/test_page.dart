import 'package:flutter/material.dart';
import 'package:practice_english/ui/widgets/app_bar.dart';
import 'package:practice_english/ui/widgets/scaffold.dart';
import 'package:practice_english/ui/widgets/test_page/body.dart';

class TestPage extends StatelessWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return myScaffold(
      const MyAppBar(),
      const MyBody(),
    );
    // return Scaffold(
    //   appBar: myAppBar(),
    //   resizeToAvoidBottomInset: false,
    //   body: const MyBody(),
    // );
  }
}
