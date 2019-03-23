import 'package:flutter/material.dart';
import 'package:mansplaining/logic/action.dart';
import 'package:mansplaining/logic/navigator.dart';
import 'package:mansplaining/logic/screens.dart';
import 'package:mansplaining/ui/actionable_screen.dart';
import 'package:mansplaining/ui/result_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final navigator = NavigatorReducer();

  @override
  Widget build(BuildContext context) {
    return ScreenWidget(
      screen: DidSheAskToExplainThisScreen(),
      callback: (screen, action) {
        _navigateToNewScreen(context, screen, action);
      },
    );
  }

  _navigateToNewScreen(BuildContext context, Screen screen, Action action) {
    var newScreen = navigator.navigate(screen, action);

    Widget screenWidget;
    if (newScreen is ActionableScreen) {
      screenWidget = ScreenWidget(
        screen: newScreen,
        callback: (screen, action) {
          _navigateToNewScreen(context, screen, action);
        },
      );
    }

    if (newScreen is ResultScreen) {
      screenWidget = ResultScreenWidget(
        screen: newScreen,
      );
    }

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return screenWidget;
    }));
  }
}
