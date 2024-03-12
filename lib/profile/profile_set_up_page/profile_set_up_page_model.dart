import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'profile_set_up_page_widget.dart' show ProfileSetUpPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProfileSetUpPageModel extends FlutterFlowModel<ProfileSetUpPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for firstName widget.
  FocusNode? firstNameFocusNode;
  TextEditingController? firstNameController;
  String? Function(BuildContext, String?)? firstNameControllerValidator;
  // State field(s) for lastName widget.
  FocusNode? lastNameFocusNode;
  TextEditingController? lastNameController;
  String? Function(BuildContext, String?)? lastNameControllerValidator;
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
    firstNameFocusNode?.dispose();
    firstNameController?.dispose();

    lastNameFocusNode?.dispose();
    lastNameController?.dispose();

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
