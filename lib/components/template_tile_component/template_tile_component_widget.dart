import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/components/edit_industrial_fair_bottom_sheet_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'template_tile_component_model.dart';
export 'template_tile_component_model.dart';

class TemplateTileComponentWidget extends StatefulWidget {
  const TemplateTileComponentWidget({
    super.key,
    required this.component,
    required this.teamDocRef,
  });

  final TeamComponentsRecord? component;
  final DocumentReference? teamDocRef;

  @override
  State<TemplateTileComponentWidget> createState() =>
      _TemplateTileComponentWidgetState();
}

class _TemplateTileComponentWidgetState
    extends State<TemplateTileComponentWidget> {
  late TemplateTileComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TemplateTileComponentModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      curve: Curves.easeInOut,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 12.0, 8.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(40.0),
                child: Image.network(
                  'https://images.unsplash.com/photo-1629196206335-744346ba1331?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwxMHx8dmlvbGV0JTIwd2FsbHBhcGVyfGVufDB8fHx8MTcwNTY4OTA2NHww&ixlib=rb-4.0.3&q=80&w=1080',
                  width: 32.0,
                  height: 32.0,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.component!.name,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Plus Jakarta Sans',
                            color: Color(0xFF14181B),
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                      child: Text(
                        widget.component!.description,
                        style: FlutterFlowTheme.of(context).bodySmall.override(
                              fontFamily: 'Plus Jakarta Sans',
                              color: Color(0xFF4B39EF),
                              fontSize: 12.0,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (widget.component?.isCustom == true)
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  if (widget.component?.type == ComponentType.industrialFair) {
                    await showModalBottomSheet(
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      enableDrag: false,
                      context: context,
                      builder: (context) {
                        return Padding(
                          padding: MediaQuery.viewInsetsOf(context),
                          child: Container(
                            height: MediaQuery.sizeOf(context).height * 0.45,
                            child: EditIndustrialFairBottomSheetWidget(
                              teamDocRef: widget.teamDocRef!,
                            ),
                          ),
                        );
                      },
                    ).then((value) => safeSetState(() {}));
                  } else {
                    context.pushNamed(
                      'NewOrEditComponent',
                      queryParameters: {
                        'component': serializeParam(
                          widget.component,
                          ParamType.Document,
                        ),
                        'teamDocRef': serializeParam(
                          widget.teamDocRef,
                          ParamType.DocumentReference,
                        ),
                      }.withoutNulls,
                      extra: <String, dynamic>{
                        'component': widget.component,
                      },
                    );
                  }
                },
                child: Icon(
                  Icons.edit_outlined,
                  color: Color(0xFF4B39EF),
                  size: 24.0,
                ),
              ),
            if ((widget.component?.isCustom == true) &&
                (widget.component?.type != ComponentType.industrialFair))
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  var confirmDialogResponse = await showDialog<bool>(
                        context: context,
                        builder: (alertDialogContext) {
                          return AlertDialog(
                            title: Text('Delete component'),
                            content: Text(
                                'Are you sure you want to delete the component?'),
                            actions: [
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(alertDialogContext, false),
                                child: Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(alertDialogContext, true),
                                child: Text('Confirm'),
                              ),
                            ],
                          );
                        },
                      ) ??
                      false;
                  if (confirmDialogResponse) {
                    await ArchiveComponentRecord.createDoc(widget.teamDocRef!)
                        .set({
                      ...createArchiveComponentRecordData(
                        componentName: widget.component?.name,
                      ),
                      ...mapToFirestore(
                        {
                          'created_at': FieldValue.serverTimestamp(),
                        },
                      ),
                    });
                    await widget.component!.reference.delete();
                  }
                },
                child: Icon(
                  Icons.delete_forever,
                  color: FlutterFlowTheme.of(context).error,
                  size: 24.0,
                ),
              ),
            StreamBuilder<TeamComponentsRecord>(
              stream:
                  TeamComponentsRecord.getDocument(widget.component!.reference),
              builder: (context, snapshot) {
                // Customize what your widget looks like when it's loading.
                if (!snapshot.hasData) {
                  return Center(
                    child: SizedBox(
                      width: 40.0,
                      height: 40.0,
                      child: SpinKitPulse(
                        color: Color(0x009489F5),
                        size: 40.0,
                      ),
                    ),
                  );
                }
                final toggleIconTeamComponentsRecord = snapshot.data!;
                return ToggleIcon(
                  onPressed: () async {
                    await toggleIconTeamComponentsRecord.reference.update({
                      ...mapToFirestore(
                        {
                          'is_starter':
                              !toggleIconTeamComponentsRecord.isStarter,
                        },
                      ),
                    });
                  },
                  value: toggleIconTeamComponentsRecord.isStarter,
                  onIcon: Icon(
                    Icons.check_circle_outline_rounded,
                    color: FlutterFlowTheme.of(context).primary,
                    size: 25.0,
                  ),
                  offIcon: Icon(
                    Icons.radio_button_off,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    size: 25.0,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
