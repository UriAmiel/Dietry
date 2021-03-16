// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class MealConfig extends DataClass implements Insertable<MealConfig> {
  final String name;
  final String weekDay;
  final String mealName;
  final int carbs;
  final int proteins;
  final int vegies;
  final int fats;
  MealConfig(
      {this.name,
      @required this.weekDay,
      @required this.mealName,
      this.carbs,
      this.proteins,
      this.vegies,
      this.fats});
  factory MealConfig.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    final intType = db.typeSystem.forDartType<int>();
    return MealConfig(
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      weekDay: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}week_day']),
      mealName: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}meal_name']),
      carbs: intType.mapFromDatabaseResponse(data['${effectivePrefix}carbs']),
      proteins:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}proteins']),
      vegies: intType.mapFromDatabaseResponse(data['${effectivePrefix}vegies']),
      fats: intType.mapFromDatabaseResponse(data['${effectivePrefix}fats']),
    );
  }
  factory MealConfig.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return MealConfig(
      name: serializer.fromJson<String>(json['name']),
      weekDay: serializer.fromJson<String>(json['weekDay']),
      mealName: serializer.fromJson<String>(json['mealName']),
      carbs: serializer.fromJson<int>(json['carbs']),
      proteins: serializer.fromJson<int>(json['proteins']),
      vegies: serializer.fromJson<int>(json['vegies']),
      fats: serializer.fromJson<int>(json['fats']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'name': serializer.toJson<String>(name),
      'weekDay': serializer.toJson<String>(weekDay),
      'mealName': serializer.toJson<String>(mealName),
      'carbs': serializer.toJson<int>(carbs),
      'proteins': serializer.toJson<int>(proteins),
      'vegies': serializer.toJson<int>(vegies),
      'fats': serializer.toJson<int>(fats),
    };
  }

  @override
  MealConfigsCompanion createCompanion(bool nullToAbsent) {
    return MealConfigsCompanion(
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      weekDay: weekDay == null && nullToAbsent
          ? const Value.absent()
          : Value(weekDay),
      mealName: mealName == null && nullToAbsent
          ? const Value.absent()
          : Value(mealName),
      carbs:
          carbs == null && nullToAbsent ? const Value.absent() : Value(carbs),
      proteins: proteins == null && nullToAbsent
          ? const Value.absent()
          : Value(proteins),
      vegies:
          vegies == null && nullToAbsent ? const Value.absent() : Value(vegies),
      fats: fats == null && nullToAbsent ? const Value.absent() : Value(fats),
    );
  }

  MealConfig copyWith(
          {String name,
          String weekDay,
          String mealName,
          int carbs,
          int proteins,
          int vegies,
          int fats}) =>
      MealConfig(
        name: name ?? this.name,
        weekDay: weekDay ?? this.weekDay,
        mealName: mealName ?? this.mealName,
        carbs: carbs ?? this.carbs,
        proteins: proteins ?? this.proteins,
        vegies: vegies ?? this.vegies,
        fats: fats ?? this.fats,
      );
  @override
  String toString() {
    return (StringBuffer('MealConfig(')
          ..write('name: $name, ')
          ..write('weekDay: $weekDay, ')
          ..write('mealName: $mealName, ')
          ..write('carbs: $carbs, ')
          ..write('proteins: $proteins, ')
          ..write('vegies: $vegies, ')
          ..write('fats: $fats')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      name.hashCode,
      $mrjc(
          weekDay.hashCode,
          $mrjc(
              mealName.hashCode,
              $mrjc(
                  carbs.hashCode,
                  $mrjc(proteins.hashCode,
                      $mrjc(vegies.hashCode, fats.hashCode)))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is MealConfig &&
          other.name == this.name &&
          other.weekDay == this.weekDay &&
          other.mealName == this.mealName &&
          other.carbs == this.carbs &&
          other.proteins == this.proteins &&
          other.vegies == this.vegies &&
          other.fats == this.fats);
}

class MealConfigsCompanion extends UpdateCompanion<MealConfig> {
  final Value<String> name;
  final Value<String> weekDay;
  final Value<String> mealName;
  final Value<int> carbs;
  final Value<int> proteins;
  final Value<int> vegies;
  final Value<int> fats;
  const MealConfigsCompanion({
    this.name = const Value.absent(),
    this.weekDay = const Value.absent(),
    this.mealName = const Value.absent(),
    this.carbs = const Value.absent(),
    this.proteins = const Value.absent(),
    this.vegies = const Value.absent(),
    this.fats = const Value.absent(),
  });
  MealConfigsCompanion.insert({
    this.name = const Value.absent(),
    @required String weekDay,
    @required String mealName,
    this.carbs = const Value.absent(),
    this.proteins = const Value.absent(),
    this.vegies = const Value.absent(),
    this.fats = const Value.absent(),
  })  : weekDay = Value(weekDay),
        mealName = Value(mealName);
  MealConfigsCompanion copyWith(
      {Value<String> name,
      Value<String> weekDay,
      Value<String> mealName,
      Value<int> carbs,
      Value<int> proteins,
      Value<int> vegies,
      Value<int> fats}) {
    return MealConfigsCompanion(
      name: name ?? this.name,
      weekDay: weekDay ?? this.weekDay,
      mealName: mealName ?? this.mealName,
      carbs: carbs ?? this.carbs,
      proteins: proteins ?? this.proteins,
      vegies: vegies ?? this.vegies,
      fats: fats ?? this.fats,
    );
  }
}

class $MealConfigsTable extends MealConfigs
    with TableInfo<$MealConfigsTable, MealConfig> {
  final GeneratedDatabase _db;
  final String _alias;
  $MealConfigsTable(this._db, [this._alias]);
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn('name', $tableName, true,
        defaultValue: Constant('default'));
  }

  final VerificationMeta _weekDayMeta = const VerificationMeta('weekDay');
  GeneratedTextColumn _weekDay;
  @override
  GeneratedTextColumn get weekDay => _weekDay ??= _constructWeekDay();
  GeneratedTextColumn _constructWeekDay() {
    return GeneratedTextColumn(
      'week_day',
      $tableName,
      false,
    );
  }

  final VerificationMeta _mealNameMeta = const VerificationMeta('mealName');
  GeneratedTextColumn _mealName;
  @override
  GeneratedTextColumn get mealName => _mealName ??= _constructMealName();
  GeneratedTextColumn _constructMealName() {
    return GeneratedTextColumn(
      'meal_name',
      $tableName,
      false,
    );
  }

  final VerificationMeta _carbsMeta = const VerificationMeta('carbs');
  GeneratedIntColumn _carbs;
  @override
  GeneratedIntColumn get carbs => _carbs ??= _constructCarbs();
  GeneratedIntColumn _constructCarbs() {
    return GeneratedIntColumn('carbs', $tableName, true,
        defaultValue: Constant(0));
  }

  final VerificationMeta _proteinsMeta = const VerificationMeta('proteins');
  GeneratedIntColumn _proteins;
  @override
  GeneratedIntColumn get proteins => _proteins ??= _constructProteins();
  GeneratedIntColumn _constructProteins() {
    return GeneratedIntColumn('proteins', $tableName, true,
        defaultValue: Constant(0));
  }

  final VerificationMeta _vegiesMeta = const VerificationMeta('vegies');
  GeneratedIntColumn _vegies;
  @override
  GeneratedIntColumn get vegies => _vegies ??= _constructVegies();
  GeneratedIntColumn _constructVegies() {
    return GeneratedIntColumn('vegies', $tableName, true,
        defaultValue: Constant(0));
  }

  final VerificationMeta _fatsMeta = const VerificationMeta('fats');
  GeneratedIntColumn _fats;
  @override
  GeneratedIntColumn get fats => _fats ??= _constructFats();
  GeneratedIntColumn _constructFats() {
    return GeneratedIntColumn('fats', $tableName, true,
        defaultValue: Constant(0));
  }

  @override
  List<GeneratedColumn> get $columns =>
      [name, weekDay, mealName, carbs, proteins, vegies, fats];
  @override
  $MealConfigsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'meal_configs';
  @override
  final String actualTableName = 'meal_configs';
  @override
  VerificationContext validateIntegrity(MealConfigsCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.name.present) {
      context.handle(
          _nameMeta, name.isAcceptableValue(d.name.value, _nameMeta));
    }
    if (d.weekDay.present) {
      context.handle(_weekDayMeta,
          weekDay.isAcceptableValue(d.weekDay.value, _weekDayMeta));
    } else if (isInserting) {
      context.missing(_weekDayMeta);
    }
    if (d.mealName.present) {
      context.handle(_mealNameMeta,
          mealName.isAcceptableValue(d.mealName.value, _mealNameMeta));
    } else if (isInserting) {
      context.missing(_mealNameMeta);
    }
    if (d.carbs.present) {
      context.handle(
          _carbsMeta, carbs.isAcceptableValue(d.carbs.value, _carbsMeta));
    }
    if (d.proteins.present) {
      context.handle(_proteinsMeta,
          proteins.isAcceptableValue(d.proteins.value, _proteinsMeta));
    }
    if (d.vegies.present) {
      context.handle(
          _vegiesMeta, vegies.isAcceptableValue(d.vegies.value, _vegiesMeta));
    }
    if (d.fats.present) {
      context.handle(
          _fatsMeta, fats.isAcceptableValue(d.fats.value, _fatsMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {name, weekDay, mealName};
  @override
  MealConfig map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return MealConfig.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(MealConfigsCompanion d) {
    final map = <String, Variable>{};
    if (d.name.present) {
      map['name'] = Variable<String, StringType>(d.name.value);
    }
    if (d.weekDay.present) {
      map['week_day'] = Variable<String, StringType>(d.weekDay.value);
    }
    if (d.mealName.present) {
      map['meal_name'] = Variable<String, StringType>(d.mealName.value);
    }
    if (d.carbs.present) {
      map['carbs'] = Variable<int, IntType>(d.carbs.value);
    }
    if (d.proteins.present) {
      map['proteins'] = Variable<int, IntType>(d.proteins.value);
    }
    if (d.vegies.present) {
      map['vegies'] = Variable<int, IntType>(d.vegies.value);
    }
    if (d.fats.present) {
      map['fats'] = Variable<int, IntType>(d.fats.value);
    }
    return map;
  }

  @override
  $MealConfigsTable createAlias(String alias) {
    return $MealConfigsTable(_db, alias);
  }
}

class Meal extends DataClass implements Insertable<Meal> {
  final int id;
  final String name;
  final int carbs;
  final int vegies;
  final int proteins;
  final int fats;
  final DateTime date;
  Meal(
      {this.id,
      @required this.name,
      this.carbs,
      this.vegies,
      this.proteins,
      this.fats,
      @required this.date});
  factory Meal.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return Meal(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      carbs: intType.mapFromDatabaseResponse(data['${effectivePrefix}carbs']),
      vegies: intType.mapFromDatabaseResponse(data['${effectivePrefix}vegies']),
      proteins:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}proteins']),
      fats: intType.mapFromDatabaseResponse(data['${effectivePrefix}fats']),
      date:
          dateTimeType.mapFromDatabaseResponse(data['${effectivePrefix}date']),
    );
  }
  factory Meal.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Meal(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      carbs: serializer.fromJson<int>(json['carbs']),
      vegies: serializer.fromJson<int>(json['vegies']),
      proteins: serializer.fromJson<int>(json['proteins']),
      fats: serializer.fromJson<int>(json['fats']),
      date: serializer.fromJson<DateTime>(json['date']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'carbs': serializer.toJson<int>(carbs),
      'vegies': serializer.toJson<int>(vegies),
      'proteins': serializer.toJson<int>(proteins),
      'fats': serializer.toJson<int>(fats),
      'date': serializer.toJson<DateTime>(date),
    };
  }

  @override
  MealsCompanion createCompanion(bool nullToAbsent) {
    return MealsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      carbs:
          carbs == null && nullToAbsent ? const Value.absent() : Value(carbs),
      vegies:
          vegies == null && nullToAbsent ? const Value.absent() : Value(vegies),
      proteins: proteins == null && nullToAbsent
          ? const Value.absent()
          : Value(proteins),
      fats: fats == null && nullToAbsent ? const Value.absent() : Value(fats),
      date: date == null && nullToAbsent ? const Value.absent() : Value(date),
    );
  }

  Meal copyWith(
          {int id,
          String name,
          int carbs,
          int vegies,
          int proteins,
          int fats,
          DateTime date}) =>
      Meal(
        id: id ?? this.id,
        name: name ?? this.name,
        carbs: carbs ?? this.carbs,
        vegies: vegies ?? this.vegies,
        proteins: proteins ?? this.proteins,
        fats: fats ?? this.fats,
        date: date ?? this.date,
      );
  @override
  String toString() {
    return (StringBuffer('Meal(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('carbs: $carbs, ')
          ..write('vegies: $vegies, ')
          ..write('proteins: $proteins, ')
          ..write('fats: $fats, ')
          ..write('date: $date')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          name.hashCode,
          $mrjc(
              carbs.hashCode,
              $mrjc(
                  vegies.hashCode,
                  $mrjc(proteins.hashCode,
                      $mrjc(fats.hashCode, date.hashCode)))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Meal &&
          other.id == this.id &&
          other.name == this.name &&
          other.carbs == this.carbs &&
          other.vegies == this.vegies &&
          other.proteins == this.proteins &&
          other.fats == this.fats &&
          other.date == this.date);
}

class MealsCompanion extends UpdateCompanion<Meal> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> carbs;
  final Value<int> vegies;
  final Value<int> proteins;
  final Value<int> fats;
  final Value<DateTime> date;
  const MealsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.carbs = const Value.absent(),
    this.vegies = const Value.absent(),
    this.proteins = const Value.absent(),
    this.fats = const Value.absent(),
    this.date = const Value.absent(),
  });
  MealsCompanion.insert({
    this.id = const Value.absent(),
    @required String name,
    this.carbs = const Value.absent(),
    this.vegies = const Value.absent(),
    this.proteins = const Value.absent(),
    this.fats = const Value.absent(),
    this.date = const Value.absent(),
  }) : name = Value(name);
  MealsCompanion copyWith(
      {Value<int> id,
      Value<String> name,
      Value<int> carbs,
      Value<int> vegies,
      Value<int> proteins,
      Value<int> fats,
      Value<DateTime> date}) {
    return MealsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      carbs: carbs ?? this.carbs,
      vegies: vegies ?? this.vegies,
      proteins: proteins ?? this.proteins,
      fats: fats ?? this.fats,
      date: date ?? this.date,
    );
  }
}

class $MealsTable extends Meals with TableInfo<$MealsTable, Meal> {
  final GeneratedDatabase _db;
  final String _alias;
  $MealsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, true,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn(
      'name',
      $tableName,
      false,
    );
  }

  final VerificationMeta _carbsMeta = const VerificationMeta('carbs');
  GeneratedIntColumn _carbs;
  @override
  GeneratedIntColumn get carbs => _carbs ??= _constructCarbs();
  GeneratedIntColumn _constructCarbs() {
    return GeneratedIntColumn('carbs', $tableName, true,
        defaultValue: Constant(0));
  }

  final VerificationMeta _vegiesMeta = const VerificationMeta('vegies');
  GeneratedIntColumn _vegies;
  @override
  GeneratedIntColumn get vegies => _vegies ??= _constructVegies();
  GeneratedIntColumn _constructVegies() {
    return GeneratedIntColumn('vegies', $tableName, true,
        defaultValue: Constant(0));
  }

  final VerificationMeta _proteinsMeta = const VerificationMeta('proteins');
  GeneratedIntColumn _proteins;
  @override
  GeneratedIntColumn get proteins => _proteins ??= _constructProteins();
  GeneratedIntColumn _constructProteins() {
    return GeneratedIntColumn('proteins', $tableName, true,
        defaultValue: Constant(0));
  }

  final VerificationMeta _fatsMeta = const VerificationMeta('fats');
  GeneratedIntColumn _fats;
  @override
  GeneratedIntColumn get fats => _fats ??= _constructFats();
  GeneratedIntColumn _constructFats() {
    return GeneratedIntColumn('fats', $tableName, true,
        defaultValue: Constant(0));
  }

  final VerificationMeta _dateMeta = const VerificationMeta('date');
  GeneratedDateTimeColumn _date;
  @override
  GeneratedDateTimeColumn get date => _date ??= _constructDate();
  GeneratedDateTimeColumn _constructDate() {
    return GeneratedDateTimeColumn('date', $tableName, false,
        defaultValue: Constant(DateTime.now()));
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, name, carbs, vegies, proteins, fats, date];
  @override
  $MealsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'meals';
  @override
  final String actualTableName = 'meals';
  @override
  VerificationContext validateIntegrity(MealsCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    }
    if (d.name.present) {
      context.handle(
          _nameMeta, name.isAcceptableValue(d.name.value, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (d.carbs.present) {
      context.handle(
          _carbsMeta, carbs.isAcceptableValue(d.carbs.value, _carbsMeta));
    }
    if (d.vegies.present) {
      context.handle(
          _vegiesMeta, vegies.isAcceptableValue(d.vegies.value, _vegiesMeta));
    }
    if (d.proteins.present) {
      context.handle(_proteinsMeta,
          proteins.isAcceptableValue(d.proteins.value, _proteinsMeta));
    }
    if (d.fats.present) {
      context.handle(
          _fatsMeta, fats.isAcceptableValue(d.fats.value, _fatsMeta));
    }
    if (d.date.present) {
      context.handle(
          _dateMeta, date.isAcceptableValue(d.date.value, _dateMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Meal map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Meal.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(MealsCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.name.present) {
      map['name'] = Variable<String, StringType>(d.name.value);
    }
    if (d.carbs.present) {
      map['carbs'] = Variable<int, IntType>(d.carbs.value);
    }
    if (d.vegies.present) {
      map['vegies'] = Variable<int, IntType>(d.vegies.value);
    }
    if (d.proteins.present) {
      map['proteins'] = Variable<int, IntType>(d.proteins.value);
    }
    if (d.fats.present) {
      map['fats'] = Variable<int, IntType>(d.fats.value);
    }
    if (d.date.present) {
      map['date'] = Variable<DateTime, DateTimeType>(d.date.value);
    }
    return map;
  }

  @override
  $MealsTable createAlias(String alias) {
    return $MealsTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $MealConfigsTable _mealConfigs;
  $MealConfigsTable get mealConfigs => _mealConfigs ??= $MealConfigsTable(this);
  $MealsTable _meals;
  $MealsTable get meals => _meals ??= $MealsTable(this);
  MealConfigDao _mealConfigDao;
  MealConfigDao get mealConfigDao =>
      _mealConfigDao ??= MealConfigDao(this as AppDatabase);
  MealDao _mealDao;
  MealDao get mealDao => _mealDao ??= MealDao(this as AppDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [mealConfigs, meals];
}

// **************************************************************************
// DaoGenerator
// **************************************************************************

mixin _$MealConfigDaoMixin on DatabaseAccessor<AppDatabase> {
  $MealConfigsTable get mealConfigs => db.mealConfigs;
}
mixin _$MealDaoMixin on DatabaseAccessor<AppDatabase> {
  $MealsTable get meals => db.meals;
}
