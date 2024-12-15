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

List<String> newCustomFunction(
  String? socialLink1,
  String? socialLink2,
) {
  return [socialLink1 ?? '', socialLink2 ?? ''];
}

int calculateAge(String birthdate) {
  // Parse the input date
  final DateTime birthDate = DateTime.parse(
    "${birthdate.split('/')[2]}-${birthdate.split('/')[1]}-${birthdate.split('/')[0]}",
  );

  // Get today's date
  final DateTime today = DateTime.now();

  // Calculate the age
  int age = today.year - birthDate.year;

  // Adjust for the case where the birthday hasn't occurred yet this year
  if (today.month < birthDate.month ||
      (today.month == birthDate.month && today.day < birthDate.day)) {
    age--;
  }

  return age;
}

String convertStringToImagePath(String imagePathStr) {
  return imagePathStr;
}

bool checkLocation(
  String location,
  String address,
  String searchLocation,
) {
  print(location);
  print(address);
  print(searchLocation);

  if (location.isEmpty && address.isEmpty) return true;

  // Convert both location and query to lowercase and split into words
  final List<String> locationWords =
      location.toLowerCase().split(RegExp(r'[,\s]+'));
  final List<String> addressWords =
      searchLocation.toLowerCase().split(RegExp(r'[,\s]+'));
  final List<String> queryWords =
      searchLocation.toLowerCase().split(RegExp(r'[,\s]+'));

  // Check if any word in the query matches a word in the location
  return queryWords.any((word) => locationWords.contains(word)) ||
      queryWords.any((word) => addressWords.contains(word));

  // if (searchLocation.toLowerCase().contains(location.toLowerCase())) {
  //   return true;
  // } else if (searchLocation.toLowerCase().contains(address.toLowerCase())) {
  //   return true;
  // } else {
  //   return false;
  // }
}

bool checkAgeLimit(
  int age,
  String minAge,
  String maxAge,
) {
  if (minAge.isEmpty || maxAge.isEmpty) {
    return false; // Return false if any input is null or empty
  }

  return int.parse(minAge) <= age && age <= int.parse(maxAge);
}

String convertStringToVideoPath(String videoPathStr) {
  return videoPathStr;
}

bool checkValidURL(String url) {
  return Uri.parse(url).isAbsolute;
}

List<UserActivityRecord> getFilteredActivity(
  List<UserActivityRecord>? searchActivity,
  List<UserActivityRecord> userActivities,
) {
  print('search activity: ${searchActivity}');
  print('user activity: ${userActivities}');

  if (searchActivity == null || searchActivity.isEmpty) {
    return userActivities;
  } else {
    return searchActivity;
  }
}

List<DocumentReference> getRefList(
  DocumentReference ref1,
  DocumentReference ref2,
) {
  return [ref1, ref2];
}
