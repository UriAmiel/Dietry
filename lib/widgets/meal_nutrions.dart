import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:dietary/widgets/nutrition.dart';
import 'package:dietary/utils/constants.dart';

class MealNutrions extends StatelessWidget {
  final String name;
  final Stream stream;
  final Map<String, dynamic> goals;
  final Function updateData;

  const MealNutrions({
    Key key,
    this.name,
    this.stream,
    this.updateData,
    this.goals,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: stream,
      builder: (context, snapshot) {
        int carbs;
        int vegies;
        int proteins;
        int fats;
        if (snapshot.data == null) {
          carbs = 0;
          vegies = 0;
          proteins = 0;
          fats = 0;
        } else {
          carbs = snapshot.data.carbs;
          vegies = snapshot.data.vegies;
          proteins = snapshot.data.proteins;
          fats = snapshot.data.fats;
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  name,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Spacer(flex: 1),
                goals == null
                    ? Container()
                    : IconButton(
                        icon: Icon(Icons.done, color: Colors.greenAccent),
                        onPressed: () {
                          updateData(
                            carbs: goals[carbsName.toLowerCase()],
                            vegies: goals[vegiesName.toLowerCase()],
                            fats: goals[fatsName.toLowerCase()],
                            proteins: goals[proteinsName.toLowerCase()],
                          );
                        },
                      ),
              ],
            ),
            SizedBox(height: 5.0),
            Row(
              children: <Widget>[
                Nutrition(
                  name: carbsName,
                  icon: MaterialCommunityIcons.baguette,
                  goal: goals == null ? null : goals[carbsName.toLowerCase()],
                  count: carbs,
                  updateData: (int count) {
                    updateData(carbs: count);
                  },
                ),
                SizedBox(width: 2.0),
                Nutrition(
                  name: vegiesName,
                  icon: FontAwesome5Solid.carrot,
                  count: vegies,
                  goal: goals == null ? null : goals[vegiesName.toLowerCase()],
                  updateData: (int count) {
                    updateData(vegies: count);
                  },
                ),
                SizedBox(width: 2.0),
                Nutrition(
                  name: fatsName,
                  icon: MaterialCommunityIcons.oil,
                  count: fats,
                  goal: goals == null ? null : goals[fatsName.toLowerCase()],
                  updateData: (int count) {
                    updateData(fats: count);
                  },
                ),
                SizedBox(width: 2.0),
                Nutrition(
                  name: proteinsName,
                  icon: FontAwesome5Solid.drumstick_bite,
                  count: proteins,
                  goal:
                      goals == null ? null : goals[proteinsName.toLowerCase()],
                  updateData: (int count) {
                    updateData(proteins: count);
                  },
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
