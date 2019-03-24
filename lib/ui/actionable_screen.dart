import 'package:flutter/material.dart';
import 'package:mansplaining/logic/action.dart';
import 'package:mansplaining/logic/screens.dart';
import 'package:auto_size_text/auto_size_text.dart';

class ScreenWidget extends StatelessWidget {
  final ActionableScreen screen;
  final ScreenCallback callback;

  const ScreenWidget({Key key, this.screen, this.callback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 60.0, vertical: 32.0),
                child: Card(
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: AutoSizeText(
                      screen.title,
                      style: TextStyle(fontSize: 64.0),
                      maxLines: 4,
                      minFontSize: 48.0,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 50,),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: screen.actions
                    .map((action) => _buildActionButton(context, action))
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActionButton(BuildContext context, Action action) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: RaisedButton(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(8.0),
          child: Text(
            action.name,
            style: TextStyle(fontSize: 24),
          ),
        ),
        onPressed: () => callback(context, screen, action),
      ),
    );
  }
}

typedef ScreenCallback = void Function(
    BuildContext context, Screen screen, Action action);
