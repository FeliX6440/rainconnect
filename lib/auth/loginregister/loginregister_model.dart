import '/flutter_flow/flutter_flow_util.dart';
import 'loginregister_widget.dart' show LoginregisterWidget;
import 'package:flutter/material.dart';

class LoginregisterModel extends FlutterFlowModel<LoginregisterWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey2 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for regEmail widget.
  FocusNode? regEmailFocusNode;
  TextEditingController? regEmailController;
  String? Function(BuildContext, String?)? regEmailControllerValidator;
  String? _regEmailControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Has to be a valid email address.';
    }
    return null;
  }

  // State field(s) for regPass widget.
  FocusNode? regPassFocusNode;
  TextEditingController? regPassController;
  late bool regPassVisibility;
  String? Function(BuildContext, String?)? regPassControllerValidator;
  String? _regPassControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 6) {
      return 'Requires at least 6 characters.';
    }

    return null;
  }

  // State field(s) for regConfirmPass widget.
  FocusNode? regConfirmPassFocusNode;
  TextEditingController? regConfirmPassController;
  late bool regConfirmPassVisibility;
  String? Function(BuildContext, String?)? regConfirmPassControllerValidator;
  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode;
  TextEditingController? emailAddressController;
  String? Function(BuildContext, String?)? emailAddressControllerValidator;
  String? _emailAddressControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Has to be a valid email address.';
    }
    return null;
  }

  // State field(s) for password widget.
  FocusNode? passwordFocusNode;
  TextEditingController? passwordController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordControllerValidator;
  String? _passwordControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    regEmailControllerValidator = _regEmailControllerValidator;
    regPassVisibility = false;
    regPassControllerValidator = _regPassControllerValidator;
    regConfirmPassVisibility = false;
    emailAddressControllerValidator = _emailAddressControllerValidator;
    passwordVisibility = false;
    passwordControllerValidator = _passwordControllerValidator;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    tabBarController?.dispose();
    regEmailFocusNode?.dispose();
    regEmailController?.dispose();

    regPassFocusNode?.dispose();
    regPassController?.dispose();

    regConfirmPassFocusNode?.dispose();
    regConfirmPassController?.dispose();

    emailAddressFocusNode?.dispose();
    emailAddressController?.dispose();

    passwordFocusNode?.dispose();
    passwordController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
