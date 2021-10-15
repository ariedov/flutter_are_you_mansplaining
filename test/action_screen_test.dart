import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mansplaining/logic/answer.dart';
import 'package:mansplaining/logic/screens.dart';
import 'package:mansplaining/ui/actionable_screen.dart';

import 'ui_test_util.dart';

void main() {
  testWidgets('Did she ask to explain screen test', (tester) async {
    var screen = DidSheAskToExplainThisScreen();

    List<ScreenActionPair> callbackEvents = [];
    await tester.pumpWidget(boilerplate(ScreenWidget(
      screen: screen,
      callback: (context, screen, action) =>
          callbackEvents.add(ScreenActionPair(screen, action)),
    )));

    final titleFinder = find.text(screen.title);
    expect(titleFinder, findsOneWidget);

    final noActionFinder = find.text(No().name);
    final yesActionFinder = find.text(Yes().name);
    expect(noActionFinder, findsOneWidget);
    expect(yesActionFinder, findsOneWidget);

    await tester.tap(noActionFinder);
    expect(callbackEvents[0].screen, screen);
    expect(callbackEvents[0].action, isInstanceOf<No>());

    await tester.tap(yesActionFinder);
    expect(callbackEvents[1].screen, screen);
    expect(callbackEvents[1].action, isInstanceOf<Yes>());
  });

  testWidgets('Most men with her experience would know this screen test',
      (tester) async {
    var screen = MostMenWithHerEducationWillKnowThisScreen();

    List<ScreenActionPair> callbackEvents = [];
    await tester.pumpWidget(boilerplate(ScreenWidget(
      screen: screen,
      callback: (context, screen, action) =>
          callbackEvents.add(ScreenActionPair(screen, action)),
    )));

    final titleFinder = find.text(screen.title);
    expect(titleFinder, findsOneWidget);

    final noActionFinder = find.text(No().name);
    final yesActionFinder = find.text(Yes().name);
    expect(noActionFinder, findsOneWidget);
    expect(yesActionFinder, findsOneWidget);

    await tester.tap(noActionFinder);
    expect(callbackEvents[0].screen, screen);
    expect(callbackEvents[0].action, isInstanceOf<No>());

    await tester.tap(yesActionFinder);
    expect(callbackEvents[1].screen, screen);
    expect(callbackEvents[1].action, isInstanceOf<Yes>());
  });

  testWidgets('You asked if she needs explanation screen test', (tester) async {
    var screen = YouAskedIfSheNeedsExplanationScreen();

    List<ScreenActionPair> callbackEvents = [];
    await tester.pumpWidget(boilerplate(ScreenWidget(
      screen: screen,
      callback: (context, screen, action) =>
          callbackEvents.add(ScreenActionPair(screen, action)),
    )));

    final titleFinder = find.text(screen.title);
    expect(titleFinder, findsOneWidget);

    final sheRefusedExplanationFinder = find.text(SheRefusedExplanation().name);
    final sheAgreedToExplanationFinder =
        find.text(SheAgreedToExplanation().name);
    final noAskFinderFinder = find.text(IDidNotAskPermission().name);

    expect(sheRefusedExplanationFinder, findsOneWidget);
    expect(sheAgreedToExplanationFinder, findsOneWidget);
    expect(noAskFinderFinder, findsOneWidget);

    await tester.tap(sheRefusedExplanationFinder);
    expect(callbackEvents[0].screen, screen);
    expect(callbackEvents[0].action, isInstanceOf<SheRefusedExplanation>());

    await tester.tap(sheAgreedToExplanationFinder);
    expect(callbackEvents[1].screen, screen);
    expect(callbackEvents[1].action, isInstanceOf<SheAgreedToExplanation>());

    await tester.tap(noAskFinderFinder);
    expect(callbackEvents[2].screen, screen);
    expect(callbackEvents[2].action, isInstanceOf<IDidNotAskPermission>());
  });

  testWidgets('You have more experience screen test', (tester) async {
    var screen = YouHaveMoreExperienceScreen();

    List<ScreenActionPair> callbackEvents = [];
    await tester.pumpWidget(boilerplate(ScreenWidget(
      screen: screen,
      callback: (context, screen, action) =>
          callbackEvents.add(ScreenActionPair(screen, action)),
    )));

    final titleFinder = find.text(screen.title);
    expect(titleFinder, findsOneWidget);

    final iHaveMoreExperienceActionFinder =
        find.widgetWithText(ElevatedButton, IHaveMoreExperience().name);
    final sameExperienceActionFinder =
        find.widgetWithText(ElevatedButton, AboutTheSameExperience().name);
    final sheHasMoreExperienceActionFinder =
        find.widgetWithText(ElevatedButton, SheHasMoreExperience().name);
    final sheIsAnExpertActionFinder =
        find.widgetWithText(ElevatedButton, SheIsAnExpert().name);

    expect(iHaveMoreExperienceActionFinder, findsOneWidget);
    expect(sameExperienceActionFinder, findsOneWidget);
    expect(sheHasMoreExperienceActionFinder, findsOneWidget);
    expect(sheIsAnExpertActionFinder, findsOneWidget);

    await tester.ensureVisible(iHaveMoreExperienceActionFinder);
    await tester.tap(iHaveMoreExperienceActionFinder);
    expect(callbackEvents[0].screen, screen);
    expect(callbackEvents[0].action, isInstanceOf<IHaveMoreExperience>());

    await tester.ensureVisible(sameExperienceActionFinder);
    await tester.tap(sameExperienceActionFinder);
    expect(callbackEvents[1].screen, screen);
    expect(callbackEvents[1].action, isInstanceOf<AboutTheSameExperience>());

    await tester.ensureVisible(sheHasMoreExperienceActionFinder);
    await tester.tap(sheHasMoreExperienceActionFinder);
    expect(callbackEvents[2].screen, screen);
    expect(callbackEvents[2].action, isInstanceOf<SheHasMoreExperience>());

    await tester.ensureVisible(sheIsAnExpertActionFinder);
    await tester.tap(sheIsAnExpertActionFinder);
    expect(callbackEvents[3].screen, screen);
    expect(callbackEvents[3].action, isInstanceOf<SheIsAnExpert>());
  });
}

class ScreenActionPair {
  final Screen screen;
  final Answer action;

  ScreenActionPair(this.screen, this.action);
}
