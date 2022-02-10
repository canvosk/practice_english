import 'package:flutter/material.dart';

//TEXT

const appBarText = TextStyle(color: Colors.black);

const mainPageText = TextStyle(
  color: Colors.white,
  fontSize: 20,
  fontWeight: FontWeight.bold,
  shadows: [
    Shadow(
      offset: Offset(1, 0.5),
      blurRadius: 8.0,
      color: Color.fromARGB(255, 0, 0, 0),
    ),
  ],
);

const mainPageSub = TextStyle(
  color: Colors.white,
  fontStyle: FontStyle.italic,
  shadows: [
    Shadow(
      offset: Offset(1, 0.5),
      blurRadius: 8.0,
      color: Color.fromARGB(255, 0, 0, 0),
    ),
  ],
);

const questionText = TextStyle(color: Colors.black, fontSize: 80);

const answersText = TextStyle(color: Colors.white);

// TextStyle(
//     shadows: <Shadow>[
//       Shadow(
//         offset: Offset(10.0, 10.0),
//         blurRadius: 3.0,
//         color: Color.fromARGB(255, 0, 0, 0),
//       ),
//       Shadow(
//         offset: Offset(10.0, 10.0),
//         blurRadius: 8.0,
//         color: Color.fromARGB(125, 0, 0, 255),
//       ),
//     ],

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

var redToPurpleGradient = BoxDecoration(
    shape: BoxShape.rectangle,
    borderRadius: BorderRadius.circular(15),
    gradient: const LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [Colors.red, Colors.purple]));

var yellowToOrangeGradient = BoxDecoration(
    shape: BoxShape.rectangle,
    borderRadius: BorderRadius.circular(15),
    gradient: const LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [Colors.yellow, Colors.orange]));

var blueToBlueGradient = BoxDecoration(
    shape: BoxShape.rectangle,
    borderRadius: BorderRadius.circular(15),
    gradient: const LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [Colors.blueAccent, Colors.blue]));
