import '/flutter_flow/flutter_flow_util.dart';
import 'add_team_member_bottom_sheet_widget.dart'
    show AddTeamMemberBottomSheetWidget;
import 'package:flutter/material.dart';

class AddTeamMemberBottomSheetModel
    extends FlutterFlowModel<AddTeamMemberBottomSheetWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailController;
  String? Function(BuildContext, String?)? emailControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    emailFocusNode?.dispose();
    emailController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
