import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'note_bottom_sheet_widget.dart' show NoteBottomSheetWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NoteBottomSheetModel extends FlutterFlowModel<NoteBottomSheetWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in NoteBottomSheet widget.
  ComponentContentRecord? contentResponse;
  // State field(s) for note widget.
  FocusNode? noteFocusNode;
  TextEditingController? noteController;
  String? Function(BuildContext, String?)? noteControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    noteFocusNode?.dispose();
    noteController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
