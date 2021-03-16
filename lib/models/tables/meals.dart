import 'package:moor/moor.dart';
import 'package:moor_flutter/moor_flutter.dart';

class Meals extends Table {
  IntColumn get id => integer().nullable().autoIncrement()();
  TextColumn get name => text()();
  IntColumn get carbs => integer().nullable().withDefault(Constant(0))();
  IntColumn get vegies => integer().nullable().withDefault(Constant(0))();
  IntColumn get proteins => integer().nullable().withDefault(Constant(0))();
  IntColumn get fats => integer().nullable().withDefault(Constant(0))();
  DateTimeColumn get date => dateTime().withDefault(Constant(DateTime.now()))();
}
