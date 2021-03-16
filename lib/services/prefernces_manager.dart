import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String configNameField = 'configName';
const String isConfigedField = 'isConfiged';

Future<void> setCurrentConfig(String configName) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString(configNameField, configName);
}

Future<void> markAsConfiged() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setBool(isConfigedField, true);
}

Future<bool> getIsConfiged() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getBool(isConfigedField);
}

Future<String> getCurrentConfigName(String configName) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString(configNameField);
}

Future<void> setMealTime(String mealName, TimeOfDay mealTime) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setInt(mealName + 'Hour', mealTime.hour);
  await prefs.setInt(mealName + 'Minute', mealTime.minute);
}

Future<TimeOfDay> getMealTime(String mealName) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  int hour = prefs.getInt(mealName + 'Hour');
  int minute = prefs.getInt(mealName + 'Minute');
  if (hour == null && minute == null) return null;
  return TimeOfDay(hour: hour, minute: minute);
}
