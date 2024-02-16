import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'speech_to_text_bottom_sheet_model.dart';
export 'speech_to_text_bottom_sheet_model.dart';

class SpeechToTextBottomSheetWidget extends StatefulWidget {
  const SpeechToTextBottomSheetWidget({
    super.key,
    required this.leadDocRef,
    this.componentDocRef,
  });

  final DocumentReference? leadDocRef;
  final DocumentReference? componentDocRef;

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
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(15.0),
          topRight: Radius.circular(15.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
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
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
              child: FFButtonWidget(
                onPressed: () async {
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
                },
                text: 'Save',
                options: FFButtonOptions(
                  width: double.infinity,
                  height: 40.0,
                  padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                  iconPadding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).primary,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Manrope',
                        color: Colors.white,
                      ),
                  elevation: 3.0,
                  borderSide: const BorderSide(
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
