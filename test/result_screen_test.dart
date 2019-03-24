import 'package:flutter_test/flutter_test.dart';
import 'package:mansplaining/logic/screens.dart';
import 'package:mansplaining/ui/result_screen.dart';
import 'package:flutter/material.dart';

import 'ui_test_util.dart';

void main() {
  testWidgets('Not mansplaining screen test', (tester) async {
    final screen = NotMansplainingScreen();

    var called = false;
    await tester.pumpWidget(boilerplate(ResultScreenWidget(
      screen: screen,
      startOverCallback: (context) => called = true,
    )));

    final titleFinder = find.text(screen.title);
    expect(titleFinder, findsOneWidget);

    await tester.tap(find.byIcon(Icons.settings_backup_restore));
    expect(called, true);
  });

  testWidgets('Probably mansplaining screen test', (tester) async {
    final screen = ProbablyMansplainingScreen();

    var called = false;
    await tester.pumpWidget(boilerplate(ResultScreenWidget(
      screen: screen,
      startOverCallback: (context) => called = true,
    )));

    final titleFinder = find.text(screen.title);
    expect(titleFinder, findsOneWidget);

    await tester.tap(find.byIcon(Icons.settings_backup_restore));
    expect(called, true);
  });

  testWidgets('Definitely mansplaining screen test', (tester) async {
    final screen = DefinitelyMansplainingScreen();

    var called = false;
    await tester.pumpWidget(boilerplate(ResultScreenWidget(
      screen: screen,
      startOverCallback: (context) => called = true,
    )));

    final titleFinder = find.text(screen.title);
    expect(titleFinder, findsOneWidget);

    await tester.tap(find.byIcon(Icons.settings_backup_restore));
    expect(called, true);
  });

  testWidgets('Stop now screen test', (tester) async {
    final screen = StopNowScreen();

    var called = false;
    await tester.pumpWidget(boilerplate(ResultScreenWidget(
      screen: screen,
      startOverCallback: (context) => called = true,
    )));

    final titleFinder = find.text(screen.title);
    expect(titleFinder, findsOneWidget);

    await tester.tap(find.byIcon(Icons.settings_backup_restore));
    expect(called, true);
  });
}