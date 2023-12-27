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
  int? currentscore,
  int? maxscore,
) {
  if (currentscore == null || maxscore == null) return 0.5;
  return currentscore / maxscore;
}

String placementFunction(int? placement) {
  if (placement == null || placement == 0) return "-";
  return placement.toString();
}

bool hasValidPlacement(int? placement) {
  if (placement == null) return false;
  return placement > 0;
}

int addValues(
  int? base,
  int? offset,
) {
  if (offset == null && base != null) {
    return base;
  }

  if (base == null && offset != null) {
    return offset;
  }

  if (offset == null && base == null) {
    return 0;
  }

  int newPlace = base! + offset!;
  if (newPlace < 1) newPlace = 1;
  return newPlace;
}

String convertCourseTypeToString(int? coursetype) {
  if (coursetype == null) return "(FOUT)";
  switch (coursetype) {
    case 0:
      return "(KB)";
    case 1:
      return "(LB)";
  }

  return "";
}

bool? isGoodPercentage(String? percentage) {
  if (percentage == null) return false;
  double? percentageDouble = double.tryParse(percentage);
  if (percentageDouble == null) return false;
  return percentageDouble >= 100.0;
}

int getJsonListCount(List<dynamic>? input) {
  if (input == null) return 0;
  return input.length;
}

bool greaterThan(
  int? valueA,
  int? valueB,
) {
  if (valueA == null || valueB == null) return false;
  return valueA > valueB;
}

String achievementCategoryIdToName(String? achievementId) {
  if (achievementId == "0")
    return "Vlinderslag";
  else if (achievementId == "1")
    return "Rugcrawl";
  else if (achievementId == "2")
    return "Schoolslag";
  else if (achievementId == "3")
    return "Vrije slag";
  else if (achievementId == "4")
    return "Wisselslag";
  else
    return "Overig";
}
