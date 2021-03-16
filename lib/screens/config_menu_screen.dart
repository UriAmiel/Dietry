import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:provider/provider.dart';
import 'package:dietary/widgets/daily_meals.dart';
import 'package:dietary/widgets/animated_food_quotes.dart';
import 'package:dietary/models/database.dart';
import 'package:dietary/services/prefernces_manager.dart';
import 'package:dietary/utils/constants.dart';

const kDays = [
  'Sunday',
  'Monday',
  'Tuesday',
  'Wednesday',
  'Thursday',
  'Friday',
  'Saturday',
];

class ConfigMenuScreen extends StatefulWidget {
  @override
  _ConfigMenuScreenState createState() => _ConfigMenuScreenState();
}

class _ConfigMenuScreenState extends State<ConfigMenuScreen> {
  bool defaultSet = false;

  void insertDefaultValue(MealConfigDao md) async {
    for (var day in kDays) {
      List<MealConfig> dailyConfig = await md.getDailyConfig(day: day);
      if (dailyConfig.length == 0) await md.insertDailyConfig(day: day);
    }
    setCurrentConfig(defaultConfigName);
    markAsConfiged();
    if (defaultSet) {
      setState(() {
        defaultSet = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final mealConfigDao = Provider.of<AppDatabase>(context).mealConfigDao;
    insertDefaultValue(mealConfigDao);
    return Scaffold(
      appBar: AppBar(
        title: Text('Dietray'),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.done,
            ),
            onPressed: () {
              Navigator.pushNamed(context, dayScreenRoute);
            },
          ),
        ],
      ),
      body: defaultSet
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Swiper(
                      itemBuilder: (context, int index) {
                        return DailyMeals(
                          day: kDays[index],
                          getMealStream: (String mealName) =>
                              mealConfigDao.watchMealConfig(
                                  day: kDays[index], mealName: mealName),
                          updateData: (
                              {String mealName,
                              int carbs,
                              int fats,
                              int vegies,
                              int proteins}) {
                            mealConfigDao.updateMealConfigNutrions(
                              name: defaultConfigName,
                              weekDay: kDays[index],
                              mealName: mealName,
                              carbs: carbs,
                              fats: fats,
                              vegies: vegies,
                              proteins: proteins,
                            );
                          },
                        );
                      },
                      itemCount: 7,
                      pagination: SwiperPagination(
                        builder: DotSwiperPaginationBuilder(color: Colors.grey),
                      ),
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
