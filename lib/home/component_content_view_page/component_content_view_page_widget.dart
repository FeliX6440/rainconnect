import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/bottomsheet/edit_temperature_content/edit_temperature_content_widget.dart';
import '/components/notes_details_and_edit/notes_details_and_edit_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'component_content_view_page_model.dart';
export 'component_content_view_page_model.dart';

class ComponentContentViewPageWidget extends StatefulWidget {
  const ComponentContentViewPageWidget({
    super.key,
    required this.leadRef,
    required this.title,
    required this.type,
  });

  final DocumentReference? leadRef;
  final String? title;
  final ComponentType? type;

  @override
  State<ComponentContentViewPageWidget> createState() =>
      _ComponentContentViewPageWidgetState();
}

class _ComponentContentViewPageWidgetState
    extends State<ComponentContentViewPageWidget> {
  late ComponentContentViewPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ComponentContentViewPageModel());

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
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
              size: 30.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Text(
            widget.title!,
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Urbanist',
                  color: Colors.white,
                  fontSize: 22.0,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(15.0, 10.0, 15.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                PagedListView<DocumentSnapshot<Object?>?,
                    ComponentContentRecord>(
                  pagingController: _model.setListViewController(
                    ComponentContentRecord.collection
                        .where(
                          'lead_ref',
                          isEqualTo: widget.leadRef,
                        )
                        .where(
                          'type',
                          isEqualTo: widget.type?.serialize(),
                        )
                        .orderBy('created_at', descending: true),
                  ),
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  reverse: false,
                  scrollDirection: Axis.vertical,
                  builderDelegate:
                      PagedChildBuilderDelegate<ComponentContentRecord>(
                    // Customize what your widget looks like when it's loading the first page.
                    firstPageProgressIndicatorBuilder: (_) => Center(
                      child: SizedBox(
                        width: 30.0,
                        height: 30.0,
                        child: SpinKitFadingFour(
                          color: FlutterFlowTheme.of(context).primary,
                          size: 30.0,
                        ),
                      ),
                    ),
                    // Customize what your widget looks like when it's loading another page.
                    newPageProgressIndicatorBuilder: (_) => Center(
                      child: SizedBox(
                        width: 30.0,
                        height: 30.0,
                        child: SpinKitFadingFour(
                          color: FlutterFlowTheme.of(context).primary,
                          size: 30.0,
                        ),
                      ),
                    ),

                    itemBuilder: (context, _, listViewIndex) {
                      final listViewComponentContentRecord = _model
                          .listViewPagingController!.itemList![listViewIndex];
                      return InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          if (widget.type == ComponentType.Temperature) {
                            await showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              enableDrag: false,
                              context: context,
                              builder: (context) {
                                return GestureDetector(
                                  onTap: () =>
                                      _model.unfocusNode.canRequestFocus
                                          ? FocusScope.of(context)
                                              .requestFocus(_model.unfocusNode)
                                          : FocusScope.of(context).unfocus(),
                                  child: Padding(
                                    padding: MediaQuery.viewInsetsOf(context),
                                    child: EditTemperatureContentWidget(
                                      componentContentDoc:
                                          listViewComponentContentRecord,
                                    ),
                                  ),
                                );
                              },
                            ).then((value) => safeSetState(() {}));
                          } else {
                            await showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              enableDrag: false,
                              context: context,
                              builder: (context) {
                                return GestureDetector(
                                  onTap: () =>
                                      _model.unfocusNode.canRequestFocus
                                          ? FocusScope.of(context)
                                              .requestFocus(_model.unfocusNode)
                                          : FocusScope.of(context).unfocus(),
                                  child: Padding(
                                    padding: MediaQuery.viewInsetsOf(context),
                                    child: Container(
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.5,
                                      child: NotesDetailsAndEditWidget(
                                        headText: 'Quick note',
                                        noteDoc: listViewComponentContentRecord,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ).then((value) => safeSetState(() {}));
                          }
                        },
                        child: ListTile(
                          title: Text(
                            'Title',
                            style: FlutterFlowTheme.of(context).titleLarge,
                          ),
                          subtitle: Text(
                            listViewComponentContentRecord.content
                                .maybeHandleOverflow(
                              maxChars: 40,
                              replacement: '…',
                            ),
                            style: FlutterFlowTheme.of(context).labelMedium,
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 20.0,
                          ),
                          tileColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          dense: false,
                        ),
                      );
                    },
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
