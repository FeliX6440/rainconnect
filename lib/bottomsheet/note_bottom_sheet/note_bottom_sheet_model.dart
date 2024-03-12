import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'note_bottom_sheet_widget.dart' show NoteBottomSheetWidget;
import 'package:flutter/material.dart';

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
