import 'package:flutter/material.dart';
import 'package:dietary/utils/constants.dart';
import 'package:dietary/widgets/schedule_meals_dialog.dart';

class ConfigDietray extends StatelessWidget {
  const ConfigDietray({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        RaisedButton(
            child: Text(
              'Config Your Daily Meal Times',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return ScheduleMealsDialog();
                },
              );
            }),
        RaisedButton(
          child: Text(
            'Config Your Weekly Diet',
            style: TextStyle(
              fontSize: 18.0,
            ),
          ),
          onPressed: () => Navigator.pushNamed(
            context,
            configScreenRoute,
          ),
        ),
      ],
    );
  }
}
