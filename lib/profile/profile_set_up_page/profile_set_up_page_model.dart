import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'profile_set_up_page_widget.dart' show ProfileSetUpPageWidget;
import 'package:flutter/material.dart';

class ProfileSetUpPageModel extends FlutterFlowModel<ProfileSetUpPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for fullName widget.
  FocusNode? fullNameFocusNode;
  TextEditingController? fullNameController;
  String? Function(BuildContext, String?)? fullNameControllerValidator;
  // State field(s) for job widget.
  FocusNode? jobFocusNode;
  TextEditingController? jobController;
  String? Function(BuildContext, String?)? jobControllerValidator;
  // State field(s) for phone widget.
  FocusNode? phoneFocusNode;
  TextEditingController? phoneController;
  String? Function(BuildContext, String?)? phoneControllerValidator;
  // State field(s) for isInvite widget.
  bool? isInviteValue;
  // State field(s) for inviteId widget.
  FocusNode? inviteIdFocusNode;
  TextEditingController? inviteIdController;
  String? Function(BuildContext, String?)? inviteIdControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  TeamsRecord? teamDoc;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  UsersRecord? creator;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  TeamsRecord? newTeamDoc;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    fullNameFocusNode?.dispose();
    fullNameController?.dispose();

    jobFocusNode?.dispose();
    jobController?.dispose();

    phoneFocusNode?.dispose();
    phoneController?.dispose();

    inviteIdFocusNode?.dispose();
    inviteIdController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
