import 'package:flutter/material.dart';
import 'package:practice_english/ui/components/style.dart';

SafeArea myScaffold(AppBar appbar, Widget body) {
  return SafeArea(
    top: true,
    bottom: true,
    child: Scaffold(
      appBar: appbar,
      body: body,
    ),
  );
}
