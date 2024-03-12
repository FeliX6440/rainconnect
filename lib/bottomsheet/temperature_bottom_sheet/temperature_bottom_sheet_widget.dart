import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'temperature_bottom_sheet_model.dart';
export 'temperature_bottom_sheet_model.dart';

class TemperatureBottomSheetWidget extends StatefulWidget {
  const TemperatureBottomSheetWidget({
    super.key,
    required this.leadDocRef,
    required this.componentDoc,
    required this.isEdit,
  });

  final DocumentReference? leadDocRef;
  final TeamComponentsRecord? componentDoc;
  final bool? isEdit;

  @override
  State<TemperatureBottomSheetWidget> createState() =>
      _TemperatureBottomSheetWidgetState();
}

class _TemperatureBottomSheetWidgetState
    extends State<TemperatureBottomSheetWidget> {
  late TemperatureBottomSheetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TemperatureBottomSheetModel());

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
                isEqualTo: ComponentType.Temperature.serialize(),
              )
              .where(
                'component_name',
                isEqualTo: widget.componentDoc?.name,
              ),
          singleRecord: true,
        ).then((s) => s.firstOrNull);
        setState(() {
          _model.tempValueController?.value = _model.contentResponse!.content;
        });
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
              child: FlutterFlowDropDown<String>(
                controller: _model.tempValueController ??=
                    FormFieldController<String>(null),
                options: const ['Cold', 'Warm', 'Hot'],
                onChanged: (val) => setState(() => _model.tempValue = val),
                width: double.infinity,
                height: 50.0,
                textStyle: FlutterFlowTheme.of(context).bodyMedium,
                hintText: 'Please select...',
                icon: Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: FlutterFlowTheme.of(context).secondaryText,
                  size: 24.0,
                ),
                elevation: 2.0,
                borderColor: FlutterFlowTheme.of(context).alternate,
                borderWidth: 2.0,
                borderRadius: 8.0,
                margin: const EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
                hidesUnderline: true,
                isOverButton: true,
                isSearchable: false,
                isMultiSelect: false,
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
              child: FFButtonWidget(
                onPressed: () async {
                  if (widget.isEdit!) {
                    await _model.contentResponse!.reference
                        .update(createComponentContentRecordData(
                      content: _model.tempValue,
                    ));
                    Navigator.pop(context);
                  } else {
                    await ComponentContentRecord.collection.doc().set({
                      ...createComponentContentRecordData(
                        leadRef: widget.leadDocRef,
                        type: ComponentType.Temperature,
                        content: _model.tempValue,
                        componentName: widget.componentDoc?.name,
                      ),
                      ...mapToFirestore(
                        {
                          'created_at': FieldValue.serverTimestamp(),
                        },
                      ),
                    });

                    await widget.componentDoc!.reference.update({
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
