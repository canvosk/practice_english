import 'package:flutter/material.dart';
import 'package:practice_english/ui/components/style.dart';

SafeArea myScaffold(Widget appbar, Widget body) {
  return SafeArea(
    top: true,
    bottom: true,
    child: Scaffold(
      appBar: PreferredSize(
        child: appbar,
        preferredSize: const Size.fromHeight(55),
      ),
      body: body,
    ),
  );
}
