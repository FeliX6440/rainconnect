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

Future exportLeadsDocsAsCSV(
  BuildContext context,
  List<LeadsRecord> leadDocs,
  List<ArchiveComponentRecord> archives,
  List<TeamComponentsRecord> component,
) async {
  // Add your function code here!
  final firestore = FirebaseFirestore.instance;

  final subRow = [
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
    'location',
    'Speech to Text',
    'Note',
    'Temperature',
    ...archives
        .map((archive) => archive.componentName)
        .toList(), // Add archive component names to subRow
  ];
  final rows = [subRow];

  for (final leadData in leadDocs) {
    // subRow.add(value)
    final componentContentQuery = await firestore
        .collection('component_content')
        .where('lead_ref', isEqualTo: leadData.reference);
    final componentContentDocs = await componentContentQuery
        .get()
        .then((value) => value.docs.map((e) => e.data()).toList());

    String speechToTextContent = '';
    String noteContent = '';
    String temperatureContent = '';

    if (componentContentDocs.isNotEmpty) {
      print(componentContentDocs);
      speechToTextContent = _getContent(
        componentContentDocs,
        type: 'SpeechToText',
      );
      noteContent = _getContent(
        componentContentDocs,
        type: 'Note',
      );
      temperatureContent = _getContent(
        componentContentDocs,
        type: 'Temperature',
      );
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
      leadData.location ?? '',
      speechToTextContent,
      noteContent,
      temperatureContent,
      ...archives
          .map((archive) =>
              _getCustomContent(componentContentDocs, archive.componentName))
          .toList(), // Add archive component content to leadRow
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

String _getContent(List<Map<String, dynamic>> componentContentDocs,
    {String? type}) {
  final content =
      componentContentDocs.where((element) => element['type'] == type).toList();
  return content.isEmpty
      ? ''
      : type == 'MultipleChoice'
          ? content.first['list_content']
              .toString()
              .replaceFirst('[', '')
              .replaceFirst(']', '')
          : content.first['content'] ?? '';
}

String _getCustomContent(
  List<Map<String, dynamic>> componentContentDocs,
  String name,
) {
  final content = componentContentDocs
      .where((element) => element['component_name'] == name)
      .toList();
  return content.isEmpty
      ? ''
      : content.first['type'] == 'MultipleChoice'
          ? content.first['list_content']
              .toString()
              .replaceFirst('[', '')
              .replaceFirst(']', '')
          : content.first['content'] ?? '';
}

Future<String?> _saveFile(String csv, DirectoryLocation pickedDirectory) async {
  final filePath = await getApplicationDocumentsDirectory();

  final path = '${filePath.path}/leads.csv';
  final leadFile = File(path);
  await leadFile.writeAsString(csv);
  return await FlutterFileDialog.saveFileToDirectory(
    directory: pickedDirectory,
    data: leadFile.readAsBytesSync(),
    mimeType: "leads/csv",
    fileName: "leads.csv",
    replace: true,
  );
}
