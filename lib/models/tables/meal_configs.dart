import 'package:moor/moor.dart';
import 'package:moor_flutter/moor_flutter.dart';

class MealConfigs extends Table {
  // Name - support for multiple configuration (Version 2.0)
  TextColumn get name => text().nullable().withDefault(Constant('default'))();
  TextColumn get weekDay => text()();
  TextColumn get mealName => text()();
  IntColumn get carbs => integer().nullable().withDefault(Constant(0))();
  IntColumn get proteins => integer().nullable().withDefault(Constant(0))();
  IntColumn get vegies => integer().nullable().withDefault(Constant(0))();
  IntColumn get fats => integer().nullable().withDefault(Constant(0))();

  Set<Column> get primaryKey => {name, weekDay, mealName};
}
