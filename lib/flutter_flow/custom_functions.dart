import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';

double calculatePercentage(
  int currentscore,
  int maxscore,
) {
  return currentscore / maxscore;
}

String placementFunction(int placement) {
  if (placement == 0) {
    return "-";
  }
  return placement.toString();
}

bool hasValidPlacement(int placement) {
  return placement > 0;
}

int addValues(
  int base,
  int offset,
) {
  int newPlace = base + offset;
  if (newPlace < 1) newPlace = 1;
  return newPlace;
}

String convertCourseTypeToString(int coursetype) {
  switch (coursetype) {
    case 0:
      return "(KB)";
    case 1:
      return "(LB)";
  }

  return "";
}

bool? isGoodPercentage(String percentage) {
  double percentageDouble = double.parse(percentage);
  return percentageDouble >= 100.0;
}

int getJsonListCount(List<dynamic> input) {
  return input.length;
}

bool greaterThan(
  int valueA,
  int valueB,
) {
  return valueA > valueB;
}
