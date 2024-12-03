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

Future<List<String>> uploadMediaListToCustomFolder(
    List<FFUploadedFile> images, String folderPath) async {
  List<String> downloadUrls = [];

  for (FFUploadedFile img in images) {
    try {
      final filePath =
          '${folderPath}/${img.name}'; // Ensure proper folder structure
      final downloadUrl = await uploadData(filePath, img.bytes!);
      downloadUrls.add(downloadUrl ?? '');
    } catch (e) {
      print('Error uploading file ${img.name}: $e');
      // Optionally handle errors or continue to the next file
    }
  }

  return downloadUrls;
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
