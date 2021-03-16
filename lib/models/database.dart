import 'package:moor/moor.dart';
import 'package:moor_flutter/moor_flutter.dart';
import 'package:dietary/models/tables/meal_configs.dart';
import 'package:dietary/models/tables/meals.dart';
import 'package:dietary/utils/constants.dart';

part 'database.g.dart';

@UseMoor(tables: [MealConfigs, Meals], daos: [MealConfigDao, MealDao])
class AppDatabase extends _$AppDatabase {
  AppDatabase()
      : super((FlutterQueryExecutor.inDatabaseFolder(
          path: 'db.sqlite',
          logStatements: true,
        )));

  @override
  int get schemaVersion => 1;
}

@UseDao(tables: [MealConfigs])
class MealConfigDao extends DatabaseAccessor<AppDatabase>
    with _$MealConfigDaoMixin {
  final AppDatabase db;

  MealConfigDao(this.db) : super(db);

  Stream<List<MealConfig>> watchDailyConfig(
      {@required String day, String name = defaultConfigName}) {
    return (select(mealConfigs)
          ..where((t) => t.weekDay.equals(day) & t.name.equals(name)))
        .watch();
  }

  Future<List<MealConfig>> getDailyConfig(
      {@required String day, String name = defaultConfigName}) {
    return (select(mealConfigs)
          ..where((t) => t.weekDay.equals(day) & t.name.equals(name)))
        .get();
  }

  Future insertDailyConfig(
      {@required String day, String name = defaultConfigName}) {
    return (transaction(() async {
      await insertMealConfig(MealConfig(weekDay: day, mealName: breakfast));
      await insertMealConfig(MealConfig(weekDay: day, mealName: lunch));
      await insertMealConfig(MealConfig(weekDay: day, mealName: dinner));
    }));
  }

  Stream<MealConfig> watchMealConfig(
      {@required String day,
      @required String mealName,
      String name = defaultConfigName}) {
    return (select(mealConfigs)
          ..where((t) =>
              t.weekDay.equals(day) &
              t.name.equals(name) &
              t.mealName.equals(mealName)))
        .watchSingle();
  }

  Future insertMealConfig(MealConfig mealConfig) =>
      into(mealConfigs).insert(mealConfig);

  Future updateMealConfigNutrions({
    String name,
    String weekDay,
    String mealName,
    int carbs,
    int fats,
    int vegies,
    int proteins,
  }) =>
      (update(mealConfigs)
            ..where((t) =>
                t.weekDay.equals(weekDay) &
                t.name.equals(name) &
                t.mealName.equals(mealName)))
          .write(
        MealConfigsCompanion(
          carbs: carbs == null ? Value.absent() : Value(carbs),
          fats: fats == null ? Value.absent() : Value(fats),
          vegies: vegies == null ? Value.absent() : Value(vegies),
          proteins: proteins == null ? Value.absent() : Value(proteins),
        ),
      );
}

@UseDao(tables: [Meals])
class MealDao extends DatabaseAccessor<AppDatabase> with _$MealDaoMixin {
  final AppDatabase db;

  MealDao(this.db) : super(db);

  Expression<bool, BoolType> _sameDay(Meals t, DateTime date) {
    return t.date.year.equals(date.year) &
        t.date.month.equals(date.month) &
        t.date.day.equals(date.day);
  }

  Stream<List<Meal>> watchDailyMeals({@required DateTime date}) {
    return (select(meals)..where((t) => _sameDay(t, date))).watch();
  }

  Future<List<Meal>> getDailyMeals({@required DateTime date}) {
    return (select(meals)..where((t) => _sameDay(t, date))).get();
  }

  Stream<Meal> watchMeal({@required String name, DateTime date}) {
    if (date == null) date = DateTime.now();
    return (select(meals)
          ..where((t) => _sameDay(t, date) & t.name.equals(name)))
        .watchSingle();
  }

  Future insertMeal(Meal meal) => into(meals).insert(meal);

  Future insertDailyMeals({DateTime date}) {
    date = date ?? DateTime.now();
    return (transaction(() async {
      await insertMeal(Meal(date: date, name: breakfast));
      await insertMeal(Meal(date: date, name: lunch));
      await insertMeal(Meal(date: date, name: dinner));
    }));
  }

  Future updateMealNutrions({
    DateTime date,
    @required String name,
    int carbs,
    int fats,
    int vegies,
    int proteins,
  }) {
    date = date ?? DateTime.now();
    return (update(meals)
          ..where((t) => _sameDay(t, date) & t.name.equals(name)))
        .write(
      MealsCompanion(
        carbs: carbs == null ? Value.absent() : Value(carbs),
        fats: fats == null ? Value.absent() : Value(fats),
        vegies: vegies == null ? Value.absent() : Value(vegies),
        proteins: proteins == null ? Value.absent() : Value(proteins),
      ),
    );
  }
}
