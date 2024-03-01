// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:csv/csv.dart';

Future<void> exportLeadsDocsAsCSV(
  BuildContext context,
  List<LeadsRecord> leadDocs,
) async {
  final fireStore = FirebaseFirestore.instance;
  List<List<dynamic>> rows = [
    [
      'first name',
      'last name',
      'email',
      'gender',
      'phone',
      'company',
      'city',
      'country',
      'language',
      'industry',
      'speech to text',
      'note',
      'Temperature',
      'Dropdown',
      'TextField',
      'Industrial Fair',
      'Multiple Choice',
    ]
  ];

  for (final leadData in leadDocs) {
    // final componentContentQuery = await fireStore
    //     .collection('component_content')
    //     .where('lead_ref', isEqualTo: leadData.reference);
    // final componentContentDocs = await componentContentQuery.get();

    // // Check if the query result is empty before accessing .first
    // String speechToTextContent = '';
    // String noteContent = '';
    // String temperatureContent = '';
    // String dropdownContent = '';
    // String textFieldContent = '';
    // String industrialFairContent = '';
    // String multipleChoiceContent = '';

    // if (componentContentDocs.docs.isNotEmpty) {
    //   speechToTextContent = componentContentDocs.docs
    //           .firstWhere(
    //             (element) => element.data()['type'] == 'SpeechToText',
    //           )
    //           ?.data()['content'] ??
    //       '';
    //   noteContent = componentContentDocs.docs
    //           .firstWhere(
    //             (element) => element.data()['type'] == 'Note',
    //           )
    //           ?.data()['content'] ??
    //       '';
    //   temperatureContent = componentContentDocs.docs
    //           .firstWhere(
    //             (element) => element.data()['type'] == 'Temperature',
    //           )
    //           ?.data()['content'] ??
    //       '';
    //   dropdownContent = componentContentDocs.docs
    //           .firstWhere(
    //             (element) => element.data()['type'] == 'Dropdown',
    //           )
    //           ?.data()['content'] ??
    //       '';
    //   textFieldContent = componentContentDocs.docs
    //           .firstWhere(
    //             (element) => element.data()['type'] == 'TextField',
    //           )
    //           ?.data()['content'] ??
    //       '';
    //   industrialFairContent = componentContentDocs.docs
    //           .firstWhere(
    //             (element) => element.data()['type'] == 'industrialFair',
    //           )
    //           ?.data()['content'] ??
    //       '';
    //   multipleChoiceContent = componentContentDocs.docs
    //           .firstWhere(
    //             (element) => element.data()['type'] == 'MultipleChoice',
    //           )
    //           ?.data()['content'] ??
    //       '';
    // }

    List<dynamic> leadRow = [
      leadData.firstName ?? '',
      leadData.lastName ?? '',
      leadData.email ?? '',
      leadData.gender ?? '',
      leadData.phone ?? '',
      leadData.company ?? '',
      leadData.city ?? '',
      leadData.country ?? '',
      leadData.language ?? '',
      leadData.industry ?? '',
      // speechToTextContent,
      // noteContent,
      // temperatureContent,
      // dropdownContent,
      // textFieldContent,
      // industrialFairContent,
      // multipleChoiceContent,
    ];

    rows.add(leadRow);
  }

  String csv = const ListToCsvConverter().convert(rows);
  final String dir = (await getApplicationDocumentsDirectory()).path;
  final String path = '$dir/leads.csv';
  final File file = File(path);

  await file.writeAsString(csv);

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text('CSV file exported successfully')),
  );
}
