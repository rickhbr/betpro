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
import '/auth/firebase_auth/auth_util.dart';

String contains(
  List<dynamic> listCol1,
  List<dynamic> listCol2,
  List<dynamic> listCol3,
  List<String> numberList,
) {
  List<String> auxStrList = [];
  var concatenate = StringBuffer();

  for (var i = 0; i < numberList.take(3).length; i++) {
    if (listCol1.contains(int.parse(numberList[i]))) {
      auxStrList.add('1,');
    }

    if (listCol2.contains(int.parse(numberList[i]))) {
      auxStrList.add('2,');
    }

    if (listCol3.contains(int.parse(numberList[i]))) {
      auxStrList.add('3,');
    }

    if (int.parse(numberList[i]) == 0) {
      auxStrList.add('N,');
    }
  }

  for (var e in auxStrList) {
    concatenate.write(e);
  }

  switch (concatenate.toString()) {
    case '1,1,1,':
      return 'Coluna 2, Coluna 3';
    case '1,1,2,':
      return 'Coluna 1, Coluna 3';
    case '1,1,3,':
      return 'Coluna 1, Coluna 2';
    case '2,2,2,':
      return 'Coluna 1, Coluna 3';
    case '2,2,1,':
      return 'Coluna 2, Coluna 3';
    case '2,2,3,':
      return 'Coluna 1, Coluna 2';
    case '3,3,3,':
      return 'Coluna 1, Coluna 2';
    case '3,3,1,':
      return 'Coluna 2, Coluna 3';
    case '3,3,2,':
      return 'Coluna 1, Coluna 3';
    default:
      return '';
  }

  // create function contains list
}
