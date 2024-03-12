import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'new_or_edit_component_model.dart';
export 'new_or_edit_component_model.dart';

class NewOrEditComponentWidget extends StatefulWidget {
  const NewOrEditComponentWidget({
    super.key,
    this.component,
    required this.teamDocRef,
  });

  final TeamComponentsRecord? component;
  final DocumentReference? teamDocRef;

  @override
  State<NewOrEditComponentWidget> createState() =>
      _NewOrEditComponentWidgetState();
}

class _NewOrEditComponentWidgetState extends State<NewOrEditComponentWidget> {
  late NewOrEditComponentModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NewOrEditComponentModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget.component != null) {
        setState(() {
          _model.selectedComponent = widget.component?.type?.name;
        });
        if (widget.component?.type == ComponentType.Dropdown) {
          setState(() {
            _model.addedOptionsForDropDown =
                widget.component!.listValue.toList().cast<String>();
          });
        } else if (widget.component?.type == ComponentType.MultipleChoice) {
          setState(() {
            _model.addedOptionForMultiChoice =
                widget.component!.listValue.toList().cast<String>();
          });
        }
      }
    });

    _model.textController1 ??= TextEditingController(
        text: widget.component != null ? widget.component?.name : '');
    _model.textFieldFocusNode ??= FocusNode();

    _model.optionsController ??= TextEditingController();
    _model.optionsFocusNode ??= FocusNode();

    _model.textFieldValueController ??= TextEditingController();
    _model.textFieldValueFocusNode ??= FocusNode();

    _model.choiceOptionController ??= TextEditingController();
    _model.choiceOptionFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
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
              context.safePop();
            },
          ),
          title: Text(
            widget.component != null ? 'Edit Component' : 'Create Component',
            style: FlutterFlowTheme.of(context).headlineSmall,
          ),
          actions: const [],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(15.0, 10.0, 15.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                  child: TextFormField(
                    controller: _model.textController1,
                    focusNode: _model.textFieldFocusNode,
                    autofocus: true,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelStyle: FlutterFlowTheme.of(context).labelMedium,
                      hintText: 'Set Component Name...',
                      hintStyle: FlutterFlowTheme.of(context).labelLarge,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).alternate,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).primary,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium,
                    validator:
                        _model.textController1Validator.asValidator(context),
                  ),
                ),
                if (widget.component == null)
                  FlutterFlowDropDown<String>(
                    controller: _model.componentTypeValueController ??=
                        FormFieldController<String>(
                      _model.componentTypeValue ??=
                          _model.selectedComponent != null &&
                                  _model.selectedComponent != ''
                              ? widget.component?.type?.name
                              : '',
                    ),
                    options: const ['TextField', 'MultipleChoice', 'Dropdown'],
                    onChanged: (val) async {
                      setState(() => _model.componentTypeValue = val);
                      setState(() {
                        _model.selectedComponent = _model.componentTypeValue;
                      });
                    },
                    width: double.infinity,
                    height: 50.0,
                    textStyle: FlutterFlowTheme.of(context).bodyMedium,
                    hintText: 'Chose Component Type...',
                    icon: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 24.0,
                    ),
                    elevation: 2.0,
                    borderColor: FlutterFlowTheme.of(context).alternate,
                    borderWidth: 2.0,
                    borderRadius: 8.0,
                    margin:
                        const EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
                    hidesUnderline: true,
                    isOverButton: true,
                    isSearchable: false,
                    isMultiSelect: false,
                  ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                  child: Builder(
                    builder: (context) {
                      if (_model.selectedComponent == 'Dropdown') {
                        return Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Builder(
                              builder: (context) {
                                final dropdown =
                                    _model.addedOptionsForDropDown.toList();
                                return SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: List.generate(dropdown.length,
                                        (dropdownIndex) {
                                      final dropdownItem =
                                          dropdown[dropdownIndex];
                                      return Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 10.0, 0.0),
                                        child: Container(
                                          height: 35.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 0.0, 10.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  dropdownItem,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium,
                                                ),
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          10.0, 0.0, 0.0, 0.0),
                                                  child: InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      setState(() {
                                                        _model
                                                            .removeFromAddedOptionsForDropDown(
                                                                dropdownItem);
                                                      });
                                                    },
                                                    child: Icon(
                                                      Icons.clear_outlined,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      size: 24.0,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    }),
                                  ),
                                );
                              },
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 0.0),
                              child: TextFormField(
                                controller: _model.optionsController,
                                focusNode: _model.optionsFocusNode,
                                autofocus: true,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelStyle:
                                      FlutterFlowTheme.of(context).labelLarge,
                                  hintText: 'Option Value...',
                                  hintStyle:
                                      FlutterFlowTheme.of(context).labelLarge,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                                style: FlutterFlowTheme.of(context).bodyMedium,
                                validator: _model.optionsControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 20.0, 0.0, 0.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  setState(() {
                                    _model.addToAddedOptionsForDropDown(
                                        _model.optionsController.text);
                                  });
                                  setState(() {
                                    _model.optionsController?.clear();
                                  });
                                },
                                text: 'Add New Option',
                                options: FFButtonOptions(
                                  width: double.infinity,
                                  height: 40.0,
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 24.0, 0.0),
                                  iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).primary,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
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
                        );
                      } else if (_model.selectedComponent == 'TextField') {
                        return TextFormField(
                          controller: _model.textFieldValueController,
                          focusNode: _model.textFieldValueFocusNode,
                          autofocus: true,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelStyle:
                                FlutterFlowTheme.of(context).labelMedium,
                            hintText: 'Label here...',
                            hintStyle: FlutterFlowTheme.of(context).labelLarge,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).alternate,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).primary,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          style: FlutterFlowTheme.of(context).bodyMedium,
                          validator: _model.textFieldValueControllerValidator
                              .asValidator(context),
                        );
                      } else {
                        return Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Builder(
                              builder: (context) {
                                final multichoice =
                                    _model.addedOptionForMultiChoice.toList();
                                return SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: List.generate(multichoice.length,
                                        (multichoiceIndex) {
                                      final multichoiceItem =
                                          multichoice[multichoiceIndex];
                                      return Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 10.0, 0.0),
                                        child: Container(
                                          height: 35.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 0.0, 10.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  multichoiceItem,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium,
                                                ),
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          10.0, 0.0, 0.0, 0.0),
                                                  child: InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      setState(() {
                                                        _model
                                                            .removeFromAddedOptionForMultiChoice(
                                                                multichoiceItem);
                                                      });
                                                    },
                                                    child: Icon(
                                                      Icons.clear_outlined,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      size: 24.0,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    }),
                                  ),
                                );
                              },
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 0.0),
                              child: TextFormField(
                                controller: _model.choiceOptionController,
                                focusNode: _model.choiceOptionFocusNode,
                                autofocus: true,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'Label here...',
                                  labelStyle:
                                      FlutterFlowTheme.of(context).labelMedium,
                                  hintText: 'Option value here',
                                  hintStyle:
                                      FlutterFlowTheme.of(context).labelLarge,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                                style: FlutterFlowTheme.of(context).bodyMedium,
                                validator: _model
                                    .choiceOptionControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 0.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  setState(() {
                                    _model.addToAddedOptionForMultiChoice(
                                        _model.choiceOptionController.text);
                                  });
                                  setState(() {
                                    _model.choiceOptionController?.clear();
                                  });
                                },
                                text: 'add option',
                                options: FFButtonOptions(
                                  width: double.infinity,
                                  height: 40.0,
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 24.0, 0.0),
                                  iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).primary,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
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
                        );
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      if (_model.textController1.text != '') {
                        if (widget.component == null) {
                          if (_model.componentTypeValue == 'Dropdown') {
                            var teamComponentsRecordReference1 =
                                TeamComponentsRecord.createDoc(
                                    widget.teamDocRef!);
                            await teamComponentsRecordReference1.set({
                              ...createTeamComponentsRecordData(
                                name: _model.textController1.text,
                                isStarter: true,
                                description: '',
                                type: ComponentType.Dropdown,
                                isCustom: true,
                              ),
                              ...mapToFirestore(
                                {
                                  'list_value': _model.addedOptionsForDropDown,
                                  'added_at': FieldValue.serverTimestamp(),
                                },
                              ),
                            });
                            _model.result1 =
                                TeamComponentsRecord.getDocumentFromData({
                              ...createTeamComponentsRecordData(
                                name: _model.textController1.text,
                                isStarter: true,
                                description: '',
                                type: ComponentType.Dropdown,
                                isCustom: true,
                              ),
                              ...mapToFirestore(
                                {
                                  'list_value': _model.addedOptionsForDropDown,
                                  'added_at': DateTime.now(),
                                },
                              ),
                            }, teamComponentsRecordReference1);
                          } else if (_model.componentTypeValue == 'TextField') {
                            var teamComponentsRecordReference2 =
                                TeamComponentsRecord.createDoc(
                                    widget.teamDocRef!);
                            await teamComponentsRecordReference2.set({
                              ...createTeamComponentsRecordData(
                                name: _model.textController1.text,
                                isStarter: true,
                                description: '',
                                type: ComponentType.TextField,
                                isCustom: true,
                              ),
                              ...mapToFirestore(
                                {
                                  'added_at': FieldValue.serverTimestamp(),
                                },
                              ),
                            });
                            _model.result2 =
                                TeamComponentsRecord.getDocumentFromData({
                              ...createTeamComponentsRecordData(
                                name: _model.textController1.text,
                                isStarter: true,
                                description: '',
                                type: ComponentType.TextField,
                                isCustom: true,
                              ),
                              ...mapToFirestore(
                                {
                                  'added_at': DateTime.now(),
                                },
                              ),
                            }, teamComponentsRecordReference2);
                          } else {
                            var teamComponentsRecordReference3 =
                                TeamComponentsRecord.createDoc(
                                    widget.teamDocRef!);
                            await teamComponentsRecordReference3.set({
                              ...createTeamComponentsRecordData(
                                name: _model.textController1.text,
                                isStarter: true,
                                description: '',
                                type: ComponentType.MultipleChoice,
                                isCustom: true,
                              ),
                              ...mapToFirestore(
                                {
                                  'list_value':
                                      _model.addedOptionForMultiChoice,
                                  'added_at': FieldValue.serverTimestamp(),
                                },
                              ),
                            });
                            _model.result3 =
                                TeamComponentsRecord.getDocumentFromData({
                              ...createTeamComponentsRecordData(
                                name: _model.textController1.text,
                                isStarter: true,
                                description: '',
                                type: ComponentType.MultipleChoice,
                                isCustom: true,
                              ),
                              ...mapToFirestore(
                                {
                                  'list_value':
                                      _model.addedOptionForMultiChoice,
                                  'added_at': DateTime.now(),
                                },
                              ),
                            }, teamComponentsRecordReference3);
                          }
                        } else {
                          if (_model.componentTypeValue == 'Dropdown') {
                            await widget.component!.reference.update({
                              ...createTeamComponentsRecordData(
                                name: _model.textController1.text,
                                type: ComponentType.Dropdown,
                              ),
                              ...mapToFirestore(
                                {
                                  'list_value': _model.addedOptionsForDropDown,
                                },
                              ),
                            });
                          } else if (_model.componentTypeValue == 'TextField') {
                            await widget.component!.reference
                                .update(createTeamComponentsRecordData(
                              name: _model.textController1.text,
                              type: ComponentType.Dropdown,
                            ));
                          } else {
                            await widget.component!.reference.update({
                              ...createTeamComponentsRecordData(
                                name: _model.textController1.text,
                                type: ComponentType.MultipleChoice,
                              ),
                              ...mapToFirestore(
                                {
                                  'list_value':
                                      _model.addedOptionForMultiChoice,
                                },
                              ),
                            });
                          }
                        }

                        context.safePop();
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Component name can not be empty',
                              style: TextStyle(
                                color: FlutterFlowTheme.of(context).primaryText,
                              ),
                            ),
                            duration: const Duration(milliseconds: 4000),
                            backgroundColor:
                                FlutterFlowTheme.of(context).secondary,
                          ),
                        );
                      }

                      setState(() {});
                    },
                    text: 'Save Component',
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: 40.0,
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      iconPadding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primaryText,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
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
                if (widget.component != null)
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        if (widget.component != null) {
                          var confirmDialogResponse = await showDialog<bool>(
                                context: context,
                                builder: (alertDialogContext) {
                                  return AlertDialog(
                                    title: const Text('Delete component'),
                                    content: const Text(
                                        'Are you sure you want to delete the component?'),
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
                            await widget.component!.reference.delete();
                            context.safePop();
                          }
                        }
                      },
                      text: 'DeleteComponent',
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 40.0,
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).error,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
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
        ),
      ),
    );
  }
}
