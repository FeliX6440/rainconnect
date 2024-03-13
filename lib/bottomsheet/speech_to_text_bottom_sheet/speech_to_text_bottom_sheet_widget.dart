import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:cross_file/cross_file.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:record/record.dart';
import 'speech_to_text_bottom_sheet_model.dart';
export 'speech_to_text_bottom_sheet_model.dart';

class SpeechToTextBottomSheetWidget extends StatefulWidget {
  const SpeechToTextBottomSheetWidget({
    super.key,
    required this.leadDocRef,
    this.componentDocRef,
    required this.isEdit,
  });

  final DocumentReference? leadDocRef;
  final DocumentReference? componentDocRef;
  final bool? isEdit;

  @override
  State<SpeechToTextBottomSheetWidget> createState() =>
      _SpeechToTextBottomSheetWidgetState();
}

class _SpeechToTextBottomSheetWidgetState
    extends State<SpeechToTextBottomSheetWidget> {
  late SpeechToTextBottomSheetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SpeechToTextBottomSheetModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget.isEdit!) {
        _model.contentResponse = await queryComponentContentRecordOnce(
          queryBuilder: (componentContentRecord) => componentContentRecord
              .where(
                'lead_ref',
                isEqualTo: widget.leadDocRef,
              )
              .where(
                'type',
                isEqualTo: ComponentType.SpeechToText.serialize(),
              ),
          singleRecord: true,
        ).then((s) => s.firstOrNull);
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(15.0),
          topRight: Radius.circular(15.0),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.clear_sharp,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    size: 30.0,
                  ),
                ),
              ],
            ),
            Container(
              width: double.infinity,
              height: 400.0,
              child: custom_widgets.SpeechToTextWidget(
                width: double.infinity,
                height: 400.0,
                recordButtonHeight: 70.0,
                recordButtonWidth: 70.0,
                glowColor: FlutterFlowTheme.of(context).primary,
                buttonColor: FlutterFlowTheme.of(context).primary,
                resetButtonColor: FlutterFlowTheme.of(context).secondaryText,
                dropdownListValue: FFAppState().languageList,
                isEdit: widget.isEdit!,
                leadRef: widget.leadDocRef!,
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
              child: FFButtonWidget(
                onPressed: () async {
                  if (widget.isEdit!) {
                    await _model.contentResponse!.reference
                        .update(createComponentContentRecordData(
                      content: FFAppState().audioTextResult,
                    ));
                    Navigator.pop(context);
                  } else {
                    await ComponentContentRecord.collection.doc().set({
                      ...createComponentContentRecordData(
                        leadRef: widget.leadDocRef,
                        type: ComponentType.SpeechToText,
                        content: FFAppState().audioTextResult,
                      ),
                      ...mapToFirestore(
                        {
                          'created_at': FieldValue.serverTimestamp(),
                        },
                      ),
                    });

                    await widget.componentDocRef!.update({
                      ...mapToFirestore(
                        {
                          'contain_leads':
                              FieldValue.arrayUnion([widget.leadDocRef]),
                        },
                      ),
                    });
                    context.safePop();
                  }
                },
                text: widget.isEdit! ? 'Update' : 'Save',
                options: FFButtonOptions(
                  width: double.infinity,
                  height: 40.0,
                  padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).primary,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Manrope',
                        color: Colors.white,
                      ),
                  elevation: 3.0,
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
