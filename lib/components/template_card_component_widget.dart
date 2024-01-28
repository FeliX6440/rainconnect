import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'template_card_component_model.dart';
export 'template_card_component_model.dart';

class TemplateCardComponentWidget extends StatefulWidget {
  const TemplateCardComponentWidget({
    super.key,
    required this.templateDoc,
  });

  final TemplatesRecord? templateDoc;

  @override
  State<TemplateCardComponentWidget> createState() =>
      _TemplateCardComponentWidgetState();
}

class _TemplateCardComponentWidgetState
    extends State<TemplateCardComponentWidget> {
  late TemplateCardComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TemplateCardComponentModel());

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

    return MouseRegion(
      opaque: false,
      cursor: MouseCursor.defer ?? MouseCursor.defer,
      onEnter: ((event) async {
        setState(() => _model.iuserHovered = true);
      }),
      onExit: ((event) async {
        setState(() => _model.iuserHovered = false);
      }),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        curve: Curves.easeInOut,
        width: double.infinity,
        decoration: BoxDecoration(
          color: _model.iuserHovered? const Color(0xFFF1F4F8) : Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 12.0, 8.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.templateDoc!.name,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Plus Jakarta Sans',
                              color: const Color(0xFF14181B),
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                        child: Text(
                          widget.templateDoc!.description,
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
              StreamBuilder<UsersRecord>(
                stream: UsersRecord.getDocument(currentUserReference!),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(
                      child: SizedBox(
                        width: 50.0,
                        height: 50.0,
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                            FlutterFlowTheme.of(context).primary,
                          ),
                        ),
                      ),
                    );
                  }
                  final toggleIconUsersRecord = snapshot.data!;
                  return ToggleIcon(
                    onPressed: () async {
                      final templateRefsElement = widget.templateDoc?.reference;
                      final templateRefsUpdate = toggleIconUsersRecord
                              .templateRefs
                              .contains(templateRefsElement)
                          ? FieldValue.arrayRemove([templateRefsElement])
                          : FieldValue.arrayUnion([templateRefsElement]);
                      await toggleIconUsersRecord.reference.update({
                        ...mapToFirestore(
                          {
                            'template_refs': templateRefsUpdate,
                          },
                        ),
                      });
                      if (FFAppState()
                          .selectedStarterTemplate
                          .contains(widget.templateDoc?.reference)) {
                        setState(() {
                          FFAppState().removeFromSelectedStarterTemplate(
                              widget.templateDoc!.reference);
                        });
                      }
                    },
                    value: toggleIconUsersRecord.templateRefs
                        .contains(widget.templateDoc?.reference),
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
      ),
    );
  }
}
