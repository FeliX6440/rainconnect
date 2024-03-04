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
import 'package:flutter_file_dialog/flutter_file_dialog.dart';

Future<void> exportLeadsDocsAsCSV(
    BuildContext context, List<LeadsRecord> leadDocs) async {
  final firestore = FirebaseFirestore.instance;
  final rows = [
    [
      'First Name',
      'Last Name',
      'Email',
      'Gender',
      'Phone',
      'Company',
      'City',
      'Country',
      'Language',
      'Industry',
      'Speech to Text',
      'Note',
      'Temperature',
      'Dropdown',
      'TextField',
      'Industrial Fair',
      'Multiple Choice',
    ]
  ];

  for (final leadData in leadDocs) {
    final componentContentQuery = await firestore
        .collection('component_content')
        .where('lead_ref', isEqualTo: leadData.reference);
    final componentContentDocs = await componentContentQuery
        .get()
        .then((value) => value.docs.map((e) => e.data()).toList());

    String speechToTextContent = '';
    String noteContent = '';
    String temperatureContent = '';
    String dropdownContent = '';
    String textFieldContent = '';
    String industrialFairContent = '';
    String multipleChoiceContent = '';

    if (componentContentDocs.isNotEmpty) {
      speechToTextContent =
          _getContent(componentContentDocs, ComponentType.SpeechToText);
      noteContent = _getContent(componentContentDocs, ComponentType.Note);
      temperatureContent =
          _getContent(componentContentDocs, ComponentType.Temperature);
      dropdownContent =
          _getContent(componentContentDocs, ComponentType.Dropdown);
      textFieldContent =
          _getContent(componentContentDocs, ComponentType.TextField);
      industrialFairContent =
          _getContent(componentContentDocs, ComponentType.industrialFair);
      multipleChoiceContent =
          _getContent(componentContentDocs, ComponentType.MultipleChoice);
    }

    final leadRow = [
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
      speechToTextContent,
      noteContent,
      temperatureContent,
      dropdownContent,
      textFieldContent,
      industrialFairContent,
      multipleChoiceContent,
    ];

    rows.add(leadRow);
  }

  final csv = const ListToCsvConverter().convert(rows);

  final pickedDirectory = await FlutterFileDialog.pickDirectory();

  if (pickedDirectory != null) {
    final filePath = await _saveFile(csv, pickedDirectory);
    print(filePath);
  }

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text('CSV file exported successfully')),
  );
}

String _getContent(
    List<Map<String, dynamic>> componentContentDocs, ComponentType type) {
  final content = componentContentDocs
      .where((element) => element['type'] == type.name)
      .toList();
  return content.isEmpty ? '' : content.first['content'] ?? '';
}

Future<String?> _saveFile(String csv, DirectoryLocation pickedDirectory) async {
  final filePath = await getDownloadsDirectory();
  if (filePath == null) return null;
  final path = '${filePath.path!}/leads.csv';
  final leadFile = File(path);
  return await FlutterFileDialog.saveFileToDirectory(
    directory: pickedDirectory,
    data: leadFile.readAsBytesSync(),
    mimeType: "leads/csv",
    fileName: "leads.csv",
    replace: true,
  );
}
