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

String formateDisplayName(
  String firstName,
  String lastName,
) {
  String displayName =
      '${firstName.isEmpty ? lastName : firstName} ${lastName.isEmpty ? firstName : lastName}';
  String shortText =
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

List<String> searchTextInFirestore(String value) {
  return value.split('').toList();
}

bool checkForDomianExtension(
  String userEmail,
  String teamEmail,
) {
  String teamExtension = teamEmail.split('@').last;
  return userEmail.split('@').last == teamExtension;
}

String trimFilterText1(String text) {
  return text.trim();
}

String trimFilter2(String text) {
  return text.trim() + 'z';
}

String fillSubjectPlaceHolder(
  LeadsRecord leadDoc,
  String subjectValue,
  String userDisplayName,
  String userEmail,
  String userJobTitle,
  String userPhone,
) {
  final String subject = subjectValue
      .replaceAll('{email}', leadDoc.email)
      .replaceAll('{first_name}', leadDoc.firstName)
      .replaceAll('{last_name}', leadDoc.lastName)
      .replaceAll('{city}', leadDoc.city)
      .replaceAll('{country}', leadDoc.country)
      .replaceAll('{gender}', leadDoc.gender)
      .replaceAll('{industry}', leadDoc.industry)
      .replaceAll('{language}', leadDoc.language)
      .replaceAll('{phone}', leadDoc.phone)
      .replaceAll('{photoUrl}', leadDoc.photoUrl)
      .replaceAll('{positionRole}', leadDoc.positionRole)
      .replaceAll('{street}', leadDoc.street)
      .replaceAll('{website}', leadDoc.website)
      .replaceAll('{zipCode}', leadDoc.zipCode)
      .replaceAll('{company}', leadDoc.company)
      .replaceAll('{u_display_name}', userDisplayName)
      .replaceAll('{u_email}', userEmail)
      .replaceAll('{u_job_title}', userJobTitle)
      .replaceAll('{u_phone}', userPhone);
  return subject;
}

String fillEmailBodyTemplate(
  String bodyValue,
  LeadsRecord leadDoc,
  String userDisplayNamw,
  String userEmail,
  String userJobTitle,
  String userPhone,
) {
  final String body = bodyValue
      .replaceAll('{email}', leadDoc.email)
      .replaceAll('{first_name}', leadDoc.firstName)
      .replaceAll('{last_name}', leadDoc.lastName)
      .replaceAll('{city}', leadDoc.city)
      .replaceAll('{country}', leadDoc.country)
      .replaceAll('{gender}', leadDoc.gender)
      .replaceAll('{industry}', leadDoc.industry)
      .replaceAll('{language}', leadDoc.language)
      .replaceAll('{phone}', leadDoc.phone)
      .replaceAll('{photoUrl}', leadDoc.photoUrl)
      .replaceAll('{positionRole}', leadDoc.positionRole)
      .replaceAll('{street}', leadDoc.street)
      .replaceAll('{website}', leadDoc.website)
      .replaceAll('{zipCode}', leadDoc.zipCode)
      .replaceAll('{company}', leadDoc.company)
      .replaceAll('{u_display_name}', userDisplayNamw)
      .replaceAll('{u_email}', userEmail)
      .replaceAll('{u_job_title}', userJobTitle)
      .replaceAll('{u_phone}', userPhone);
  return body;
}
