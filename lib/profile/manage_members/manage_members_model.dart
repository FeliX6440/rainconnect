import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/user_right_card_widget.dart';
import '/flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/profile/components/add_team_member_bottom_sheet/add_team_member_bottom_sheet_widget.dart';
import 'manage_members_widget.dart' show ManageMembersWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
