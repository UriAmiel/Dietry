import 'package:flutter/material.dart';
import 'package:dietary/widgets/config_dietray.dart';

class WelcomeScreen extends StatelessWidget {
  WelcomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text(
              "Welcome!",
              style: TextStyle(
                fontSize: 40.0,
                letterSpacing: .0,
                shadows: [
                  Shadow(
                    color: Colors.black,
                    offset: Offset(-3.0, 3.0),
                  )
                ],
              ),
            ),
            Icon(
              Icons.restaurant,
              size: 100.0,
            ),
            Text(
              '''Welcome! It looks like this is your first time your\'e using Dietary. Please config your weekly menu, and you daily meal times.''',
              style: TextStyle(
                fontSize: 18.0,
              ),
              textAlign: TextAlign.center,
            ),
            ConfigDietray(),
          ],
        ),
      ),
    );
  }
}
