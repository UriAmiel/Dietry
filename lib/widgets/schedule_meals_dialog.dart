import 'package:flutter/material.dart';
import 'package:dietary/services/notification_manger.dart';
import 'package:dietary/services/prefernces_manager.dart';
import 'package:dietary/utils/constants.dart';

class ScheduleMealsDialog extends StatefulWidget {
  const ScheduleMealsDialog({
    Key key,
  }) : super(key: key);

  @override
  _ScheduleMealsDialogState createState() => _ScheduleMealsDialogState();
}

class _ScheduleMealsDialogState extends State<ScheduleMealsDialog> {
  bool mealTimesLoading = true;
  TimeOfDay breakfastTime;
  TimeOfDay lunchTime;
  TimeOfDay dinnerTime;

  void getMealTimes() async {
    breakfastTime =
        await getMealTime(breakfast) ?? TimeOfDay(hour: 8, minute: 30);
    lunchTime = await getMealTime(lunch) ?? TimeOfDay(hour: 13, minute: 00);
    dinnerTime = await getMealTime(dinner) ?? TimeOfDay(hour: 19, minute: 00);
    setState(() {
      mealTimesLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getMealTimes();
  }

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Text('Config Times'),
      contentPadding: EdgeInsets.all(20.0),
      elevation: 10.0,
      children: mealTimesLoading
          ? [CircularProgressIndicator()]
          : [
              MealScheduler(
                mealName: breakfast,
                initialTime: breakfastTime,
                notificitionId: 0,
              ),
              MealScheduler(
                mealName: lunch,
                initialTime: lunchTime,
                notificitionId: 1,
              ),
              MealScheduler(
                mealName: dinner,
                initialTime: dinnerTime,
                notificitionId: 2,
              ),
            ],
    );
  }
}

class MealScheduler extends StatelessWidget {
  final String mealName;
  final TimeOfDay initialTime;
  final int notificitionId;

  const MealScheduler({
    Key key,
    @required this.mealName,
    @required this.initialTime,
    @required this.notificitionId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text('Choose $mealName Time'),
      onPressed: () async {
        TimeOfDay selectedTime = await showTimePicker(
          context: context,
          initialTime: initialTime,
        );
        selectedTime = selectedTime ?? initialTime;
        await scheduleNotifications(
          selectedTime: selectedTime,
          title: '$mealName Time!',
          description: 'Keep us updated about what you ate',
          notificationId: notificitionId,
        );
        await setMealTime(mealName, selectedTime);
      },
    );
  }
}
