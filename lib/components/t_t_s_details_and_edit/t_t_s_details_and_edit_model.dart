import '/flutter_flow/flutter_flow_util.dart';
import 't_t_s_details_and_edit_widget.dart' show TTSDetailsAndEditWidget;
import 'package:flutter/material.dart';

class TTSDetailsAndEditModel extends FlutterFlowModel<TTSDetailsAndEditWidget> {
  ///  Local state fields for this component.

  bool isEdit = false;

  ///  State fields for stateful widgets in this component.

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
