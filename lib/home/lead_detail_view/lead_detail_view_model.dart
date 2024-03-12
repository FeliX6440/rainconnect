import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/bottomsheet/dropdown_bottom_sheet/dropdown_bottom_sheet_widget.dart';
import '/bottomsheet/email_template_bottom_sheet/email_template_bottom_sheet_widget.dart';
import '/bottomsheet/multichoice_bottom_sheet/multichoice_bottom_sheet_widget.dart';
import '/bottomsheet/note_bottom_sheet/note_bottom_sheet_widget.dart';
import '/bottomsheet/speech_to_text_bottom_sheet/speech_to_text_bottom_sheet_widget.dart';
import '/bottomsheet/temperature_bottom_sheet/temperature_bottom_sheet_widget.dart';
import '/bottomsheet/text_field_bottom_sheet/text_field_bottom_sheet_widget.dart';
import '/components/component_details_sheet/component_details_sheet_widget.dart';
import '/components/delete_lead_component/delete_lead_component_widget.dart';
import '/components/edit_industrial_fair_component_widget.dart';
import '/components/edit_sale_person_component_content_widget.dart';
import '/components/edit_single_lead_content_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'lead_detail_view_widget.dart' show LeadDetailViewWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LeadDetailViewModel extends FlutterFlowModel<LeadDetailViewWidget> {
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
