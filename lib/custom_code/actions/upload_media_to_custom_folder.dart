// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import '../../backend/firebase_storage/storage.dart';
import '../../flutter_flow/upload_data.dart';

Future<String?> uploadMediaToCustomFolder(
    FFUploadedFile img, String folderPath) async {
  // Add your function code here!
  final filePath = '${folderPath}${img.name}';
  final downloadUrl = await uploadData(filePath, img.bytes!);

  return downloadUrl;
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
