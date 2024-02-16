import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'text_field_bottom_sheet_widget.dart' show TextFieldBottomSheetWidget;
import 'package:flutter/material.dart';

class TextFieldBottomSheetModel
    extends FlutterFlowModel<TextFieldBottomSheetWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in TextFieldBottomSheet widget.
  ComponentContentRecord? result;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
