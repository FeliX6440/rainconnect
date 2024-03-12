import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'text_field_bottom_sheet_model.dart';
export 'text_field_bottom_sheet_model.dart';

class TextFieldBottomSheetWidget extends StatefulWidget {
  const TextFieldBottomSheetWidget({
    super.key,
    required this.isEdit,
    required this.teamComponentDoc,
    required this.leadDocRef,
  });

  final bool? isEdit;
  final TeamComponentsRecord? teamComponentDoc;
  final DocumentReference? leadDocRef;

  @override
  State<TextFieldBottomSheetWidget> createState() =>
      _TextFieldBottomSheetWidgetState();
}

class _TextFieldBottomSheetWidgetState
    extends State<TextFieldBottomSheetWidget> {
  late TextFieldBottomSheetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TextFieldBottomSheetModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget.isEdit!) {
        _model.result = await queryComponentContentRecordOnce(
          queryBuilder: (componentContentRecord) => componentContentRecord
              .where(
                'lead_ref',
                isEqualTo: widget.leadDocRef,
              )
              .where(
                'type',
                isEqualTo: ComponentType.TextField.serialize(),
              ),
          singleRecord: true,
        ).then((s) => s.firstOrNull);
        setState(() {
          _model.textController?.text = _model.result!.content;
        });
      }
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
              child: TextFormField(
                controller: _model.textController,
                focusNode: _model.textFieldFocusNode,
                autofocus: true,
                obscureText: false,
                decoration: InputDecoration(
                  labelStyle: FlutterFlowTheme.of(context).labelMedium,
                  hintText: 'Type in your note here...',
                  hintStyle: FlutterFlowTheme.of(context).labelMedium,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).alternate,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).primary,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).error,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).error,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                style: FlutterFlowTheme.of(context).bodyMedium,
                validator: _model.textControllerValidator.asValidator(context),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
              child: FFButtonWidget(
                onPressed: () async {
                  if (widget.isEdit!) {
                    await _model.result!.reference
                        .update(createComponentContentRecordData(
                      content: _model.textController.text,
                    ));
                    Navigator.pop(context);
                  } else {
                    await ComponentContentRecord.collection.doc().set({
                      ...createComponentContentRecordData(
                        leadRef: widget.leadDocRef,
                        type: ComponentType.TextField,
                        content: _model.textController.text,
                      ),
                      ...mapToFirestore(
                        {
                          'created_at': FieldValue.serverTimestamp(),
                        },
                      ),
                    });

                    await widget.teamComponentDoc!.reference.update({
                      ...mapToFirestore(
                        {
                          'contain_leads':
                              FieldValue.arrayUnion([widget.leadDocRef]),
                        },
                      ),
                    });
                    Navigator.pop(context);
                  }
                },
                text: widget.isEdit! ? 'Update' : 'Save',
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
