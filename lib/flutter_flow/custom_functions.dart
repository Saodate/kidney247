import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

String greetingString(String languageCode) {
  String greeting = '';
  DateTime now = DateTime.now();
  int hours = now.hour;
  if (hours >= 1 && hours <= 12) {
    greeting = languageCode == 'en' ? 'Good Morning' : "Chào buổi sáng";
  } else if (hours >= 12 && hours <= 16) {
    greeting = languageCode == 'en' ? 'Good Afternoon' : "Chào buổi chiều";
  } else if (hours >= 16 && hours <= 21) {
    greeting = languageCode == 'en' ? 'Good Evening' : "Chào buổi tối";
  } else if (hours >= 21 && hours <= 24) {
    greeting = languageCode == 'en' ? 'Good Night' : "Chúc ngủ ngon";
  }
  return greeting;
}

String toUpperCase(String text) {
  return text.toUpperCase();
}

List<LabtestResultsRecord> filterGFR(List<LabtestResultsRecord> inputList) {
  List<LabtestResultsRecord> outputList = [];
  for (LabtestResultsRecord item in inputList) {
    if (item.gfr != 0) {
      outputList.add(item);
    }
  }
  return outputList;
}

List<VitalsResultRecord> filterFluid(List<VitalsResultRecord> inputList) {
  List<VitalsResultRecord> outputList = [];
  for (VitalsResultRecord item in inputList) {
    if (item.fluidOutputTime != 0) {
      outputList.add(item);
    }
  }
  return outputList;
}

List<LabtestResultsRecord> filterBloodGlucoseA1C(
    List<LabtestResultsRecord> inputList) {
  List<LabtestResultsRecord> outputList = [];
  for (LabtestResultsRecord item in inputList) {
    if (item.bloodGlucose != 0) {
      outputList.add(item);
    }
  }
  return outputList;
}

List<VitalsResultRecord> filterBloodGlucose(
    List<VitalsResultRecord> inputList) {
  List<VitalsResultRecord> outputList = [];
  for (VitalsResultRecord item in inputList) {
    if (item.bloodGlucose != 0) {
      outputList.add(item);
    }
  }
  return outputList;
}

List<LabtestResultsRecord> filterBUN(List<LabtestResultsRecord> inputList) {
  List<LabtestResultsRecord> outputList = [];
  for (LabtestResultsRecord item in inputList) {
    if (item.bun != 0) {
      outputList.add(item);
    }
  }
  return outputList;
}

double calculateNutrition(
  double slider,
  double qty,
  double target,
) {
  double temp = slider - qty;
  double temp2 = temp / qty;
  double temp3 = temp2 * target;
  double round = double.parse((target + temp3).toStringAsFixed(2));
  return round;
}

List<FluidsRecord> filterTodayFluids(List<FluidsRecord> inputFluidsList) {
  List<FluidsRecord> outputFluidsList = [];
  for (FluidsRecord item in inputFluidsList) {
    if (item.createdAt!.day == DateTime.now().day &&
        item.createdAt!.month == DateTime.now().month &&
        item.createdAt!.year == DateTime.now().year) {
      outputFluidsList.add(item);
    }
  }

  return outputFluidsList;
}

double totalPhosphorus(List<MealsRecord> meals) {
  double sum = 0;
  for (int i = 0; i < meals.length; i++) {
    if (meals[i].createdAt!.day == DateTime.now().day &&
        meals[i].createdAt!.month == DateTime.now().month &&
        meals[i].createdAt!.year == DateTime.now().year) {
      sum += meals[i].phosphorus!;
    }
  }
  return sum;
}

List<VitalsResultRecord> filterBloodPressure(
    List<VitalsResultRecord> inputList) {
  List<VitalsResultRecord> outputList = [];
  for (VitalsResultRecord item in inputList) {
    if (item.bloodPressureFrom != 0 && item.bloodPressureTo != 0) {
      outputList.add(item);
    }
  }
  return outputList;
}

double totalProtein(List<MealsRecord> meals) {
  double sum = 0;
  for (int i = 0; i < meals.length; i++) {
    if (meals[i].createdAt!.day == DateTime.now().day &&
        meals[i].createdAt!.month == DateTime.now().month &&
        meals[i].createdAt!.year == DateTime.now().year) {
      sum += meals[i].protein!;
    }
  }
  return sum;
}

double totalPotassium(List<MealsRecord> meals) {
  double sum = 0;
  for (int i = 0; i < meals.length; i++) {
    if (meals[i].createdAt!.day == DateTime.now().day &&
        meals[i].createdAt!.month == DateTime.now().month &&
        meals[i].createdAt!.year == DateTime.now().year) {
      sum += meals[i].potassium!;
    }
  }
  return sum;
}

double totalSodium(List<MealsRecord> meals) {
  double sum = 0;
  for (int i = 0; i < meals.length; i++) {
    if (meals[i].createdAt!.day == DateTime.now().day &&
        meals[i].createdAt!.month == DateTime.now().month &&
        meals[i].createdAt!.year == DateTime.now().year) {
      sum += meals[i].sodium!;
    }
  }
  return sum;
}

double totalFluid(
  List<FluidsRecord> fluids,
  List<MealsRecord> meals,
) {
  double sum = 0;
  for (int i = 0; i < fluids.length; i++) {
    if (fluids[i].createdAt!.day == DateTime.now().day &&
        fluids[i].createdAt!.month == DateTime.now().month &&
        fluids[i].createdAt!.year == DateTime.now().year) {
      sum += fluids[i].amount!;
    }
  }
  for (int i = 0; i < meals.length; i++) {
    if (meals[i].createdAt!.day == DateTime.now().day &&
        meals[i].createdAt!.month == DateTime.now().month &&
        meals[i].createdAt!.year == DateTime.now().year) {
      sum += meals[i].fluid!;
    }
  }
  return sum;
}

List<MealsRecord> filterTodayMeals(List<MealsRecord> inputMealsList) {
  List<MealsRecord> outputMealsList = [];
  for (MealsRecord item in inputMealsList) {
    if (item.createdAt!.day == DateTime.now().day &&
        item.createdAt!.month == DateTime.now().month &&
        item.createdAt!.year == DateTime.now().year) {
      outputMealsList.add(item);
    }
  }
  return outputMealsList;
}

String? userSexbyLanguage(
  String userSex,
  String languageCode,
) {
  if (languageCode == 'vi') {
    if (userSex == 'Nam giới' ||
        userSex == 'Nữ giới' ||
        userSex == 'Không tiết lộ') {
      return userSex;
    }
  }
  if (languageCode == 'en') {
    if (userSex == 'Male' || userSex == 'Female' || userSex == 'Undisclosed') {
      return userSex;
    }
  }
  return languageCode == 'en'
      ? userSex == 'Nam giới'
          ? 'Male'
          : userSex == 'Nữ giới'
              ? 'Female'
              : 'Undisclosed'
      : userSex == 'Male'
          ? 'Nam giới'
          : userSex == 'Female'
              ? 'Nữ giới'
              : 'Không tiết lộ';
}

String? unitbyLanguageForAPI(
  String unit,
  String languageCode,
) {
  if (languageCode == 'en') {
    return unit;
  } else {
    if (unit == 'bowl') {
      return 'bát';
    } else if (unit == 'cup') {
      return 'tách';
    } else if (unit == 'piece') {
      return 'miếng';
    } else if (unit == 'portrion') {
      return 'khẩu phần';
    } else {
      return unit;
    }
  }
}

String? unitbyLanguage(
  String unit,
  String languageCode,
) {
  if (languageCode == 'vi') {
    if (unit == 'bát' ||
        unit == 'tách' ||
        unit == 'miếng' ||
        unit == 'khẩu phần' ||
        unit == 'mg') {
      return unit;
    }
  }
  if (languageCode == 'en') {
    if (unit == 'bowl' ||
        unit == 'cup' ||
        unit == 'piece' ||
        unit == 'portrion' ||
        unit == 'mg') {
      return unit;
    }
  }
  return languageCode == 'en'
      ? unit == 'bát'
          ? 'bowl'
          : unit == 'tách'
              ? 'cup'
              : unit == 'miếng'
                  ? 'piece'
                  : unit == 'mg'
                      ? 'mg'
                      : 'portrion'
      : unit == 'bowl'
          ? 'bát'
          : unit == 'cup'
              ? 'tách'
              : unit == 'piece'
                  ? 'miếng'
                  : unit == 'mg'
                      ? 'mg'
                      : 'khẩu phần';
}

dynamic saveChatHistory(
  dynamic chatHistory,
  dynamic newChat,
) {
  if (chatHistory is List) {
    chatHistory.add(newChat);
    return chatHistory;
  } else {
    return [newChat];
  }
}

dynamic convertToJSON(String prompt) {
  return json.decode('{"role": "user", "content": "$prompt"}');
}

double totalCalories(List<MealsRecord> meals) {
  double sum = 0;
  for (int i = 0; i < meals.length; i++) {
    if (meals[i].createdAt!.day == DateTime.now().day &&
        meals[i].createdAt!.month == DateTime.now().month &&
        meals[i].createdAt!.year == DateTime.now().year) {
      sum += meals[i].calories!;
    }
  }
  return sum;
}

List<DateTime> calculateMedicationRemindTime(int count) {
  List<DateTime> totalDays = [];
  var now = DateTime.now();
  for (int i = 0; i < count; i++) {
    totalDays.add(now);
    now = now.add(Duration(days: 1));
  }
  return totalDays;
}

DateTime appointmentReminderTime(DateTime dateTime) {
  DateTime appointmentReminderTime =
      DateTime(dateTime.year, dateTime.month, dateTime.day, 7, 0, 0, 0, 0);
  return appointmentReminderTime;
}

List<MedicationRemindRecord> todayMedication(
    List<MedicationRemindRecord> listMedication) {
  DateTime now = DateTime.now();
  List<MedicationRemindRecord> output = [];
  for (MedicationRemindRecord item in listMedication) {
    for (DateTime item2 in item.remindTime!) {
      if (item2.day == now.day &&
          item2.month == now.month &&
          item2.year == now.year) {
        output.add(item);
      }
    }
  }

  return output;
}

double? pieceValueCalculation(
  double min,
  double max,
  int numPart,
  int minAge,
  int maxAge,
  double targetAge,
) {
  List<double> results = [];
  var difference = max - min;
  var pieceValue = difference / (numPart - 1);
  double currentValue = min;
  while (numPart > 0) {
    results.add(double.parse(currentValue.toStringAsFixed(2)));
    currentValue += pieceValue;
    numPart--;
  }
  for (var i = 0; i < maxAge; i++) {
    if (targetAge == minAge) {
      return results[i];
    } else {
      minAge++;
    }
  }
}
