import '/flutter_flow/flutter_flow_util.dart';
import 'manage_members_widget.dart' show ManageMembersWidget;
import 'package:flutter/material.dart';

class ManageMembersModel extends FlutterFlowModel<ManageMembersWidget> {
  ///  Local state fields for this page.

  List<String> searchedUsersName = [];
  void addToSearchedUsersName(String item) => searchedUsersName.add(item);
  void removeFromSearchedUsersName(String item) =>
      searchedUsersName.remove(item);
  void removeAtIndexFromSearchedUsersName(int index) =>
      searchedUsersName.removeAt(index);
  void insertAtIndexInSearchedUsersName(int index, String item) =>
      searchedUsersName.insert(index, item);
  void updateSearchedUsersNameAtIndex(int index, Function(String) updateFn) =>
      searchedUsersName[index] = updateFn(searchedUsersName[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  final textFieldKey = GlobalKey();
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? textFieldSelectedOption;
  String? Function(BuildContext, String?)? textControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
