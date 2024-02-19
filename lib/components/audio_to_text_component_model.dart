import '/flutter_flow/flutter_flow_util.dart';
import 'audio_to_text_component_widget.dart' show AudioToTextComponentWidget;
import 'package:flutter/material.dart';
import 'package:record/record.dart';

class AudioToTextComponentModel
    extends FlutterFlowModel<AudioToTextComponentWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  AudioRecorder? audioRecorder;

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
