import 'package:flutter/material.dart';
import 'package:mansplaining/logic/action.dart';
import 'package:mansplaining/logic/screens.dart';
import 'package:auto_size_text/auto_size_text.dart';

class ScreenWidget extends StatelessWidget {
  final ActionableScreen screen;

  const ScreenWidget({Key key, this.screen}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 60.0),
                  child: Card(
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: AutoSizeText(
                        screen.title,
                        style: TextStyle(fontSize: 72.0),
                        maxLines: 5,
                        minFontSize: 48.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:
                screen.actions.map(_buildActionButton).toList(),
          ),
          SizedBox(height: 100)
        ],
      ),
    );
  }

  Widget _buildActionButton(Action action) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: RaisedButton(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            action.name,
            style: TextStyle(fontSize: 24),
          ),
        ),
        onPressed: () {},
      ),
    );
  }
}
