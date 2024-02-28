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

import 'package:path_provider/path_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:csv/csv.dart';

Future exportLeadsDocsAsCSV(
  List<LeadsRecord> leadDocs,
  List<ComponentContentRecord> componentContentDocs,
) async {
  // Add your function code here!
  List<List<dynamic>> rows = [
    'first_name',
    'last_name',
    'email',
    'gender',
    'phone',
    'company',
    'city',
    'country',
    'language',
    'industry',
  ];
  leadDocs.forEach((doc) {});
}

//  FirebaseFirestore firestore = FirebaseFirestore.instance;

//   Future<void> exportUsers() async {
//     List<List<dynamic>> rows = [
//       ['Name', 'Email', 'Age'] // CSV headers
//     ];

//     QuerySnapshot querySnapshot = await firestore.collection('users').get();

//     querySnapshot.docs.forEach((doc) {
//       var userData = doc.data();
//       rows.add([
//         userData['name'] ?? '',
//         userData['email'] ?? '',
//         userData['age'] ?? '',
//       ]);
//     });

//     String csv = const ListToCsvConverter().convert(rows);

//     final String dir = (await getApplicationDocumentsDirectory()).path;
//     final String path = '$dir/users.csv';
//     final File file = File(path);

//     await file.writeAsString(csv);

//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text('CSV file exported successfully')),
//     );

//     // Open file or download it
//     // For now, let's just print the path
//     print('CSV file path: $path');
//   }
