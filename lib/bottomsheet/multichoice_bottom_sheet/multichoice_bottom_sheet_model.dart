import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'multichoice_bottom_sheet_widget.dart' show MultichoiceBottomSheetWidget;
import 'package:flutter/material.dart';

class MultichoiceBottomSheetModel
    extends FlutterFlowModel<MultichoiceBottomSheetWidget> {
  ///  Local state fields for this component.

  List<String> selectedValue = [];
  void addToSelectedValue(String item) => selectedValue.add(item);
  void removeFromSelectedValue(String item) => selectedValue.remove(item);
  void removeAtIndexFromSelectedValue(int index) =>
      selectedValue.removeAt(index);
  void insertAtIndexInSelectedValue(int index, String item) =>
      selectedValue.insert(index, item);
  void updateSelectedValueAtIndex(int index, Function(String) updateFn) =>
      selectedValue[index] = updateFn(selectedValue[index]);

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in MultichoiceBottomSheet widget.
  ComponentContentRecord? data;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
