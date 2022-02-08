import 'package:flutter/material.dart';

//TEXT

const appBarText = TextStyle(color: Colors.black);

const mainPageText =
    TextStyle(color: Colors.white, fontWeight: FontWeight.bold);

const mainPageSub = TextStyle(color: Colors.white);

const questionText = TextStyle(color: Colors.black, fontSize: 80);

const answersText = TextStyle(color: Colors.white);

//ICONS

const Icon trueIcon = Icon(
  Icons.check_circle_sharp,
  color: Colors.green,
  size: 45,
);

const Icon wrongIcon = Icon(
  Icons.cancel_sharp,
  color: Colors.red,
  size: 45,
);

//BUTTONS

ButtonStyle regularButton = ButtonStyle(
  shape:
      MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(20.0),
  )),
);

ButtonStyle trueButton = ButtonStyle(
  backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
  shape:
      MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(20.0),
  )),
);

ButtonStyle wrongButton = ButtonStyle(
  backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
  shape:
      MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(20.0),
  )),
);

//DECORATIONS

BoxDecoration listPageDec = BoxDecoration(
  color: const Color.fromRGBO(236, 240, 241, .6),
  borderRadius: BorderRadius.circular(50),
);

//APPBAR

const shapeAppBar = RoundedRectangleBorder(
  borderRadius: BorderRadius.vertical(bottom: Radius.circular(7)),
);

//MAIN-PAGE

var gradient = BoxDecoration(
    shape: BoxShape.rectangle,
    borderRadius: BorderRadius.circular(15),
    gradient: const LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [Colors.red, Colors.purple]));
