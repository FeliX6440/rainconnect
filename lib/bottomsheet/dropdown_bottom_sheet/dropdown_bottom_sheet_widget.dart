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
import 'package:provider/provider.dart';
import 'dropdown_bottom_sheet_model.dart';
export 'dropdown_bottom_sheet_model.dart';

class DropdownBottomSheetWidget extends StatefulWidget {
  const DropdownBottomSheetWidget({
    super.key,
    required this.teamComponentDoc,
    required this.leadDocRef,
    required this.isEdit,
  });

  final TeamComponentsRecord? teamComponentDoc;
  final DocumentReference? leadDocRef;
  final bool? isEdit;

  @override
  State<DropdownBottomSheetWidget> createState() =>
      _DropdownBottomSheetWidgetState();
}

class _DropdownBottomSheetWidgetState extends State<DropdownBottomSheetWidget> {
  late DropdownBottomSheetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DropdownBottomSheetModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget.isEdit!) {
        _model.response = await queryComponentContentRecordOnce(
          queryBuilder: (componentContentRecord) => componentContentRecord
              .where(
                'lead_ref',
                isEqualTo: widget.leadDocRef,
              )
              .where(
                'type',
                isEqualTo: ComponentType.Dropdown.serialize(),
              ),
          singleRecord: true,
        ).then((s) => s.firstOrNull);
        setState(() {
          _model.dropDownValueController?.value = _model.response!.content;
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
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 20.0),
              child: FlutterFlowDropDown<String>(
                controller: _model.dropDownValueController ??=
                    FormFieldController<String>(null),
                options: widget.teamComponentDoc!.listValue,
                onChanged: (val) => setState(() => _model.dropDownValue = val),
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
            FFButtonWidget(
              onPressed: () async {
                if (widget.isEdit!) {
                  await _model.response!.reference
                      .update(createComponentContentRecordData(
                    content: _model.dropDownValue,
                  ));
                  Navigator.pop(context);
                } else {
                  await ComponentContentRecord.collection.doc().set({
                    ...createComponentContentRecordData(
                      leadRef: widget.leadDocRef,
                      type: ComponentType.Dropdown,
                      content: _model.dropDownValue,
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
                iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
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
          ],
        ),
      ),
    );
  }
}
