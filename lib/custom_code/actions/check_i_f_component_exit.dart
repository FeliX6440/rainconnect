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

Future<bool> checkIFComponentExit(
  String name,
  String teamID,
) async {
  // Add your function code here!
  final querySnapshot = await FirebaseFirestore.instance
      .collection('teams')
      .doc(teamID)
      .collection('team_components')
      .where('name', isEqualTo: name)
      .limit(1)
      .get()
      .catchError(
    (err) {
      print('Error querying $name: $err');
    },
  );

  return querySnapshot.docs.isEmpty;
}
