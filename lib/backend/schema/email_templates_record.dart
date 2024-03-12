import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class EmailTemplatesRecord extends FirestoreRecord {
  EmailTemplatesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "subject" field.
  String? _subject;
  String get subject => _subject ?? '';
  bool hasSubject() => _subject != null;

  // "body" field.
  String? _body;
  String get body => _body ?? '';
  bool hasBody() => _body != null;

  // "attachment_url" field.
  String? _attachmentUrl;
  String get attachmentUrl => _attachmentUrl ?? '';
  bool hasAttachmentUrl() => _attachmentUrl != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _subject = snapshotData['subject'] as String?;
    _body = snapshotData['body'] as String?;
    _attachmentUrl = snapshotData['attachment_url'] as String?;
    _createdAt = snapshotData['created_at'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('email_templates')
          : FirebaseFirestore.instance.collectionGroup('email_templates');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('email_templates').doc(id);

  static Stream<EmailTemplatesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EmailTemplatesRecord.fromSnapshot(s));

  static Future<EmailTemplatesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => EmailTemplatesRecord.fromSnapshot(s));

  static EmailTemplatesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      EmailTemplatesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EmailTemplatesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EmailTemplatesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EmailTemplatesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EmailTemplatesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEmailTemplatesRecordData({
  String? subject,
  String? body,
  String? attachmentUrl,
  DateTime? createdAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'subject': subject,
      'body': body,
      'attachment_url': attachmentUrl,
      'created_at': createdAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class EmailTemplatesRecordDocumentEquality
    implements Equality<EmailTemplatesRecord> {
  const EmailTemplatesRecordDocumentEquality();

  @override
  bool equals(EmailTemplatesRecord? e1, EmailTemplatesRecord? e2) {
    return e1?.subject == e2?.subject &&
        e1?.body == e2?.body &&
        e1?.attachmentUrl == e2?.attachmentUrl &&
        e1?.createdAt == e2?.createdAt;
  }

  @override
  int hash(EmailTemplatesRecord? e) => const ListEquality()
      .hash([e?.subject, e?.body, e?.attachmentUrl, e?.createdAt]);

  @override
  bool isValidKey(Object? o) => o is EmailTemplatesRecord;
}
