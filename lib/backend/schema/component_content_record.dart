import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ComponentContentRecord extends FirestoreRecord {
  ComponentContentRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "lead_ref" field.
  DocumentReference? _leadRef;
  DocumentReference? get leadRef => _leadRef;
  bool hasLeadRef() => _leadRef != null;

  // "type" field.
  ComponentType? _type;
  ComponentType? get type => _type;
  bool hasType() => _type != null;

  // "content" field.
  String? _content;
  String get content => _content ?? '';
  bool hasContent() => _content != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "list_options" field.
  List<String>? _listOptions;
  List<String> get listOptions => _listOptions ?? const [];
  bool hasListOptions() => _listOptions != null;

  // "list_content" field.
  List<String>? _listContent;
  List<String> get listContent => _listContent ?? const [];
  bool hasListContent() => _listContent != null;

  // "component_name" field.
  String? _componentName;
  String get componentName => _componentName ?? '';
  bool hasComponentName() => _componentName != null;

  void _initializeFields() {
    _leadRef = snapshotData['lead_ref'] as DocumentReference?;
    _type = deserializeEnum<ComponentType>(snapshotData['type']);
    _content = snapshotData['content'] as String?;
    _createdAt = snapshotData['created_at'] as DateTime?;
    _listOptions = getDataList(snapshotData['list_options']);
    _listContent = getDataList(snapshotData['list_content']);
    _componentName = snapshotData['component_name'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('component_content');

  static Stream<ComponentContentRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ComponentContentRecord.fromSnapshot(s));

  static Future<ComponentContentRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => ComponentContentRecord.fromSnapshot(s));

  static ComponentContentRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ComponentContentRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ComponentContentRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ComponentContentRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ComponentContentRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ComponentContentRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createComponentContentRecordData({
  DocumentReference? leadRef,
  ComponentType? type,
  String? content,
  DateTime? createdAt,
  String? componentName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'lead_ref': leadRef,
      'type': type,
      'content': content,
      'created_at': createdAt,
      'component_name': componentName,
    }.withoutNulls,
  );

  return firestoreData;
}

class ComponentContentRecordDocumentEquality
    implements Equality<ComponentContentRecord> {
  const ComponentContentRecordDocumentEquality();

  @override
  bool equals(ComponentContentRecord? e1, ComponentContentRecord? e2) {
    const listEquality = ListEquality();
    return e1?.leadRef == e2?.leadRef &&
        e1?.type == e2?.type &&
        e1?.content == e2?.content &&
        e1?.createdAt == e2?.createdAt &&
        listEquality.equals(e1?.listOptions, e2?.listOptions) &&
        listEquality.equals(e1?.listContent, e2?.listContent) &&
        e1?.componentName == e2?.componentName;
  }

  @override
  int hash(ComponentContentRecord? e) => const ListEquality().hash([
        e?.leadRef,
        e?.type,
        e?.content,
        e?.createdAt,
        e?.listOptions,
        e?.listContent,
        e?.componentName
      ]);

  @override
  bool isValidKey(Object? o) => o is ComponentContentRecord;
}
