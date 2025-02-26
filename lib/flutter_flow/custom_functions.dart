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
import '/backend/schema/enums/enums.dart';
import '/auth/firebase_auth/auth_util.dart';

List<bool>? flipBoolAtIndex(
  List<bool>? boolList,
  int? index,
) {
  if (boolList == null || index == null) return null;

  List<bool> result = [];
  for (var i = 0; i < boolList.length; i++) {
    result.add(i == index ? !boolList[i] : boolList[i]);
  }
  return result;
}

List<String>? updateStringAtIndex(
  List<String>? stringList,
  int? index,
  String? text,
) {
  if (stringList == null || index == null || text == null) {
    return null;
  }

  List<String>? updatedStringList = List.from(stringList);
  updatedStringList[index] = text;
  return updatedStringList;
}

String? newCustomFunction() {
  // choose year from dropdown
  List<int> years = List.generate(50, (index) => DateTime.now().year - index);
  int? selectedYear;
  return DropdownButton<int>(
    value: selectedYear,
    hint: Text('Select a year'),
    items: years.map((year) {
      return DropdownMenuItem<int>(
        value: year,
        child: Text(year.toString()),
      );
    }).toList(),
    onChanged: (value) {
      selectedYear = value;
    },
  ).toString();
}
