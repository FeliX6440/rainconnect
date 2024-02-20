import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TeamsRecord extends FirestoreRecord {
  TeamsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "creator_ref" field.
  DocumentReference? _creatorRef;
  DocumentReference? get creatorRef => _creatorRef;
  bool hasCreatorRef() => _creatorRef != null;

  // "members" field.
  List<DocumentReference>? _members;
  List<DocumentReference> get members => _members ?? const [];
  bool hasMembers() => _members != null;

  // "admins" field.
  List<DocumentReference>? _admins;
  List<DocumentReference> get admins => _admins ?? const [];
  bool hasAdmins() => _admins != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "subscription_plan" field.
  String? _subscriptionPlan;
  String get subscriptionPlan => _subscriptionPlan ?? '';
  bool hasSubscriptionPlan() => _subscriptionPlan != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "requests" field.
  List<DocumentReference>? _requests;
  List<DocumentReference> get requests => _requests ?? const [];
  bool hasRequests() => _requests != null;

  // "component_count" field.
  int? _componentCount;
  int get componentCount => _componentCount ?? 0;
  bool hasComponentCount() => _componentCount != null;

  // "component_limit" field.
  int? _componentLimit;
  int get componentLimit => _componentLimit ?? 0;
  bool hasComponentLimit() => _componentLimit != null;

  // "bought_components" field.
  List<DocumentReference>? _boughtComponents;
  List<DocumentReference> get boughtComponents => _boughtComponents ?? const [];
  bool hasBoughtComponents() => _boughtComponents != null;

  // "template_mode" field.
  bool? _templateMode;
  bool get templateMode => _templateMode ?? false;
  bool hasTemplateMode() => _templateMode != null;

  void _initializeFields() {
    _creatorRef = snapshotData['creator_ref'] as DocumentReference?;
    _members = getDataList(snapshotData['members']);
    _admins = getDataList(snapshotData['admins']);
    _id = snapshotData['id'] as String?;
    _subscriptionPlan = snapshotData['subscription_plan'] as String?;
    _createdAt = snapshotData['created_at'] as DateTime?;
    _requests = getDataList(snapshotData['requests']);
    _componentCount = castToType<int>(snapshotData['component_count']);
    _componentLimit = castToType<int>(snapshotData['component_limit']);
    _boughtComponents = getDataList(snapshotData['bought_components']);
    _templateMode = snapshotData['template_mode'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('teams');

  static Stream<TeamsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TeamsRecord.fromSnapshot(s));

  static Future<TeamsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TeamsRecord.fromSnapshot(s));

  static TeamsRecord fromSnapshot(DocumentSnapshot snapshot) => TeamsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TeamsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TeamsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TeamsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TeamsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTeamsRecordData({
  DocumentReference? creatorRef,
  String? id,
  String? subscriptionPlan,
  DateTime? createdAt,
  int? componentCount,
  int? componentLimit,
  bool? templateMode,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'creator_ref': creatorRef,
      'id': id,
      'subscription_plan': subscriptionPlan,
      'created_at': createdAt,
      'component_count': componentCount,
      'component_limit': componentLimit,
      'template_mode': templateMode,
    }.withoutNulls,
  );

  return firestoreData;
}

class TeamsRecordDocumentEquality implements Equality<TeamsRecord> {
  const TeamsRecordDocumentEquality();

  @override
  bool equals(TeamsRecord? e1, TeamsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.creatorRef == e2?.creatorRef &&
        listEquality.equals(e1?.members, e2?.members) &&
        listEquality.equals(e1?.admins, e2?.admins) &&
        e1?.id == e2?.id &&
        e1?.subscriptionPlan == e2?.subscriptionPlan &&
        e1?.createdAt == e2?.createdAt &&
        listEquality.equals(e1?.requests, e2?.requests) &&
        e1?.componentCount == e2?.componentCount &&
        e1?.componentLimit == e2?.componentLimit &&
        listEquality.equals(e1?.boughtComponents, e2?.boughtComponents) &&
        e1?.templateMode == e2?.templateMode;
  }

  @override
  int hash(TeamsRecord? e) => const ListEquality().hash([
        e?.creatorRef,
        e?.members,
        e?.admins,
        e?.id,
        e?.subscriptionPlan,
        e?.createdAt,
        e?.requests,
        e?.componentCount,
        e?.componentLimit,
        e?.boughtComponents,
        e?.templateMode
      ]);

  @override
  bool isValidKey(Object? o) => o is TeamsRecord;
}
