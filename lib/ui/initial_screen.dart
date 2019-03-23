import 'package:flutter/material.dart';

class InitialScreenWidget extends StatelessWidget {

  final VoidCallback startFlowCallback;

  const InitialScreenWidget({Key key, this.startFlowCallback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              "Are you mansplaining?",
              style: TextStyle(fontSize: 48.0),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 32.0),
          RaisedButton(
            child: Text(
                "Let's find out!",
                style: TextStyle(fontSize: 28.0),
            ),
            onPressed: startFlowCallback,
          ),
        ],
      ),
    );
  }
}