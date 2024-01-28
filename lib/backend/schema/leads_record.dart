import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';

class LeadsRecord extends FirestoreRecord {
  LeadsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "first_name" field.
  String? _firstName;
  String get firstName => _firstName ?? '';
  bool hasFirstName() => _firstName != null;

  // "last_name" field.
  String? _lastName;
  String get lastName => _lastName ?? '';
  bool hasLastName() => _lastName != null;

  // "position_role" field.
  String? _positionRole;
  String get positionRole => _positionRole ?? '';
  bool hasPositionRole() => _positionRole != null;

  // "gender" field.
  Gender? _gender;
  Gender? get gender => _gender;
  bool hasGender() => _gender != null;

  // "language" field.
  String? _language;
  String get language => _language ?? '';
  bool hasLanguage() => _language != null;

  // "phone" field.
  String? _phone;
  String get phone => _phone ?? '';
  bool hasPhone() => _phone != null;

  // "website" field.
  String? _website;
  String get website => _website ?? '';
  bool hasWebsite() => _website != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "city" field.
  String? _city;
  String get city => _city ?? '';
  bool hasCity() => _city != null;

  // "street" field.
  String? _street;
  String get street => _street ?? '';
  bool hasStreet() => _street != null;

  // "country" field.
  String? _country;
  String get country => _country ?? '';
  bool hasCountry() => _country != null;

  // "zip_code" field.
  String? _zipCode;
  String get zipCode => _zipCode ?? '';
  bool hasZipCode() => _zipCode != null;

  // "company" field.
  String? _company;
  String get company => _company ?? '';
  bool hasCompany() => _company != null;

  // "industry" field.
  String? _industry;
  String get industry => _industry ?? '';
  bool hasIndustry() => _industry != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "lead_collected_by" field.
  DocumentReference? _leadCollectedBy;
  DocumentReference? get leadCollectedBy => _leadCollectedBy;
  bool hasLeadCollectedBy() => _leadCollectedBy != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  void _initializeFields() {
    _firstName = snapshotData['first_name'] as String?;
    _lastName = snapshotData['last_name'] as String?;
    _positionRole = snapshotData['position_role'] as String?;
    _gender = deserializeEnum<Gender>(snapshotData['gender']);
    _language = snapshotData['language'] as String?;
    _phone = snapshotData['phone'] as String?;
    _website = snapshotData['website'] as String?;
    _email = snapshotData['email'] as String?;
    _city = snapshotData['city'] as String?;
    _street = snapshotData['street'] as String?;
    _country = snapshotData['country'] as String?;
    _zipCode = snapshotData['zip_code'] as String?;
    _company = snapshotData['company'] as String?;
    _industry = snapshotData['industry'] as String?;
    _createdAt = snapshotData['created_at'] as DateTime?;
    _leadCollectedBy = snapshotData['lead_collected_by'] as DocumentReference?;
    _photoUrl = snapshotData['photo_url'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('leads');

  static Stream<LeadsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => LeadsRecord.fromSnapshot(s));

  static Future<LeadsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => LeadsRecord.fromSnapshot(s));

  static LeadsRecord fromSnapshot(DocumentSnapshot snapshot) => LeadsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static LeadsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      LeadsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'LeadsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is LeadsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createLeadsRecordData({
  String? firstName,
  String? lastName,
  String? positionRole,
  Gender? gender,
  String? language,
  String? phone,
  String? website,
  String? email,
  String? city,
  String? street,
  String? country,
  String? zipCode,
  String? company,
  String? industry,
  DateTime? createdAt,
  DocumentReference? leadCollectedBy,
  String? photoUrl,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'first_name': firstName,
      'last_name': lastName,
      'position_role': positionRole,
      'gender': gender,
      'language': language,
      'phone': phone,
      'website': website,
      'email': email,
      'city': city,
      'street': street,
      'country': country,
      'zip_code': zipCode,
      'company': company,
      'industry': industry,
      'created_at': createdAt,
      'lead_collected_by': leadCollectedBy,
      'photo_url': photoUrl,
    }.withoutNulls,
  );

  return firestoreData;
}

class LeadsRecordDocumentEquality implements Equality<LeadsRecord> {
  const LeadsRecordDocumentEquality();

  @override
  bool equals(LeadsRecord? e1, LeadsRecord? e2) {
    return e1?.firstName == e2?.firstName &&
        e1?.lastName == e2?.lastName &&
        e1?.positionRole == e2?.positionRole &&
        e1?.gender == e2?.gender &&
        e1?.language == e2?.language &&
        e1?.phone == e2?.phone &&
        e1?.website == e2?.website &&
        e1?.email == e2?.email &&
        e1?.city == e2?.city &&
        e1?.street == e2?.street &&
        e1?.country == e2?.country &&
        e1?.zipCode == e2?.zipCode &&
        e1?.company == e2?.company &&
        e1?.industry == e2?.industry &&
        e1?.createdAt == e2?.createdAt &&
        e1?.leadCollectedBy == e2?.leadCollectedBy &&
        e1?.photoUrl == e2?.photoUrl;
  }

  @override
  int hash(LeadsRecord? e) => const ListEquality().hash([
        e?.firstName,
        e?.lastName,
        e?.positionRole,
        e?.gender,
        e?.language,
        e?.phone,
        e?.website,
        e?.email,
        e?.city,
        e?.street,
        e?.country,
        e?.zipCode,
        e?.company,
        e?.industry,
        e?.createdAt,
        e?.leadCollectedBy,
        e?.photoUrl
      ]);

  @override
  bool isValidKey(Object? o) => o is LeadsRecord;
}
