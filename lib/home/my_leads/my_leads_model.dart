import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'my_leads_widget.dart' show MyLeadsWidget;
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class MyLeadsModel extends FlutterFlowModel<MyLeadsWidget> {
  ///  Local state fields for this page.

  int leadCount = 0;

  List<String> selectedLeads = [];
  void addToSelectedLeads(String item) => selectedLeads.add(item);
  void removeFromSelectedLeads(String item) => selectedLeads.remove(item);
  void removeAtIndexFromSelectedLeads(int index) =>
      selectedLeads.removeAt(index);
  void insertAtIndexInSelectedLeads(int index, String item) =>
      selectedLeads.insert(index, item);
  void updateSelectedLeadsAtIndex(int index, Function(String) updateFn) =>
      selectedLeads[index] = updateFn(selectedLeads[index]);

  bool isDeletedEnable = false;

  bool isDeleteLoading = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  List<LeadsRecord> simpleSearchResults = [];
  // State field(s) for ListView widget.

  PagingController<DocumentSnapshot?, LeadsRecord>? listViewPagingController2;
  Query? listViewPagingQuery2;

  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<ArchiveComponentRecord>? archieveComponents;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<TeamComponentsRecord>? components;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<LeadsRecord>? selectedLeadList;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<LeadsRecord>? teamLeads;
  Completer<int>? firestoreRequestCompleter;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    listViewPagingController2?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  PagingController<DocumentSnapshot?, LeadsRecord> setListViewController2(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    listViewPagingController2 ??= _createListViewController2(query, parent);
    if (listViewPagingQuery2 != query) {
      listViewPagingQuery2 = query;
      listViewPagingController2?.refresh();
    }
    return listViewPagingController2!;
  }

  PagingController<DocumentSnapshot?, LeadsRecord> _createListViewController2(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, LeadsRecord>(firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryLeadsRecordPage(
          queryBuilder: (_) => listViewPagingQuery2 ??= query,
          nextPageMarker: nextPageMarker,
          controller: controller,
          pageSize: 25,
          isStream: false,
        ),
      );
  }

  Future waitForFirestoreRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(const Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = firestoreRequestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
