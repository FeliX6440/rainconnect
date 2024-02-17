import '/flutter_flow/flutter_flow_util.dart';
import 'edit_industrial_fair_bottom_sheet_widget.dart'
    show EditIndustrialFairBottomSheetWidget;
import 'package:flutter/material.dart';

class EditIndustrialFairBottomSheetModel
    extends FlutterFlowModel<EditIndustrialFairBottomSheetWidget> {
  ///  Local state fields for this component.

  List<String> listValue = [];
  void addToListValue(String item) => listValue.add(item);
  void removeFromListValue(String item) => listValue.remove(item);
  void removeAtIndexFromListValue(int index) => listValue.removeAt(index);
  void insertAtIndexInListValue(int index, String item) =>
      listValue.insert(index, item);
  void updateListValueAtIndex(int index, Function(String) updateFn) =>
      listValue[index] = updateFn(listValue[index]);

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
