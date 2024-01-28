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
import '/backend/schema/enums/enums.dart';
import '/auth/firebase_auth/auth_util.dart';

String convertImageFileToByte64(FFUploadedFile imagePath) {
  final base64Image = base64Encode(imagePath.bytes!);
  return base64Image;
}

String formateDisplayName(String displayName) {
  final shortText =
      '${displayName.split(' ').first[0]} ${displayName.split(' ').last[0]}';
  return shortText;
}

String makeNullEmptyString(String value) {
  return value == 'null' || value == 'null null' ? '' : value;
}

List<String> extractNameFromTemplate(List<TemplateStruct> templates) {
  List<String> names = [];
  for (TemplateStruct temp in templates) {
    names.add(temp.name);
  }
  return names;
}

bool checkForStarterTemplate(
  List<DocumentReference> templateList,
  String idCheckValue,
) {
  return templateList.any(
    (element) => element.id == idCheckValue,
  );
}
