import 'package:dietary/widgets/config_dietray.dart';
import 'package:flutter/material.dart';
import 'package:dietary/widgets/daily_meals.dart';
import 'package:dietary/widgets/animated_food_quotes.dart';
import 'package:dietary/models/database.dart';
import 'package:provider/provider.dart';

const kDays = [
  'Monday',
  'Tuesday',
  'Wednesday',
  'Thursday',
  'Friday',
  'Saturday',
  'Sunday',
];

class DayScreen extends StatefulWidget {
  @override
  _DayScreenState createState() => _DayScreenState();
}

class _DayScreenState extends State<DayScreen> {
  final String day = kDays[DateTime.now().weekday - 1];
  bool loadAll = false;
  Map<String, Map<String, dynamic>> goals = Map();

  Future<void> insertDefaultValue(MealDao md) async {
    List<Meal> dailyConfig = await md.getDailyMeals(date: DateTime.now());
    if (dailyConfig.length == 0)
      await md.insertDailyMeals(date: DateTime.now());
  }

  void loadData(MealDao mealDao, MealConfigDao mealConfigDao) async {
    if (!loadAll) {
      await insertDefaultValue(mealDao);
      List<MealConfig> dailyMealConfigs =
          await mealConfigDao.getDailyConfig(day: day);
      for (MealConfig mealConfig in dailyMealConfigs) {
        goals[mealConfig.mealName] = mealConfig.toJson();
      }
      setState(() {
        loadAll = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final mealConfigDao = Provider.of<AppDatabase>(context).mealConfigDao;
    final mealDao = Provider.of<AppDatabase>(context).mealDao;
    loadData(mealDao, mealConfigDao);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Dietray'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.tune),
            onPressed: () => showModalBottomSheet(
              context: context,
              builder: (context) {
                return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ConfigDietray(),
                );
              },
            ),
          ),
        ],
      ),
      body: !loadAll
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: DailyMeals(
                      day: day,
                      goals: goals,
                      getMealStream: (String meal) =>
                          mealDao.watchMeal(name: meal),
                      updateData: (
                          {String mealName,
                          int carbs,
                          int fats,
                          int vegies,
                          int proteins}) {
                        mealDao.updateMealNutrions(
                          name: mealName,
                          carbs: carbs,
                          fats: fats,
                          vegies: vegies,
                          proteins: proteins,
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  AnimatedFoodQuotes(),
                ],
              ),
            ),
    );
  }
}
