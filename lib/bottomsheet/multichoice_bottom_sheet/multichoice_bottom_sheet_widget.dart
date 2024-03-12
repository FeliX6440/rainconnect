import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'multichoice_bottom_sheet_model.dart';
export 'multichoice_bottom_sheet_model.dart';

class MultichoiceBottomSheetWidget extends StatefulWidget {
  const MultichoiceBottomSheetWidget({
    super.key,
    required this.componentDoc,
    required this.leadDocRef,
    required this.isEdit,
  });

  final TeamComponentsRecord? componentDoc;
  final DocumentReference? leadDocRef;
  final bool? isEdit;

  @override
  State<MultichoiceBottomSheetWidget> createState() =>
      _MultichoiceBottomSheetWidgetState();
}

class _MultichoiceBottomSheetWidgetState
    extends State<MultichoiceBottomSheetWidget> {
  late MultichoiceBottomSheetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MultichoiceBottomSheetModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget.isEdit!) {
        _model.data = await queryComponentContentRecordOnce(
          queryBuilder: (componentContentRecord) => componentContentRecord
              .where(
                'lead_ref',
                isEqualTo: widget.leadDocRef,
              )
              .where(
                'type',
                isEqualTo: ComponentType.MultipleChoice.serialize(),
              )
              .where(
                'component_name',
                isEqualTo: widget.componentDoc?.name,
              ),
          singleRecord: true,
        ).then((s) => s.firstOrNull);
        setState(() {
          _model.selectedValue =
              _model.data!.listContent.toList().cast<String>();
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
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 20.0),
              child: Builder(
                builder: (context) {
                  final listValue =
                      widget.componentDoc?.listValue.toList() ?? [];
                  return Wrap(
                    spacing: 10.0,
                    runSpacing: 10.0,
                    alignment: WrapAlignment.start,
                    crossAxisAlignment: WrapCrossAlignment.start,
                    direction: Axis.horizontal,
                    runAlignment: WrapAlignment.start,
                    verticalDirection: VerticalDirection.down,
                    clipBehavior: Clip.none,
                    children: List.generate(listValue.length, (listValueIndex) {
                      final listValueItem = listValue[listValueIndex];
                      return Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if (_model.selectedValue
                                  .contains(listValueItem)) {
                                setState(() {
                                  _model.removeFromSelectedValue(listValueItem);
                                });
                              } else {
                                setState(() {
                                  _model.addToSelectedValue(listValueItem);
                                });
                              }
                            },
                            child: Material(
                              color: Colors.transparent,
                              elevation: 2.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: Container(
                                height: 40.0,
                                decoration: BoxDecoration(
                                  color: _model.selectedValue
                                          .contains(listValueItem)
                                      ? FlutterFlowTheme.of(context).secondary
                                      : FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                child: Align(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 10.0, 0.0),
                                    child: Text(
                                      listValueItem,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    }),
                  );
                },
              ),
            ),
            FFButtonWidget(
              onPressed: () async {
                if (widget.isEdit!) {
                  await _model.data!.reference.update({
                    ...mapToFirestore(
                      {
                        'list_content': _model.selectedValue,
                      },
                    ),
                  });
                  Navigator.pop(context);
                } else {
                  await ComponentContentRecord.collection.doc().set({
                    ...createComponentContentRecordData(
                      leadRef: widget.leadDocRef,
                      type: ComponentType.MultipleChoice,
                      componentName: widget.componentDoc?.name,
                    ),
                    ...mapToFirestore(
                      {
                        'created_at': FieldValue.serverTimestamp(),
                        'list_content': _model.selectedValue,
                        'list_options': widget.componentDoc?.listValue,
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
