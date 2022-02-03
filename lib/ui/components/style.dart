import 'package:flutter/material.dart';

const questionText = TextStyle(color: Colors.black);

const answersText = TextStyle(color: Colors.white);

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
