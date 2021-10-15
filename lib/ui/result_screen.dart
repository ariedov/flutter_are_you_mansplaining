import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:mansplaining/logic/screens.dart';
import 'package:mansplaining/logic/status.dart';
import 'package:share/share.dart';

class ResultScreenWidget extends StatelessWidget {
  final ResultScreen screen;
  final ResultScreenCallback startOverCallback;

  const ResultScreenWidget({Key key, this.screen, this.startOverCallback})
      : super(key: key);

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
                  style: TextStyle(fontSize: 42.0),
                  maxLines: 4,
                  minFontSize: 42.0,
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.settings_backup_restore),
                  onPressed: () => startOverCallback(context),
                ),
                SizedBox(
                  width: 16.0,
                ),
                IconButton(
                  icon: Icon(Icons.share),
                  onPressed: () => Share.share(
                      "Mainsplaining app conclusion: ${screen.title}"),
                )
              ],
            )
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

typedef ResultScreenCallback = void Function(BuildContext context);
