import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/bottomsheet/dropdown_bottom_sheet/dropdown_bottom_sheet_widget.dart';
import '/bottomsheet/multichoice_bottom_sheet/multichoice_bottom_sheet_widget.dart';
import '/bottomsheet/note_bottom_sheet/note_bottom_sheet_widget.dart';
import '/bottomsheet/speech_to_text_bottom_sheet/speech_to_text_bottom_sheet_widget.dart';
import '/bottomsheet/temperature_bottom_sheet/temperature_bottom_sheet_widget.dart';
import '/bottomsheet/text_field_bottom_sheet/text_field_bottom_sheet_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'tile_component_model.dart';
export 'tile_component_model.dart';

class TileComponentWidget extends StatefulWidget {
  const TileComponentWidget({
    super.key,
    this.component,
    required this.lead,
  });

  final TeamComponentsRecord? component;
  final DocumentReference? lead;

  @override
  State<TileComponentWidget> createState() => _TileComponentWidgetState();
}

class _TileComponentWidgetState extends State<TileComponentWidget> {
  late TileComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TileComponentModel());

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

    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color:
                widget.component?.containLeads.contains(widget.lead) == false
                    ? Colors.transparent
                    : FlutterFlowTheme.of(context).primary,
            width: 2.0,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                if (widget.component?.type == ComponentType.Note) {
                  await showModalBottomSheet(
                    isScrollControlled: true,
                    backgroundColor: const Color(0x00F1F4F8),
                    enableDrag: false,
                    context: context,
                    builder: (context) {
                      return Padding(
                        padding: MediaQuery.viewInsetsOf(context),
                        child: SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.4,
                          child: NoteBottomSheetWidget(
                            leadDocRef: widget.lead!,
                            coomponentDocRef: widget.component?.reference,
                            isEdit: widget.component!.containLeads
                                .contains(widget.lead),
                          ),
                        ),
                      );
                    },
                  ).then((value) => safeSetState(() {}));
                } else if (widget.component?.type == ComponentType.Dropdown) {
                  await showModalBottomSheet(
                    isScrollControlled: true,
                    backgroundColor: const Color(0x00F1F4F8),
                    enableDrag: false,
                    context: context,
                    builder: (context) {
                      return Padding(
                        padding: MediaQuery.viewInsetsOf(context),
                        child: SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.4,
                          child: DropdownBottomSheetWidget(
                            teamComponentDoc: widget.component!,
                            leadDocRef: widget.lead!,
                            isEdit: widget.component!.containLeads
                                .contains(widget.lead),
                          ),
                        ),
                      );
                    },
                  ).then((value) => safeSetState(() {}));
                } else if (widget.component?.type ==
                    ComponentType.MultipleChoice) {
                  await showModalBottomSheet(
                    isScrollControlled: true,
                    backgroundColor: const Color(0x00F1F4F8),
                    enableDrag: false,
                    context: context,
                    builder: (context) {
                      return Padding(
                        padding: MediaQuery.viewInsetsOf(context),
                        child: SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.4,
                          child: MultichoiceBottomSheetWidget(
                            componentDoc: widget.component!,
                            leadDocRef: widget.lead!,
                            isEdit: widget.component!.containLeads
                                .contains(widget.lead),
                          ),
                        ),
                      );
                    },
                  ).then((value) => safeSetState(() {}));
                } else if (widget.component?.type == ComponentType.TextField) {
                  await showModalBottomSheet(
                    isScrollControlled: true,
                    backgroundColor: const Color(0x00F1F4F8),
                    enableDrag: false,
                    context: context,
                    builder: (context) {
                      return Padding(
                        padding: MediaQuery.viewInsetsOf(context),
                        child: SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.4,
                          child: TextFieldBottomSheetWidget(
                            isEdit: widget.component!.containLeads
                                .contains(widget.lead),
                            teamComponentDoc: widget.component!,
                            leadDocRef: widget.lead!,
                          ),
                        ),
                      );
                    },
                  ).then((value) => safeSetState(() {}));
                } else if (widget.component?.type ==
                    ComponentType.Temperature) {
                  await showModalBottomSheet(
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    enableDrag: false,
                    context: context,
                    builder: (context) {
                      return Padding(
                        padding: MediaQuery.viewInsetsOf(context),
                        child: SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.4,
                          child: TemperatureBottomSheetWidget(
                            leadDocRef: widget.lead!,
                            componentDocRef: widget.component?.reference,
                            isEdit: widget.component!.containLeads
                                .contains(widget.lead),
                          ),
                        ),
                      );
                    },
                  ).then((value) => safeSetState(() {}));
                } else {
                  await showModalBottomSheet(
                    isScrollControlled: true,
                    backgroundColor: const Color(0x00F1F4F8),
                    enableDrag: false,
                    context: context,
                    builder: (context) {
                      return Padding(
                        padding: MediaQuery.viewInsetsOf(context),
                        child: SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.6,
                          child: SpeechToTextBottomSheetWidget(
                            leadDocRef: widget.lead!,
                            componentDocRef: widget.component?.reference,
                          ),
                        ),
                      );
                    },
                  ).then((value) => safeSetState(() {}));
                }
              },
              child: Container(
                width: double.infinity,
                height: 60.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.component!.name,
                            style: FlutterFlowTheme.of(context)
                                .titleLarge
                                .override(
                                  fontFamily: 'Manrope',
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                          Text(
                            widget.component!.description.maybeHandleOverflow(
                              maxChars: 35,
                              replacement: '…',
                            ),
                            style: FlutterFlowTheme.of(context).bodyMedium,
                          ),
                        ],
                      ),
                      Builder(
                        builder: (context) {
                          if (widget.component?.containLeads
                                  .contains(widget.lead) ??
                              false) {
                            return Icon(
                              Icons.check_box,
                              color: FlutterFlowTheme.of(context).secondary,
                              size: 24.0,
                            );
                          } else {
                            return Icon(
                              Icons.keyboard_arrow_down_sharp,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 35.0,
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
