import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ArchiveComponentRecord extends FirestoreRecord {
  ArchiveComponentRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "component_name" field.
  String? _componentName;
  String get componentName => _componentName ?? '';
  bool hasComponentName() => _componentName != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _componentName = snapshotData['component_name'] as String?;
    _createdAt = snapshotData['created_at'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('archive_component')
          : FirebaseFirestore.instance.collectionGroup('archive_component');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('archive_component').doc(id);

  static Stream<ArchiveComponentRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ArchiveComponentRecord.fromSnapshot(s));

  static Future<ArchiveComponentRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => ArchiveComponentRecord.fromSnapshot(s));

  static ArchiveComponentRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ArchiveComponentRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ArchiveComponentRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ArchiveComponentRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ArchiveComponentRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ArchiveComponentRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createArchiveComponentRecordData({
  String? componentName,
  DateTime? createdAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'component_name': componentName,
      'created_at': createdAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class ArchiveComponentRecordDocumentEquality
    implements Equality<ArchiveComponentRecord> {
  const ArchiveComponentRecordDocumentEquality();

  @override
  bool equals(ArchiveComponentRecord? e1, ArchiveComponentRecord? e2) {
    return e1?.componentName == e2?.componentName &&
        e1?.createdAt == e2?.createdAt;
  }

  @override
  int hash(ArchiveComponentRecord? e) =>
      const ListEquality().hash([e?.componentName, e?.createdAt]);

  @override
  bool isValidKey(Object? o) => o is ArchiveComponentRecord;
}
