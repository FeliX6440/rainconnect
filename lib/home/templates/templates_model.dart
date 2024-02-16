import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'templates_widget.dart' show TemplatesWidget;
import 'package:flutter/material.dart';

class TemplatesModel extends FlutterFlowModel<TemplatesWidget> {
  ///  Local state fields for this page.

  String selectedTemplate = '';

  bool switchState = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in Templates widget.
  List<TeamComponentsRecord>? componentData;
  // State field(s) for Switch widget.
  bool? switchValue;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered = false;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
