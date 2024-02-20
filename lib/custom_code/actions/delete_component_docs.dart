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

Future deleteComponentDocs(
  List<TeamComponentsRecord> componentDocs,
  DocumentReference teamRef,
) async {
  // Add your function code here!
  if (componentDocs.isNotEmpty) {
    try {
      for (final doc in componentDocs) {
        FirebaseFirestore.instance
            .collection('teams')
            .doc(teamRef.id)
            .collection('team_components')
            .doc(doc.reference.id)
            .delete();
      }
    } catch (e) {
      print(e);
    }
  }
}
