import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'empty_maerket_place_model.dart';
export 'empty_maerket_place_model.dart';

class EmptyMaerketPlaceWidget extends StatefulWidget {
  const EmptyMaerketPlaceWidget({super.key});

  @override
  State<EmptyMaerketPlaceWidget> createState() =>
      _EmptyMaerketPlaceWidgetState();
}

class _EmptyMaerketPlaceWidgetState extends State<EmptyMaerketPlaceWidget> {
  late EmptyMaerketPlaceModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyMaerketPlaceModel());

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

    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Coming Soon',
          textAlign: TextAlign.center,
          style: FlutterFlowTheme.of(context).headlineMedium,
        ),
      ],
    );
  }
}
