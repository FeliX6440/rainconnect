import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'empty_component_list_model.dart';
export 'empty_component_list_model.dart';

class EmptyComponentListWidget extends StatefulWidget {
  const EmptyComponentListWidget({
    super.key,
    required this.teamDoc,
  });

  final TeamsRecord? teamDoc;

  @override
  State<EmptyComponentListWidget> createState() =>
      _EmptyComponentListWidgetState();
}

class _EmptyComponentListWidgetState extends State<EmptyComponentListWidget> {
  late EmptyComponentListModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyComponentListModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
          child: Text(
            'You did not select any \ncomponents',
            textAlign: TextAlign.center,
            style: FlutterFlowTheme.of(context).titleLarge,
          ),
        ),
        FFButtonWidget(
          onPressed: () async {
            context.pushNamed(
              'Templates',
              queryParameters: {
                'teamDoc': serializeParam(
                  widget.teamDoc,
                  ParamType.Document,
                ),
              }.withoutNulls,
              extra: <String, dynamic>{
                'teamDoc': widget.teamDoc,
              },
            );
          },
          text: 'Select Component',
          options: FFButtonOptions(
            height: 50.0,
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
            borderRadius: BorderRadius.circular(50.0),
          ),
        ),
      ],
    );
  }
}
