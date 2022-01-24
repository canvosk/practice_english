//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practice_english/core/state/words_state.dart';
import 'package:practice_english/ui/pages/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => WordsState(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Practice English',
        home: HomePage(),
      ),
    );
  }
}
