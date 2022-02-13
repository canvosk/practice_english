import 'package:flutter/material.dart';
import 'package:practice_english/ui/widgets/app_bar.dart';
import 'package:practice_english/ui/widgets/main_page/main_page_boyd.dart';
import 'package:practice_english/ui/widgets/scaffold.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return myScaffold(
      myAppBar(),
      const MainPageBody(),
    );
  }
}
