import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class SpeechToTextNotesRecord extends FirestoreRecord {
  SpeechToTextNotesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "note" field.
  String? _note;
  String get note => _note ?? '';
  bool hasNote() => _note != null;

  // "language" field.
  String? _language;
  String get language => _language ?? '';
  bool hasLanguage() => _language != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "updated_at" field.
  DateTime? _updatedAt;
  DateTime? get updatedAt => _updatedAt;
  bool hasUpdatedAt() => _updatedAt != null;

  // "lead_ref" field.
  DocumentReference? _leadRef;
  DocumentReference? get leadRef => _leadRef;
  bool hasLeadRef() => _leadRef != null;

  void _initializeFields() {
    _note = snapshotData['note'] as String?;
    _language = snapshotData['language'] as String?;
    _createdAt = snapshotData['created_at'] as DateTime?;
    _updatedAt = snapshotData['updated_at'] as DateTime?;
    _leadRef = snapshotData['lead_ref'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('speech_to_text_notes');

  static Stream<SpeechToTextNotesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SpeechToTextNotesRecord.fromSnapshot(s));

  static Future<SpeechToTextNotesRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => SpeechToTextNotesRecord.fromSnapshot(s));

  static SpeechToTextNotesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SpeechToTextNotesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SpeechToTextNotesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SpeechToTextNotesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SpeechToTextNotesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SpeechToTextNotesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSpeechToTextNotesRecordData({
  String? note,
  String? language,
  DateTime? createdAt,
  DateTime? updatedAt,
  DocumentReference? leadRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'note': note,
      'language': language,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'lead_ref': leadRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class SpeechToTextNotesRecordDocumentEquality
    implements Equality<SpeechToTextNotesRecord> {
  const SpeechToTextNotesRecordDocumentEquality();

  @override
  bool equals(SpeechToTextNotesRecord? e1, SpeechToTextNotesRecord? e2) {
    return e1?.note == e2?.note &&
        e1?.language == e2?.language &&
        e1?.createdAt == e2?.createdAt &&
        e1?.updatedAt == e2?.updatedAt &&
        e1?.leadRef == e2?.leadRef;
  }

  @override
  int hash(SpeechToTextNotesRecord? e) => const ListEquality()
      .hash([e?.note, e?.language, e?.createdAt, e?.updatedAt, e?.leadRef]);

  @override
  bool isValidKey(Object? o) => o is SpeechToTextNotesRecord;
}
