import 'package:flutter/material.dart';
import 'package:practice_english/ui/components/style.dart';

AppBar myAppBar() {
  return AppBar(
    //backgroundColor: const Color.fromRGBO(2, 53, 53, .8),
    elevation: 0,
    centerTitle: true,
    shape: shapeAppBar,
    title: const Text(
      'Practice English',
    ),
  );
}
