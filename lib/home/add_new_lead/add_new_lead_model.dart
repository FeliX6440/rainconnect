import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'add_new_lead_widget.dart' show AddNewLeadWidget;
import 'package:flutter/material.dart';

class AddNewLeadModel extends FlutterFlowModel<AddNewLeadWidget> {
  ///  Local state fields for this page.

  bool isTileUsed = false;

  int pageIndex = 0;

  bool isPreviouse = false;

  String? componentValue;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - Read Document] action in IconButton widget.
  LeadsRecord? previouseLeadDoc;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Backend Call - API (BusinessCardReaderEndPoint)] action in Button widget.
  ApiCallResponse? apiResulttoj;
  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

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
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  LeadsRecord? leadResponse;

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
