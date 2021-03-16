import 'package:flutter/material.dart';
import 'package:dietary/widgets/meal_nutrions.dart';
import 'package:dietary/utils/constants.dart';

class DailyMeals extends StatelessWidget {
  final String day;
  final Map<String, Map<String, dynamic>> goals;
  final Function getMealStream;
  final Function updateData;

  const DailyMeals(
      {Key key,
      @required this.day,
      this.getMealStream,
      this.updateData,
      this.goals})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 10.0,
        vertical: 10.0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            day,
            textAlign: TextAlign.center,
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
          MealNutrions(
            name: breakfast,
            stream: getMealStream(breakfast),
            goals: goals == null ? null : goals[breakfast],
            updateData: ({int carbs, int fats, int vegies, int proteins}) {
              updateData(
                mealName: breakfast,
                carbs: carbs,
                fats: fats,
                vegies: vegies,
                proteins: proteins,
              );
            },
          ),
          MealNutrions(
            name: lunch,
            goals: goals == null ? null : goals[lunch],
            stream: getMealStream(lunch),
            updateData: ({int carbs, int fats, int vegies, int proteins}) {
              updateData(
                mealName: lunch,
                carbs: carbs,
                fats: fats,
                vegies: vegies,
                proteins: proteins,
              );
            },
          ),
          MealNutrions(
            name: dinner,
            goals: goals == null ? null : goals[dinner],
            stream: getMealStream(dinner),
            updateData: ({int carbs, int fats, int vegies, int proteins}) {
              updateData(
                mealName: dinner,
                carbs: carbs,
                fats: fats,
                vegies: vegies,
                proteins: proteins,
              );
            },
          ),
        ],
      ),
    );
  }
}
