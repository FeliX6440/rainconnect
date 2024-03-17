import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'new_or_edit_component_widget.dart' show NewOrEditComponentWidget;
import 'package:flutter/material.dart';

class NewOrEditComponentModel
    extends FlutterFlowModel<NewOrEditComponentWidget> {
  ///  Local state fields for this page.

  String? selectedComponent;

  List<String> addedOptionsForDropDown = [];
  void addToAddedOptionsForDropDown(String item) =>
      addedOptionsForDropDown.add(item);
  void removeFromAddedOptionsForDropDown(String item) =>
      addedOptionsForDropDown.remove(item);
  void removeAtIndexFromAddedOptionsForDropDown(int index) =>
      addedOptionsForDropDown.removeAt(index);
  void insertAtIndexInAddedOptionsForDropDown(int index, String item) =>
      addedOptionsForDropDown.insert(index, item);
  void updateAddedOptionsForDropDownAtIndex(
          int index, Function(String) updateFn) =>
      addedOptionsForDropDown[index] = updateFn(addedOptionsForDropDown[index]);

  List<String> addedOptionForMultiChoice = [];
  void addToAddedOptionForMultiChoice(String item) =>
      addedOptionForMultiChoice.add(item);
  void removeFromAddedOptionForMultiChoice(String item) =>
      addedOptionForMultiChoice.remove(item);
  void removeAtIndexFromAddedOptionForMultiChoice(int index) =>
      addedOptionForMultiChoice.removeAt(index);
  void insertAtIndexInAddedOptionForMultiChoice(int index, String item) =>
      addedOptionForMultiChoice.insert(index, item);
  void updateAddedOptionForMultiChoiceAtIndex(
          int index, Function(String) updateFn) =>
      addedOptionForMultiChoice[index] =
          updateFn(addedOptionForMultiChoice[index]);

  List<String> typeList = ['TextField', 'MultipleChoice', 'Dropdown'];
  void addToTypeList(String item) => typeList.add(item);
  void removeFromTypeList(String item) => typeList.remove(item);
  void removeAtIndexFromTypeList(int index) => typeList.removeAt(index);
  void insertAtIndexInTypeList(int index, String item) =>
      typeList.insert(index, item);
  void updateTypeListAtIndex(int index, Function(String) updateFn) =>
      typeList[index] = updateFn(typeList[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for componentType widget.
  String? componentTypeValue;
  FormFieldController<String>? componentTypeValueController;
  // State field(s) for options widget.
  FocusNode? optionsFocusNode;
  TextEditingController? optionsController;
  String? Function(BuildContext, String?)? optionsControllerValidator;
  // State field(s) for TextFieldValue widget.
  FocusNode? textFieldValueFocusNode;
  TextEditingController? textFieldValueController;
  String? Function(BuildContext, String?)? textFieldValueControllerValidator;
  // State field(s) for choiceOption widget.
  FocusNode? choiceOptionFocusNode;
  TextEditingController? choiceOptionController;
  String? Function(BuildContext, String?)? choiceOptionControllerValidator;
  // Stores action output result for [Custom Action - checkIFComponentExit] action in Button widget.
  bool? isEmpty1;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  TeamComponentsRecord? result1;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  TeamComponentsRecord? result2;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  TeamComponentsRecord? result3;
  // Stores action output result for [Custom Action - checkIFComponentExit] action in Button widget.
  bool? isEmpty2;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController1?.dispose();

    optionsFocusNode?.dispose();
    optionsController?.dispose();

    textFieldValueFocusNode?.dispose();
    textFieldValueController?.dispose();

    choiceOptionFocusNode?.dispose();
    choiceOptionController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
