// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:math';

Future<String> randomImage(List<String> imageList) async {
  // shuffle image without repeat
// Define a list of image URLs
  List<String> imageUrls = imageList;

  // Shuffle the list using the random seed
  var random = Random(DateTime.now().millisecondsSinceEpoch);
  imageUrls.shuffle(random);

  // Return the first image URL in the shuffled list
  return imageUrls.first;
}
