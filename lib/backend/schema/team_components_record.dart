import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';

class TeamComponentsRecord extends FirestoreRecord {
  TeamComponentsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "is_starter" field.
  bool? _isStarter;
  bool get isStarter => _isStarter ?? false;
  bool hasIsStarter() => _isStarter != null;

  // "list_value" field.
  List<String>? _listValue;
  List<String> get listValue => _listValue ?? const [];
  bool hasListValue() => _listValue != null;

  // "added_at" field.
  DateTime? _addedAt;
  DateTime? get addedAt => _addedAt;
  bool hasAddedAt() => _addedAt != null;

  // "type" field.
  ComponentType? _type;
  ComponentType? get type => _type;
  bool hasType() => _type != null;

  // "is_custom" field.
  bool? _isCustom;
  bool get isCustom => _isCustom ?? false;
  bool hasIsCustom() => _isCustom != null;

  // "contain_leads" field.
  List<DocumentReference>? _containLeads;
  List<DocumentReference> get containLeads => _containLeads ?? const [];
  bool hasContainLeads() => _containLeads != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _description = snapshotData['description'] as String?;
    _isStarter = snapshotData['is_starter'] as bool?;
    _listValue = getDataList(snapshotData['list_value']);
    _addedAt = snapshotData['added_at'] as DateTime?;
    _type = deserializeEnum<ComponentType>(snapshotData['type']);
    _isCustom = snapshotData['is_custom'] as bool?;
    _containLeads = getDataList(snapshotData['contain_leads']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('team_components')
          : FirebaseFirestore.instance.collectionGroup('team_components');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('team_components').doc(id);

  static Stream<TeamComponentsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TeamComponentsRecord.fromSnapshot(s));

  static Future<TeamComponentsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TeamComponentsRecord.fromSnapshot(s));

  static TeamComponentsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TeamComponentsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TeamComponentsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TeamComponentsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TeamComponentsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TeamComponentsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTeamComponentsRecordData({
  String? name,
  String? description,
  bool? isStarter,
  DateTime? addedAt,
  ComponentType? type,
  bool? isCustom,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'description': description,
      'is_starter': isStarter,
      'added_at': addedAt,
      'type': type,
      'is_custom': isCustom,
    }.withoutNulls,
  );

  return firestoreData;
}

class TeamComponentsRecordDocumentEquality
    implements Equality<TeamComponentsRecord> {
  const TeamComponentsRecordDocumentEquality();

  @override
  bool equals(TeamComponentsRecord? e1, TeamComponentsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.description == e2?.description &&
        e1?.isStarter == e2?.isStarter &&
        listEquality.equals(e1?.listValue, e2?.listValue) &&
        e1?.addedAt == e2?.addedAt &&
        e1?.type == e2?.type &&
        e1?.isCustom == e2?.isCustom &&
        listEquality.equals(e1?.containLeads, e2?.containLeads);
  }

  @override
  int hash(TeamComponentsRecord? e) => const ListEquality().hash([
        e?.name,
        e?.description,
        e?.isStarter,
        e?.listValue,
        e?.addedAt,
        e?.type,
        e?.isCustom,
        e?.containLeads
      ]);

  @override
  bool isValidKey(Object? o) => o is TeamComponentsRecord;
}
