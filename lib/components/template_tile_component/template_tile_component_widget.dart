import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'template_tile_component_model.dart';
export 'template_tile_component_model.dart';

class TemplateTileComponentWidget extends StatefulWidget {
  const TemplateTileComponentWidget({
    super.key,
    required this.template,
  });

  final DocumentReference? template;

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
    context.watch<FFAppState>();

    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      curve: Curves.easeInOut,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 12.0, 8.0),
        child: StreamBuilder<TemplatesRecord>(
          stream: TemplatesRecord.getDocument(widget.template!),
          builder: (context, snapshot) {
            // Customize what your widget looks like when it's loading.
            if (!snapshot.hasData) {
              return const Center(
                child: SizedBox(
                  width: 40.0,
                  height: 40.0,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Color(0x009489F5),
                    ),
                  ),
                ),
              );
            }
            final rowTemplatesRecord = snapshot.data!;
            return Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
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
                    padding: const EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          rowTemplatesRecord.name,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Plus Jakarta Sans',
                                    color: const Color(0xFF14181B),
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 4.0, 0.0, 0.0),
                          child: Text(
                            rowTemplatesRecord.description,
                            style:
                                FlutterFlowTheme.of(context).bodySmall.override(
                                      fontFamily: 'Plus Jakarta Sans',
                                      color: const Color(0xFF4B39EF),
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    context.pushNamed('editTemplate');
                  },
                  child: const Icon(
                    Icons.edit_outlined,
                    color: Color(0xFF4B39EF),
                    size: 24.0,
                  ),
                ),
                ToggleIcon(
                  onPressed: () async {
                    setState(
                      () => FFAppState()
                              .selectedStarterTemplate
                              .contains(rowTemplatesRecord.reference)
                          ? FFAppState().removeFromSelectedStarterTemplate(
                              rowTemplatesRecord.reference)
                          : FFAppState().addToSelectedStarterTemplate(
                              rowTemplatesRecord.reference),
                    );
                  },
                  value: FFAppState()
                      .selectedStarterTemplate
                      .contains(rowTemplatesRecord.reference),
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
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
