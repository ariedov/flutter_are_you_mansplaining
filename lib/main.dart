import 'package:flutter/material.dart';
import 'package:mansplaining/logic/navigator.dart';
import 'package:mansplaining/logic/screens.dart';
import 'package:mansplaining/ui/actionable_screen.dart';
import 'package:mansplaining/ui/initial_screen.dart';
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
    return InitialScreenWidget(
      startFlowCallback: () =>
        _navigateToNewScreen(context, _createScreenWidget(context, navigator.first)));
  }

  _createScreenWidget(BuildContext context, Screen screen) {
    Widget screenWidget;
    if (screen is ActionableScreen) {
      screenWidget = ScreenWidget(
        screen: screen,
        callback: (screen, action) {
          _navigateToNewScreen(context, _createScreenWidget(context, navigator.navigate(screen, action)));
        },
      );
    }

    if (screen is ResultScreen) {
      screenWidget = ResultScreenWidget(
        screen: screen,
      );
    }

    return screenWidget;
  }

  _navigateToNewScreen(BuildContext context, Widget screen) {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return screen;
    }));
  }
}
