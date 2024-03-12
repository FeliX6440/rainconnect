import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'email_template_editor_widget.dart' show EmailTemplateEditorWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EmailTemplateEditorModel
    extends FlutterFlowModel<EmailTemplateEditorWidget> {
  ///  Local state fields for this page.

  List<String> templateValues = [
    '{email}',
    '{first_name}',
    '{last_name}',
    '{city}',
    '{country}',
    '{gender}',
    '{industry}',
    '{language}',
    '{phone}',
    '{photoUrl}',
    '{positionRole}',
    '{street}',
    '{website}',
    '{zipCode}',
    '{company}'
  ];
  void addToTemplateValues(String item) => templateValues.add(item);
  void removeFromTemplateValues(String item) => templateValues.remove(item);
  void removeAtIndexFromTemplateValues(int index) =>
      templateValues.removeAt(index);
  void insertAtIndexInTemplateValues(int index, String item) =>
      templateValues.insert(index, item);
  void updateTemplateValuesAtIndex(int index, Function(String) updateFn) =>
      templateValues[index] = updateFn(templateValues[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
