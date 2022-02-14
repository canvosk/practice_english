import 'package:flutter/material.dart';
import 'package:practice_english/ui/components/style.dart';

class MyAppBar extends StatelessWidget {
  final Color backgroundColor = Colors.transparent;
  final Text title = const Text(
    'Practice English',
    style: appBarText,
  );
  const MyAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: appBarIcon,
      backgroundColor: backgroundColor,
      elevation: 0,
      //toolbarHeight: 10,
      centerTitle: true,
      shape: shapeAppBar,
      title: title,
      //systemOverlayStyle: SystemUiOverlayStyle.dark,
    );
  }
}
