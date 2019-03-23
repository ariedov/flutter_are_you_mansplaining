import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:mansplaining/logic/screens.dart';
import 'package:mansplaining/logic/status.dart';

class ResultScreenWidget extends StatelessWidget {
  final ResultScreen screen;

  const ResultScreenWidget({Key key, this.screen}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 64.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Card(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 48.0),
                color: _buildColor(),
                child: AutoSizeText(
                  screen.title,
                  style: TextStyle(fontSize: 48.0),
                  maxLines: 4,
                  minFontSize: 48.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildColor() {
    switch (screen.status) {
      case Status.Good:
        return Colors.green;
      case Status.Bad:
        return Colors.yellow;
      case Status.Terrible:
        return Colors.orange;
      case Status.Disaster:
        return Colors.red;
    }
  }
}
