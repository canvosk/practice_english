import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:practice_english/ui/components/style.dart';

AppBar myAppBar() {
  return AppBar(
    iconTheme: appBarIcon,
    backgroundColor: Colors.transparent,
    elevation: 0,
    //toolbarHeight: 10,
    centerTitle: true,
    shape: shapeAppBar,
    title: const Text(
      'Practice English',
      style: appBarText,
    ),
    //systemOverlayStyle: SystemUiOverlayStyle.dark,
  );
}
