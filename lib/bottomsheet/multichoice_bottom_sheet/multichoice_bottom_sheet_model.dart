import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'multichoice_bottom_sheet_widget.dart' show MultichoiceBottomSheetWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
