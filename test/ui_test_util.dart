import 'package:flutter/material.dart';

Widget boilerplate(Widget screen) {
  return Directionality(
    child: MediaQuery(
      data: MediaQueryData(),
      child: screen,
    ),
    textDirection: TextDirection.ltr,
  );
}
