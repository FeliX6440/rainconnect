import '/flutter_flow/flutter_flow_util.dart';
import 'email_template_editor_copy_widget.dart'
    show EmailTemplateEditorCopyWidget;
import 'package:flutter/material.dart';

class EmailTemplateEditorCopyModel
    extends FlutterFlowModel<EmailTemplateEditorCopyWidget> {
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
