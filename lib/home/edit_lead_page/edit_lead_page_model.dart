import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'edit_lead_page_widget.dart' show EditLeadPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditLeadPageModel extends FlutterFlowModel<EditLeadPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for FirstName widget.
  FocusNode? firstNameFocusNode;
  TextEditingController? firstNameController;
  String? Function(BuildContext, String?)? firstNameControllerValidator;
  // State field(s) for LastName widget.
  FocusNode? lastNameFocusNode;
  TextEditingController? lastNameController;
  String? Function(BuildContext, String?)? lastNameControllerValidator;
  // State field(s) for Position widget.
  FocusNode? positionFocusNode;
  TextEditingController? positionController;
  String? Function(BuildContext, String?)? positionControllerValidator;
  // State field(s) for Language widget.
  FocusNode? languageFocusNode;
  TextEditingController? languageController;
  String? Function(BuildContext, String?)? languageControllerValidator;
  // State field(s) for GenderMW widget.
  FocusNode? genderMWFocusNode;
  TextEditingController? genderMWController;
  String? Function(BuildContext, String?)? genderMWControllerValidator;
  // State field(s) for Phone widget.
  FocusNode? phoneFocusNode;
  TextEditingController? phoneController;
  String? Function(BuildContext, String?)? phoneControllerValidator;
  // State field(s) for Email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailController;
  String? Function(BuildContext, String?)? emailControllerValidator;
  // State field(s) for Website widget.
  FocusNode? websiteFocusNode;
  TextEditingController? websiteController;
  String? Function(BuildContext, String?)? websiteControllerValidator;
  // State field(s) for City widget.
  FocusNode? cityFocusNode;
  TextEditingController? cityController;
  String? Function(BuildContext, String?)? cityControllerValidator;
  // State field(s) for ZIP widget.
  FocusNode? zipFocusNode;
  TextEditingController? zipController;
  String? Function(BuildContext, String?)? zipControllerValidator;
  // State field(s) for StreetandNum widget.
  FocusNode? streetandNumFocusNode;
  TextEditingController? streetandNumController;
  String? Function(BuildContext, String?)? streetandNumControllerValidator;
  // State field(s) for Country widget.
  FocusNode? countryFocusNode;
  TextEditingController? countryController;
  String? Function(BuildContext, String?)? countryControllerValidator;
  // State field(s) for Company widget.
  FocusNode? companyFocusNode;
  TextEditingController? companyController;
  String? Function(BuildContext, String?)? companyControllerValidator;
  // State field(s) for Industry widget.
  FocusNode? industryFocusNode;
  TextEditingController? industryController;
  String? Function(BuildContext, String?)? industryControllerValidator;

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

    positionFocusNode?.dispose();
    positionController?.dispose();

    languageFocusNode?.dispose();
    languageController?.dispose();

    genderMWFocusNode?.dispose();
    genderMWController?.dispose();

    phoneFocusNode?.dispose();
    phoneController?.dispose();

    emailFocusNode?.dispose();
    emailController?.dispose();

    websiteFocusNode?.dispose();
    websiteController?.dispose();

    cityFocusNode?.dispose();
    cityController?.dispose();

    zipFocusNode?.dispose();
    zipController?.dispose();

    streetandNumFocusNode?.dispose();
    streetandNumController?.dispose();

    countryFocusNode?.dispose();
    countryController?.dispose();

    companyFocusNode?.dispose();
    companyController?.dispose();

    industryFocusNode?.dispose();
    industryController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
