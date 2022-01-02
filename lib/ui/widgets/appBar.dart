import 'package:flutter/material.dart';

AppBar myAppBar() {
  return AppBar(
    centerTitle: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
    ),
    title: const Text('Practice English'),
  );
}
