import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'email_template_editor_model.dart';
export 'email_template_editor_model.dart';

class EmailTemplateEditorWidget extends StatefulWidget {
  const EmailTemplateEditorWidget({
    super.key,
    required this.teamDocRef,
    this.emailTemp,
  });

  final DocumentReference? teamDocRef;
  final EmailTemplatesRecord? emailTemp;

  @override
  State<EmailTemplateEditorWidget> createState() =>
      _EmailTemplateEditorWidgetState();
}

class _EmailTemplateEditorWidgetState extends State<EmailTemplateEditorWidget> {
  late EmailTemplateEditorModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmailTemplateEditorModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 30.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Text(
            'Editor',
            style: FlutterFlowTheme.of(context).titleLarge,
          ),
          actions: const [],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 350.0,
                  child: custom_widgets.CustomEmailTemplateWidget(
                    width: double.infinity,
                    height: 350.0,
                    valuePlaceHolder: _model.templateValues,
                    initialEmailTemplate: widget.emailTemp,
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 12.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      if (widget.emailTemp != null) {
                        await widget.emailTemp!.reference
                            .update(createEmailTemplatesRecordData(
                          subject: FFAppState().emailSubjectHolder,
                          body: FFAppState().emailBodyHolder,
                        ));
                        context.safePop();
                      } else {
                        await EmailTemplatesRecord.createDoc(widget.teamDocRef!)
                            .set({
                          ...createEmailTemplatesRecordData(
                            subject: FFAppState().emailSubjectHolder,
                            body: FFAppState().emailBodyHolder,
                          ),
                          ...mapToFirestore(
                            {
                              'created_at': FieldValue.serverTimestamp(),
                            },
                          ),
                        });
                        context.safePop();
                      }
                    },
                    text: 'Save Template',
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: 48.0,
                      padding: const EdgeInsets.all(0.0),
                      iconPadding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Manrope',
                                color: Colors.white,
                              ),
                      elevation: 4.0,
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(60.0),
                    ),
                  ),
                ),
                if (widget.emailTemp != null)
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 12.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        if (widget.emailTemp != null) {
                          var confirmDialogResponse = await showDialog<bool>(
                                context: context,
                                builder: (alertDialogContext) {
                                  return AlertDialog(
                                    title: const Text('Delete Template'),
                                    content: const Text(
                                        'Are you sure you want to delete the template'),
                                    actions: [
                                      TextButton(
                                        onPressed: () => Navigator.pop(
                                            alertDialogContext, false),
                                        child: const Text('Cancel'),
                                      ),
                                      TextButton(
                                        onPressed: () => Navigator.pop(
                                            alertDialogContext, true),
                                        child: const Text('Confirm'),
                                      ),
                                    ],
                                  );
                                },
                              ) ??
                              false;
                          if (confirmDialogResponse) {
                            await widget.emailTemp!.reference.delete();
                            context.safePop();
                          }
                        }
                      },
                      text: 'Delete Template',
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 48.0,
                        padding: const EdgeInsets.all(0.0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).error,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Manrope',
                                  color: Colors.white,
                                ),
                        elevation: 4.0,
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(60.0),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
